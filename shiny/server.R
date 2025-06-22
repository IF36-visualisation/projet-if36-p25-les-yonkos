library(shiny)
library(tidyverse)
library(forcats)


# Lecture des données
df <- read_csv("../data/complete_ufc_data.csv", show_col_types = FALSE)

df_clean <- df %>%
  filter(outcome %in% c("fighter1", "fighter2", "Draw", "No contest")) %>%
  mutate(
    winner = case_when(outcome == "fighter1" ~ fighter1,
                       outcome == "fighter2" ~ fighter2,
                       TRUE ~ NA_character_),
    loser = case_when(outcome == "fighter1" ~ fighter2,
                      outcome == "fighter2" ~ fighter1,
                      TRUE ~ NA_character_)
  )

count_result <- function(data, col_name, result_name) {
  data %>%
    filter(!is.na(.data[[col_name]])) %>%
    count(.data[[col_name]], name = result_name) %>%
    rename(fighter = 1)
}

wins <- count_result(df_clean, "winner", "wins")
losses <- count_result(df_clean, "loser", "losses")

no_contests <- df_clean %>%
  filter(outcome == "No contest") %>%
  pivot_longer(cols = c(fighter1, fighter2), names_to = "role", values_to = "fighter") %>%
  count(fighter, name = "no_contests")

all_stats <- full_join(wins, losses, by = "fighter") %>%
  full_join(no_contests, by = "fighter") %>%
  replace_na(list(wins = 0, losses = 0, no_contests = 0)) %>%
  mutate(
    total_fights = wins + losses + no_contests,
    ratio = if_else((losses + no_contests) > 0, wins / (losses + no_contests), NA_real_)
  )

colors_results <- c("wins" = "#1b9e77", "losses" = "#d95f02", "no_contests" = "#7570b3")

server <- function(input, output) {
  
  output$topRatio <- renderPlot({
    all_stats %>%
      filter(!is.na(ratio), total_fights >= input$minFights) %>%
      slice_max(ratio, n = 10) %>%
      pivot_longer(cols = c(wins, losses, no_contests), names_to = "result", values_to = "count") %>%
      mutate(result = factor(result, levels = c("no_contests", "losses", "wins"))) %>%
      ggplot(aes(x = reorder(fighter, ratio), y = count, fill = result)) +
      geom_col() +
      coord_flip() +
      labs(x = "Combattant", y = "Nombre de combats", fill = "Résultat") +
      theme_minimal(base_size = 18) +
      theme(
        plot.title = element_text(face = "bold", size = 22, color = "#3498db", hjust = 0.5),
        plot.subtitle = element_text(size = 16, color = "#1b9e77", hjust = 0.5),
        axis.title.x = element_text(face = "bold", size = 17),
        axis.title.y = element_text(face = "bold", size = 17),
        axis.text.x = element_text(size = 15),
        axis.text.y = element_text(size = 15),
        legend.title = element_text(face = "bold", size = 16),
        legend.text = element_text(size = 15)
      ) +
      scale_fill_manual(values = colors_results,
                        labels = c("No Contest", "Défaites", "Victoires"))
  })
  
  # Préparation des données pour la longévité/dommages
  fighter_stats <- df %>%
    select(event_date, fighter1, fighter2, round, 
           fighter1_sig_strikes_absorbed_pm, fighter2_sig_strikes_absorbed_pm) %>%
    mutate(event_date = as.Date(event_date)) %>%
    pivot_longer(cols = c(fighter1, fighter2), names_to = "role", values_to = "fighter") %>%
    mutate(
      sig_strikes_absorbed_pm = if_else(role == "fighter1", fighter1_sig_strikes_absorbed_pm, fighter2_sig_strikes_absorbed_pm),
      rounds = round,
      # coups absorbés dans ce combat = coups/min * nb rounds * 5 min/round
      sig_strikes_absorbed_this_fight = sig_strikes_absorbed_pm * ifelse(is.na(rounds), 0, rounds) * 5
    ) %>%
    filter(!is.na(fighter) & fighter != "" & !is.na(event_date)) %>%
    group_by(fighter) %>%
    summarise(
      num_fights = n(),
      avg_sig_strikes_absorbed_pm = mean(sig_strikes_absorbed_pm, na.rm = TRUE),
      avg_sig_strikes_absorbed_per_fight = mean(sig_strikes_absorbed_this_fight, na.rm = TRUE),
      total_sig_strikes_absorbed = sum(sig_strikes_absorbed_this_fight, na.rm = TRUE),
      first_fight = min(event_date, na.rm = TRUE),
      last_fight = max(event_date, na.rm = TRUE)
    ) %>%
    mutate(
      career_duration_years = as.numeric(difftime(last_fight, first_fight, units = "days")) / 365.25
    ) %>%
    filter(num_fights > 0, is.finite(career_duration_years), career_duration_years > 0)
  
  output$damagePlot <- renderPlot({
    req(input$damage_type)
    ylab <- "Durée de Carrière (Années)"
    xlab <- switch(input$damage_type,
                   "pm" = "Moy. Coups Significatifs Absorbés / Minute",
                   "per_fight" = "Moy. Coups Significatifs Absorbés / Combat",
                   "total" = "Total Coups Significatifs Absorbés en Carrière"
    )
    xvar <- switch(input$damage_type,
                   "pm" = fighter_stats$avg_sig_strikes_absorbed_pm,
                   "per_fight" = fighter_stats$avg_sig_strikes_absorbed_per_fight,
                   "total" = fighter_stats$total_sig_strikes_absorbed
    )
    ggplot(fighter_stats, aes(x = xvar, y = career_duration_years)) +
      geom_point(alpha = 0.3, shape = 16, color = "#1b9e77") +
      geom_smooth(method = "loess", col = "#d95f02", se = FALSE, span = 0.75) +
      labs(
        subtitle = xlab,
        x = xlab,
        y = ylab
      ) +
      theme_minimal(base_size = 15) +
      coord_cartesian(
        ylim = c(0, NA),
        xlim = switch(input$damage_type,
                      "pm" = c(0, 10),
                      "per_fight" = c(0, 125),
                      "total" = c(0, 1750)
        )
      ) +
      theme(
        plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
        plot.subtitle = element_text(size = 13, hjust = 0.5, margin = margin(b = 10)),
        axis.title.x = element_text(face = "bold", margin = margin(t = 10)),
        axis.title.y = element_text(face = "bold", margin = margin(r = 10)),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.y = element_blank()
      )
  })
}


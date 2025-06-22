library(shiny)
library(tidyverse)
library(forcats)


# Lecture des données
df <- read_csv("../data/complete_ufc_data.csv", show_col_types = FALSE)

all_stats <- df %>%
  pivot_longer(cols = c(fighter1, fighter2), names_to = "role", values_to = "fighter") %>%
  filter(!is.na(fighter) & fighter != "") %>%
  group_by(fighter) %>%
  summarise(
    wins = sum((role == "fighter1" & winner == "fighter1") | (role == "fighter2" & winner == "fighter2"), na.rm = TRUE),
    losses = sum((role == "fighter1" & winner == "fighter2") | (role == "fighter2" & winner == "fighter1"), na.rm = TRUE),
    no_contests = sum(winner == "no contest", na.rm = TRUE),
    total_fights = n()
  ) %>%
  mutate(
    ratio = if_else((losses + no_contests) > 0, wins / (losses + no_contests), NA_real_)
  )
  
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
      theme_minimal() +
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


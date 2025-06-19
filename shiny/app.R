library(shiny)
library(tidyverse)
library(forcats)

# Charge le ui depuis ui.R
source("ui.R")

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
      theme_minimal() +
      scale_fill_manual(values = colors_results,
                        labels = c("No Contest", "Défaites", "Victoires"))
  })
}

shinyApp(ui = ui, server = server)

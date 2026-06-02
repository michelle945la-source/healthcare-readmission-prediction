############################################################
# Project: Diabetes 30-Day Readmission Portfolio Project
# Script: 01_import_clean.R
# Purpose: Import the raw diabetes readmission dataset, inspect
#          structure, standardize missing values, derive the
#          primary 30-day readmission outcome, and save an
#          initial cleaned dataset.
############################################################

# -----------------------------
# 1. Setup
# -----------------------------

# Clear environment
rm(list = ls())

# Set working directory
# Note: This is used for local development. If sharing the project,
# run the script from the project root folder.
setwd("~/Desktop/healthcare-readmission-prediction")

# Confirm working directory
getwd()

# Load packages
library(readr)
library(dplyr)
library(tidyr)
library(janitor)

# -----------------------------
# 2. Define file paths
# -----------------------------

raw_data_path <- "data/raw/diabetic_data.csv"
processed_data_path <- "data/processed/diabetes_readmission_cleaned.csv"

# Check whether raw data exists
if (!file.exists(raw_data_path)) {
  stop("Raw data file not found. Please save diabetic_data.csv in data/raw/.")
}

# -----------------------------
# 3. Import raw data
# -----------------------------

# Note:
# The raw CSV file should be downloaded from the UCI Machine Learning Repository
# and saved locally as:
# data/raw/diabetic_data.csv
#
# The raw data file is intentionally ignored by Git and should not be pushed
# to GitHub unless redistribution rules are reviewed.

diabetes_raw <- read_csv(
  raw_data_path,
  na = c("", "NA", "N/A", "?"),
  show_col_types = FALSE
)

# -----------------------------
# 4. Initial inspection
# -----------------------------

glimpse(diabetes_raw)

cat("\nNumber of rows:", nrow(diabetes_raw), "\n")
cat("Number of columns:", ncol(diabetes_raw), "\n")

# Check column names
names(diabetes_raw)

# -----------------------------
# 5. Clean variable names
# -----------------------------

diabetes_clean <- diabetes_raw %>%
  clean_names()

# -----------------------------
# 6. Derive primary outcome
# -----------------------------

diabetes_clean <- diabetes_clean %>%
  mutate(
    readmit_30 = case_when(
      readmitted == "<30" ~ 1,
      readmitted %in% c(">30", "NO") ~ 0,
      TRUE ~ NA_real_
    )
  )

# Check outcome distribution
diabetes_clean %>%
  count(readmitted, readmit_30)

diabetes_clean %>%
  count(readmit_30) %>%
  mutate(percent = round(n / sum(n) * 100, 1))

# -----------------------------
# 7. Basic missingness summary
# -----------------------------

missing_summary <- diabetes_clean %>%
  summarise(across(everything(), ~ sum(is.na(.)))) %>%
  pivot_longer(
    cols = everything(),
    names_to = "variable",
    values_to = "missing_n"
  ) %>%
  mutate(
    missing_percent = round(missing_n / nrow(diabetes_clean) * 100, 1)
  ) %>%
  arrange(desc(missing_percent))

print(missing_summary, n = 50)

# -----------------------------
# 8. Save cleaned data
# -----------------------------

write_csv(diabetes_clean, processed_data_path)

cat("\nInitial cleaned dataset saved to:", processed_data_path, "\n")

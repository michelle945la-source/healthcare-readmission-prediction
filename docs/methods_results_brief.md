# Methods and Preliminary Results Brief

## Project Title

Predicting 30-Day Hospital Readmission Among Patients With Diabetes Using Public Hospital Encounter Data

## Current Project Stage

This document summarizes the initial data import, structure review, outcome derivation, and missingness assessment for the diabetes readmission portfolio project. These results are preliminary and will be updated as additional variable derivation, descriptive analysis, and modeling steps are completed.

## Data Source and Unit of Analysis

The project uses the Diabetes 130-US hospitals dataset from the UCI Machine Learning Repository. The unit of analysis is a hospital encounter among patients with diabetes.

The raw dataset was imported from `data/raw/diabetic_data.csv`. The initial import confirmed that the dataset contains 101,766 encounters and 50 columns. The variables include encounter identifiers, patient identifiers, demographic characteristics, admission and discharge information, utilization measures, diagnosis fields, laboratory-related variables, medication variables, diabetes medication status, and readmission status.

## Initial Data Import

The raw CSV file was imported using `read_csv()` in R. Missing or unknown values coded as blank strings, `NA`, `N/A`, or `?` were standardized to `NA` during import.

After import, variable names were cleaned using `janitor::clean_names()` to improve consistency for downstream analysis. For example, medication combination variables with hyphens were converted to underscore-based names.

## Primary Outcome Definition

The primary outcome is 30-day hospital readmission.

The original `readmitted` variable contains three categories:

* `<30`: readmitted within 30 days
* `>30`: readmitted after 30 days
* `NO`: not readmitted

A binary outcome variable, `readmit_30`, was created as follows:

* `readmit_30 = 1` for encounters with `readmitted == "<30"`
* `readmit_30 = 0` for encounters with `readmitted == ">30"` or `readmitted == "NO"`

## Outcome Distribution

The initial outcome distribution showed:

| Readmission Category | Binary Coding | Number of Encounters |
| -------------------- | ------------: | -------------------: |
| `<30`                |             1 |               11,357 |
| `>30`                |             0 |               35,545 |
| `NO`                 |             0 |               54,864 |

After binary recoding, 11,357 encounters were classified as 30-day readmissions, representing 11.2% of the dataset. The remaining 90,409 encounters, or 88.8%, were classified as not having a 30-day readmission.

This indicates that the outcome is imbalanced, with substantially fewer 30-day readmissions than non-readmissions. This imbalance should be considered during model evaluation, especially when interpreting accuracy, sensitivity, specificity, and threshold-based classification results.

## Initial Missingness Assessment

The initial missingness assessment identified several variables with notable missingness:

| Variable            | Missing Count | Missing Percent |
| ------------------- | ------------: | --------------: |
| `weight`            |        98,569 |           96.9% |
| `medical_specialty` |        49,949 |           49.1% |
| `payer_code`        |        40,256 |           39.6% |
| `race`              |         2,273 |            2.2% |
| `diag_3`            |         1,423 |            1.4% |
| `diag_2`            |           358 |            0.4% |

The `weight` variable has extremely high missingness and will not be used as a primary predictor in the main model. `medical_specialty` and `payer_code` also have substantial missingness and will be excluded from the initial main modeling workflow. These variables may be reconsidered later for exploratory or sensitivity analyses if appropriate.

The `race` variable has moderate missingness at 2.2%. For the initial analysis, missing race values may be coded as an “Unknown” category rather than excluding those encounters. This approach preserves sample size and makes the missingness transparent.

Diagnosis variables have relatively low missingness, especially `diag_2` and `diag_3`, and may be used after appropriate diagnosis grouping.

## Preliminary Analytic Decisions

Based on the initial data review, the following preliminary decisions were made:

1. `readmit_30` will be used as the primary binary outcome.
2. `weight` will be excluded from the main analysis because of extremely high missingness.
3. `payer_code` and `medical_specialty` will be excluded from the initial main model because of substantial missingness.
4. `race` will be retained, with missing values likely coded as `Unknown`.
5. The analysis will prioritize interpretable models before optional machine learning comparisons.
6. Logistic regression will be the primary modeling approach.
7. Model performance will not rely on accuracy alone because the outcome is imbalanced.

## Planned Next Steps

The next script, `02_variable_derivation.R`, will focus on creating analysis-ready variables, including:

* cleaned demographic variables
* missingness indicators or “Unknown” categories where appropriate
* age group handling
* utilization-related variables
* diagnosis group variables
* medication/treatment indicators
* final analytic variable selection

After variable derivation, the project will proceed to descriptive Table 1 construction and staged logistic regression modeling.

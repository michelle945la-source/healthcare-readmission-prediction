# Healthcare Readmission Prediction Portfolio Project

## Working Title

Predicting 30-Day Hospital Readmission Among Patients With Diabetes Using Public Hospital Encounter Data

## Project Overview

This is a public, reproducible health data portfolio project focused on predicting 30-day hospital readmission among patients with diabetes using publicly available hospital encounter data.

The project is designed to demonstrate an end-to-end clinical analytics workflow, including:

- data source review
- data cleaning
- variable derivation
- descriptive analysis
- logistic regression modeling
- model evaluation
- interpretation for healthcare analytics and quality improvement

## Research Question

Among hospitalized patients with diabetes, which demographic, clinical, utilization, and treatment-related factors are associated with 30-day hospital readmission?

## Primary Outcome

30-day hospital readmission.

The planned binary outcome is:

- `readmit_30 = 1` if `readmitted == "<30"`
- `readmit_30 = 0` if `readmitted == ">30"` or `readmitted == "NO"`

## Planned Data Source

UCI Machine Learning Repository: Diabetes 130-US hospitals for years 1999–2008.

## Repository Structure

```text
healthcare-readmission-prediction/
├── README.md
├── data/
│   ├── raw/
│   │   └── README_data_source.md
│   ├── processed/
├── code/
│   ├── 01_import_clean.R
│   ├── 02_variable_derivation.R
│   ├── 03_descriptive_table1.R
│   ├── 04_logistic_models.R
│   ├── 05_model_evaluation.R
│   ├── 06_figures.R
├── outputs/
├── docs/
│   ├── analytic_plan.md
│   ├── data_dictionary.md
│   ├── methods_results_brief.md
│   ├── interview_talking_points.md
└── .gitignore

## 3. 写 `analytic_plan.md`

复制：

```bash
cat > docs/analytic_plan.md <<'EOF'
# Analytic Plan

## Project Title

Predicting 30-Day Hospital Readmission Among Patients With Diabetes Using Public Hospital Encounter Data

## Research Question

Among hospitalized patients with diabetes, which demographic, clinical, utilization, and treatment-related factors are associated with 30-day hospital readmission?

## Data Source

Planned data source: UCI Diabetes 130-US hospitals dataset.

## Study Population

Hospital encounters for patients with diabetes.

Planned inclusion and exclusion criteria will be finalized after reviewing the dataset documentation.

## Outcome Variable

Primary outcome: 30-day hospital readmission.

Planned coding:

- `readmit_30 = 1` if readmitted within 30 days
- `readmit_30 = 0` if readmitted after 30 days or not readmitted

## Predictor Domains

Planned predictor domains:

1. Demographics
   - age
   - race
   - sex

2. Encounter and utilization factors
   - admission type
   - discharge disposition
   - admission source
   - time in hospital
   - number of lab procedures
   - number of procedures
   - number of medications
   - number of outpatient visits
   - number of emergency visits
   - number of inpatient visits

3. Clinical factors
   - primary diagnosis group
   - number of diagnoses
   - A1C result
   - max glucose serum

4. Medication and treatment factors
   - insulin use
   - medication change
   - diabetes medication use

## Descriptive Analysis

Planned descriptive outputs:

- sample size
- outcome distribution
- missingness summary
- Table 1 by 30-day readmission status
- key variable distributions

## Modeling Plan

Main model: logistic regression.

Planned staged models:

- Model 1: demographics and utilization variables
- Model 2: add clinical diagnosis variables
- Model 3: add medication and treatment variables

Optional model comparison:

- LASSO logistic regression
- random forest

These optional models will only be added after the main interpretable logistic regression workflow is complete.

## Model Evaluation

Planned evaluation metrics:

- AUROC
- confusion matrix
- sensitivity
- specificity
- calibration plot
- threshold discussion

## Limitations to Address

Potential limitations:

- observational data
- encounter-level rather than patient-level interpretation
- historical data from 1999–2008
- possible repeated encounters per patient
- missing or unknown categories
- limited causal interpretation

## Planned Deliverables

- clean README
- analytic plan
- data dictionary
- descriptive Table 1
- logistic regression results
- model evaluation figures
- short methods/results brief
- interview talking points

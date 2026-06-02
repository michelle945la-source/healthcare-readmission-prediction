# Data Dictionary

This document tracks planned variables for the diabetes readmission portfolio project.

## Outcome Variable

| Variable | Source Variable | Planned Coding | Notes |
|---|---|---|---|
| `readmit_30` | `readmitted` | 1 = readmitted within 30 days; 0 = readmitted after 30 days or not readmitted | Primary binary outcome |

## Demographic Variables

| Variable | Source Variable | Planned Coding | Notes |
|---|---|---|---|
| `age_group` | `age` | Keep original age categories initially | May later collapse sparse groups |
| `race` | `race` | Keep original categories; review missing/unknown | Missingness likely important |
| `sex` | `gender` | Female / Male / Unknown if present | Check coding in raw data |

## Encounter and Utilization Variables

| Variable | Source Variable | Planned Coding | Notes |
|---|---|---|---|
| `time_in_hospital` | `time_in_hospital` | Continuous or categorical | Consider nonlinear relationship |
| `num_lab_procedures` | `num_lab_procedures` | Continuous | Utilization intensity |
| `num_procedures` | `num_procedures` | Continuous | Procedure burden |
| `num_medications` | `num_medications` | Continuous | Medication burden |
| `number_outpatient` | `number_outpatient` | Continuous or categorized | Prior outpatient utilization |
| `number_emergency` | `number_emergency` | Continuous or categorized | Prior emergency utilization |
| `number_inpatient` | `number_inpatient` | Continuous or categorized | Prior inpatient utilization |
| `admission_type_id` | `admission_type_id` | To be mapped using source documentation | Requires ID mapping |
| `discharge_disposition_id` | `discharge_disposition_id` | To be mapped using source documentation | Important for exclusions |
| `admission_source_id` | `admission_source_id` | To be mapped using source documentation | Requires ID mapping |

## Clinical Variables

| Variable | Source Variable | Planned Coding | Notes |
|---|---|---|---|
| `diag_1` | `diag_1` | Group into broad diagnosis categories | ICD grouping needed |
| `diag_2` | `diag_2` | Group into broad diagnosis categories | Secondary diagnosis |
| `diag_3` | `diag_3` | Group into broad diagnosis categories | Additional diagnosis |
| `number_diagnoses` | `number_diagnoses` | Continuous | Comorbidity proxy |
| `max_glu_serum` | `max_glu_serum` | Review categories | May include missing/not measured |
| `A1Cresult` | `A1Cresult` | Review categories | May include missing/not measured |

## Medication and Treatment Variables

| Variable | Source Variable | Planned Coding | Notes |
|---|---|---|---|
| `insulin` | `insulin` | No / Steady / Up / Down | Diabetes treatment marker |
| `change` | `change` | Change vs no change | Medication adjustment |
| `diabetesMed` | `diabetesMed` | Yes / No | Diabetes medication use |

## Missing Data Notes

The dataset may use `"?"` to indicate missing or unknown values. These should be converted to `NA` during import and reviewed before modeling.

## Version Notes

This data dictionary is a working document and will be updated after inspecting the raw dataset and source documentation.

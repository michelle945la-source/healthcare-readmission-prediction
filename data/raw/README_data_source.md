# Data Source

## Dataset

Diabetes 130-US hospitals for years 1999–2008

## Source

UCI Machine Learning Repository

## Project Use

This dataset will be used for a public health data portfolio project focused on predicting 30-day hospital readmission among hospitalized patients with diabetes.

## Unit of Analysis

The unit of analysis is a hospital encounter.

## Planned Outcome

The primary outcome is 30-day hospital readmission.

Planned coding:

- `readmit_30 = 1` if `readmitted == "<30"`
- `readmit_30 = 0` if `readmitted == ">30"` or `readmitted == "NO"`

## Data Storage Rule

Raw data files should not be committed to GitHub unless redistribution is clearly allowed by the data source license.

This repository will prioritize:

- source documentation
- reproducible code
- derived variable definitions
- non-sensitive outputs
- analytic interpretation

## Notes

The raw dataset may include coded demographic, clinical, encounter, medication, and utilization variables. Missing or unknown values should be carefully reviewed before analysis.

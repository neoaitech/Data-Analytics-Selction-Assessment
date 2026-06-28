# NeoAI Tech Internship Selection Assessment - Data Analytics Task

## Objective
Analyze a hospital patient dataset to answer business and patient demographics questions
related to treatment costs, department revenue, insurance coverage, and patient outcomes,
and present the findings with clear visualizations and insights.

## Tools Used
- Python
- Pandas
- Matplotlib
- Jupyter Notebook (Google Colab)

## Dataset Description
File: `healthcare_realistic_dataset_515_rows.xlsx`

The dataset contains 515 patient records with 15 columns, including:
- Patient details: `Patient_ID`, `Age`, `Gender`, `Blood_Group`, `Height_cm`, `Weight_kg`, `BMI`
- Treatment details: `Disease`, `Department`, `City`, `Admission_Date`, `Discharge_Date`, `Treatment_Cost`
- Other: `Insurance_Status`, `Outcome`

The dataset includes some duplicate records and a small number of missing values across
a few columns, which were handled as part of the analysis.

## Steps Performed
1. Loaded the dataset and reviewed its shape, columns, and data types.
2. Checked for missing values and duplicate records.
3. Removed duplicate records (15 duplicate rows found and removed).
4. Performed exploratory data analysis to understand the overall distribution of diseases,
   outcomes, and patient age.
5. Answered 5 business analysis questions related to treatment cost, department revenue,
   and insurance coverage.
6. Answered 4 patient demographics questions related to age groups, gender, and blood group.
7. Visualized each analysis using appropriate Matplotlib charts (bar, horizontal bar, and pie charts).
8. Summarized key insights and conclusions from the analysis.

## Summary of Findings
- Asthma, Heart Disease, and Arthritis are the diseases with the highest total treatment cost.
- Neurology and Oncology are the highest revenue-generating departments.
- Insured patients account for about 51 percent of total treatment cost.
- Delhi has the highest average treatment cost per patient.
- Patients aged 60 and above contribute the highest total healthcare expenditure.
- The most common disease varies by age group, shifting from Asthma in younger patients to
  Pneumonia in patients aged 60 and above.
- There is no significant difference in average treatment cost between male and female patients.
- Blood group AB- has the highest rate of critical outcomes among all blood groups.

## Folder Structure
```
.
├── Healthcare_Data_Analysis.ipynb     # Main analysis notebook
├── healthcare_realistic_dataset_515_rows.xlsx   # Dataset used for analysis
├── README.md                          # Project overview (this file)
└── Data_Analytics_Report.pdf                          # Detailed analysis report
```

## How to Run the Notebook
1. Open `Healthcare_Data_Analysis.ipynb` in Google Colab or Jupyter Notebook.
2. Make sure `healthcare_realistic_dataset_515_rows.xlsx` is in the same directory as the
   notebook (or upload it to the Colab session when prompted).
3. Run all cells from top to bottom. No additional setup is required, as the notebook only
   uses Pandas and Matplotlib.

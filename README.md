# 🏥 Medical Data History – Patient Trends & Insights
 
A comprehensive Power BI dashboard for analyzing patient demographics, hospital admissions, obesity patterns, and regional health trends — empowering data-driven decisions in the healthcare sector.


## 📝 Project Description

This Power BI project explores and visualizes hospital records to uncover trends related to patient demographics, admission patterns, and health indicators such as obesity. The dashboard provides a quick, interactive overview to help healthcare providers and administrators make informed decisions for patient care, hospital resource planning, and regional outreach.


## 🧰 Tech Stack

**Excel** – Used for initial formatting and data preparation  
**Power BI Desktop** – Main platform for data visualization and dashboard design  
**Power Query** – Used for transforming, filtering, and cleaning the data  
**DAX (Data Analysis Expressions)** – Applied for calculated columns, measures, and KPIs  
**SQL (MySQL Workbench)** – 30+ queries written to extract and explore relational data  
**File Formats** – `.pbix` (Power BI), `.sql` (queries), `.png` (dashboard screenshot)


## 📁 Data Source

Relational database consisting of the following tables:

| **Table Name**       | **Description** |
|----------------------|-----------------|
| `patients`           | Patient demographics: `patient_id`, `date_of_birth`, `gender`, `province_name`, `is_obese` |
| `admissions`         | Admission records: `admission_id`, `patient_id`, `doctor_id`, `admission_date`, `discharge_date` |
| `doctors`            | Doctor details: `doctor_id`, `doctor_name`, `specialty` |
| `province_names`     | Reference table for patient province names and mapping |


## 🔎 Business Problem

Healthcare organizations often manage large volumes of patient data without clear insights into regional trends, demographic-based health risks, or diagnosis patterns. This lack of clarity limits their ability to make strategic, data-informed decisions for improving healthcare delivery.


## 🎯 Goal

To design an interactive dashboard that presents key patient and hospital insights — including admissions, diagnoses, demographics, and regional distributions — to assist hospital staff and decision-makers in optimizing healthcare services.


## 📈 Key Visuals Overview

📌 **KPI Cards:** Total Patients, Total Admissions, Same-Day Discharges, Most Common Diagnosis  
🌍 **Bar Chart:** Geographic Distribution of Patients (by province)  
👥 **Pie Chart:** Gender-wise distribution  
📅 **Bar Chart:** Age Group-wise Admission Analysis  
⚖️ **Table:** Obesity Status among patients  
🔄 **Slicers:** Gender, Province, Age Group filters for interactive drill-down


## 💼 Business Impact & Insights

Improve planning for patient load and discharges  
Identify high-risk or high-volume regions (e.g., provinces with more patients)  
Detect prevalent health conditions like **Congestive Heart Failure**  
Understand obesity trends and age-related admission patterns  
Support better doctor allocation and province-level outreach


## 📊 Power BI Dashboard Overview

![Dashboard Preview](https://github.com/Kritika-N-Khanna/Medical-Data-History/blob/main/Medical%20Data%20History%20Dashboard.png)


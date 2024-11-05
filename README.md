# Crowdfunding Analytics Platform

## Overview
This project focuses on developing an analytics platform for a crowdfunding website, aimed at improving user experience and optimizing funding strategies. By utilizing various data visualization tools, this project provides insights into user engagement, funding trends, and campaign performance.

## Technologies Used
- **Excel**: Data analysis and dashboard creation
- **Power BI**: Interactive data visualizations
- **Tableau**: Visualizing funding trends and performance metrics
- **MySQL**: Database management and SQL queries for data extraction

## Key Features
- **Data Analysis**: 
  - Extracted and transformed data using SQL to manage large datasets efficiently.
  - Conducted in-depth analysis to identify patterns and trends within the crowdfunding data.

- **Interactive Dashboards**: 
  - Created dynamic dashboards in Excel, Power BI, and Tableau to visualize key metrics such as:
    - User engagement statistics
    - Funding trends across different campaigns
    - Performance metrics by demographic segments

- **Reporting and Insights**: 
  - Developed comprehensive reports to present findings to stakeholders.
  - Provided actionable insights to support strategic decision-making and operational improvements.
 
To Download the datasets, please go through "https://drive.google.com/file/d/1NjpBq3Qzc1IU4OdEGa3Ky_cex2u1ZwvU/view?usp=sharing"

The Requirements goes as follows:
1. Convert the Date fields to Natural Time ( Currently the dates are in Epoch time Read the attached Artical for Reference on Epoch Time 
             https://www.epochconverter.com/ )
2. Build a Calendar Table using the Date Column Created Date ( Which has Dates from Minimum Dates and Maximum Dates)
  Add all the below Columns in the Calendar Table using the Formulas.
   - A.Year
   - B.Monthno
   - C.Monthfullname
   - D.Quarter(Q1,Q2,Q3,Q4)
   - E. YearMonth ( YYYY-MMM)
   - F. Weekdayno
   - G.Weekdayname
   - H.FinancialMOnth ( April = FM1, May= FM2  &. March = FM12)
   - I. Financial Quarter ( Quarters based on Financial Month FQ-1 . FQ-2..)

3. Build the Data Model using the attached Excel Files.  -- using powerPivot

4. Convert the Goal amount into USD using the Static USD Rate.

5. Projects Overview KPI :
     - Total Number of Projects based on outcome 
     - Total Number of Projects based on Locations
     - Total Number of Projects based on  Category
     - Total Number of Projects created by Year , Quarter , Month

6.  Successful Projects
     - Amount Raised 
     - Number of Backers
     - Avg NUmber of Days for successful projects

7 . Top Successful Projects :
    - Based on Number of Backers
    - Based on Amount Raised.

8. Percentage of Successful Projects overall
   - Percentage of Successful Projects  by Category
   - Percentage of Successful Projects by Year , Month etc..
   - Percentage of Successful projects by Goal Range ( decide the range as per your need )




## Getting Started
To run this project locally, follow these steps:

1. Clone the repository:

2. Set up the database:
   - Import the provided SQL scripts into your MySQL database.

3. Open the dashboards in Excel, Power BI, or Tableau to view and interact with the data.

## Contributing
Contributions are welcome! If you have suggestions or improvements, please feel free to create a pull request or open an issue.



# 📋Sales Data Analysis with SQL

## 📌 Project Overview

This project showcases SQL-based analysis on a sample dataset from a fictional food delivery platform, **Zomato**, covering user signups, sales data, product pricing, and loyalty membership (Gold Program). The goal is to extract actionable insights using structured queries, leveraging core SQL concepts such as **JOINS**, **WINDOW FUNCTIONS**, **AGGREGATIONS**, and **FILTERING**.

---

## 🗂️ Datasets Used

* **users**: Contains user ID and signup date.
* **goldusers\_signup**: Tracks which users joined the Gold program and when.
* **zomato\_sales**: Logs product purchases made by users, with purchase dates and product IDs.
* **product**: Maps product ID to product name and price.

---

## 🔍 Key SQL Analyses Performed

### 1. **Total Spend per Customer**

Calculated total amount spent by each customer by joining sales data with product pricing.

### 2. **Customer Visit Frequency**

Identified how many **distinct days** each customer visited Zomato.

### 3. **First Product Purchased**

Used **RANK()** window function to determine the very first item bought by each user.

### 4. **Most Purchased Product Overall**

Identified the most frequently ordered product across all users.

### 5. **Top Product per Customer**

Determined which product each customer ordered the most using **RANK() OVER(PARTITION BY)** logic.

### 6. **First Purchase After Gold Membership**

Analyzed which product a customer purchased **immediately after** joining the Gold program.

### 7. **Last Purchase Before Gold Membership**

Determined the product purchased **just before** the user became a Gold member.

### 8. **Pre-Membership Order Summary**

Computed **total orders** and **total spend** made by each user **before** enrolling in the Gold program.

---

## 🛠️ SQL Concepts Used

* `JOINs` (INNER, LEFT)
* `GROUP BY` and Aggregation Functions (`SUM`, `COUNT`)
* `DISTINCT` and Filtering
* `WINDOW FUNCTIONS` (`RANK()`, `ROW_NUMBER()`)
* Subqueries & Aliasing for complex data logic

---

## 📈 Objective

To demonstrate the ability to handle real-world SQL business questions by:

* Identifying customer behavior trends
* Measuring product popularity
* Tracking user loyalty transitions
* Practicing clean, efficient SQL for descriptive analysis

---

## ✅ Skills Demonstrated

* Data Analysis using SQL
* Business Logic Implementation
* E-commerce & Subscription-Based Data Modeling
* Intermediate SQL (Joins, Window Functions, Aggregations)

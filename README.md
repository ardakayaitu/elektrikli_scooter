# Multi-Period Electric Scooter Production Optimization

## Project Overview
This project focuses on developing a mathematical optimization model for a multi-period (3-month) electric scooter production system. The primary objective is to maximize the total net profit of a manufacturing facility by optimizing production, inventory, and sales decisions across nine different scooter models.

The model addresses a complex production environment involving three distinct series (**Urban, Pro, Premium**) and three models per series (**Compact, Standard, Long-Range**).

## Problem Definition
The optimization task involves balancing conflicting objectives: maximizing sales revenue while minimizing penalty costs for unmet demand, inventory holding costs, and production rate transition costs.

### Key Constraints:
* **Production Lines:** Three different production lines with specific monthly time capacities.
* **Labor Capacity:** Total available man-minutes per month based on technician count and efficiency.
* **Material Management:** Limited availability of raw materials (Aluminum, Composite, Carbon Fiber) across the planning horizon.
* **Market Rules:** Strict production quotas for different series/models and a cap on sales exceeding 110% of monthly demand.
* **Inventory Policy:** Managing finished goods stock between months, including a mandatory safety stock of 15% of the next month's demand.

## Methodology & Tools
The project utilizes **Linear Programming (LP)** to reach an optimal solution. Two different modeling environments were employed to validate and solve the problem:

* **GAMS (General Algebraic Modeling System):** Used for the complex, multi-period formulation to handle large-scale variables and multi-dimensional indices.
* **Excel Solver:** Utilized for the initial single-period baseline analysis and sensitivity testing.

## Key Findings & Results
* **Optimal Profit:** The multi-period model achieved a total net profit of **$1,453,523.71** over the three-month horizon.
* **Bottleneck Identification:** The analysis revealed that **Line 3** was the primary operational bottleneck, operating at 100% capacity in all months.
* **Resource Efficiency:** By shifting from a single-period to a multi-period approach, labor utilization was significantly improved from **62.9%** to **98.7%**.
* **Strategic Stocking:** The model strategically utilized inventory to mitigate demand penalties in future months, despite holding costs set at 10% of unit profit.

## Authors
* **Arda Kaya**
* **Ahmetcan Ul**
* **Aleyna Baysal**

---
*This project was developed for the **END331: Operations Research I** course at **Istanbul Technical University**.*

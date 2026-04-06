# Multi-Period Electric Scooter Production Optimization

## Project Overview
[cite_start]This project focuses on developing a mathematical optimization model for a multi-period (3-month) electric scooter production system[cite: 121, 126]. [cite_start]The primary objective is to maximize the total net profit of a manufacturing facility by optimizing production, inventory, and sales decisions across nine different scooter models[cite: 130, 131, 151].

[cite_start]The model addresses a complex production environment involving three distinct series (**Urban, Pro, Premium**) and three models per series (**Compact, Standard, Long-Range**)[cite: 124, 125].

## Problem Definition
[cite_start]The optimization task involves balancing conflicting objectives: maximizing sales revenue while minimizing penalty costs for unmet demand, inventory holding costs, and production rate transition costs[cite: 152, 155].

### Key Constraints:
* [cite_start]**Production Lines:** Three different production lines with specific monthly time capacities[cite: 28, 184].
* [cite_start]**Labor Capacity:** Total available man-minutes per month based on technician count and efficiency (245,760 man-minutes)[cite: 40, 182].
* [cite_start]**Material Management:** Limited availability of raw materials (Aluminum, Composite, Carbon Fiber) across the planning horizon[cite: 127, 167].
* [cite_start]**Market Rules:** Strict production quotas for different series/models and a cap on sales exceeding 110% of monthly demand[cite: 170, 191, 192].
* [cite_start]**Inventory Policy:** Managing finished goods stock between months, including a mandatory safety stock of 15% of the next month's demand[cite: 157, 178, 179].

## Methodology & Tools
[cite_start]The project utilizes **Linear Programming (LP)** to reach an optimal solution[cite: 11, 90]. Two different modeling environments were employed to validate and solve the problem:

* [cite_start]**GAMS (General Algebraic Modeling System):** Used for the complex, multi-period formulation to handle large-scale variables and multi-dimensional indices[cite: 141, 142, 198].
* [cite_start]**Excel Solver:** Utilized for the initial single-period (June) baseline analysis and sensitivity testing[cite: 93].

## Key Findings & Results
* [cite_start]**Optimal Profit:** The multi-period model achieved a total net profit of **$1,453,523.71** over the three-month horizon[cite: 234, 235].
* [cite_start]**Bottleneck Identification:** The analysis revealed that **Line 3** was the primary operational bottleneck, operating at 100% capacity (19,200 minutes) in all months[cite: 200, 201, 212].
* [cite_start]**Resource Efficiency:** By shifting from a single-period to a multi-period approach, labor utilization in June was significantly improved from **62.9%** to **98.7%**[cite: 98, 252, 253].
* [cite_start]**Strategic Stocking:** The model strategically utilized inventory to mitigate demand penalties in future months, even though holding costs were set at 10% of unit profit[cite: 153, 226, 246].

## Authors
* [cite_start]**Arda Kaya** [cite: 8]
* [cite_start]**Ahmetcan Ul** [cite: 9]
* [cite_start]**Aleyna Baysal** [cite: 10]

---
[cite_start]*This project was developed for the **END331: Operations Research I** course at **Istanbul Technical University**.* [cite: 1, 3, 4]

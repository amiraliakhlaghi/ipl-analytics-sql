# IPL Cricket Data Analysis

A comprehensive SQL-based data analysis project exploring IPL match statistics, player performances, and team trends.

## 🛠️ Tools & Technologies
- **Database Engine:** SQLite
- **GUI Tool:** DB Browser for SQLite
- **Language:** SQL

## 📂 Project Structure
- `matches.csv`: Match-level details (teams, venues, toss, winners).
- `deliveries.csv`: Ball-by-ball delivery data (batsmen, bowlers, runs).
- `query.sql`: SQL scripts for analytical queries and KPI calculations.

## 🚀 How to Run
1. Open **DB Browser for SQLite**.
2. Create a new database (e.g., `ipl.db`).
3. Import `matches.csv` and `deliveries.csv` as tables.
4. Open the **Execute SQL** tab and run the queries from `query.sql`.

## 📊 Dataset Overview
- **Matches:** Season, city, date, teams, toss details, winner, player of the match, venue.
- **Deliveries:** Match ID, innings, batting/bowling teams, batsman, bowler, runs scored.

## 🔍 Key Analyses & Queries
- **Team Performance:** Most successful teams by total wins.
- **Toss Impact:** Does winning the toss help in winning the match? (Bat first vs. Field first).
- **Batting Records:** Top 10 run scorers of all time.
- **Bowling Records:** Best bowling economy rates (min 100 overs).
- **Match Highlights:** Most Player of the Match awards, top venues, highest team totals.
- **Seasonal Trends:** Season-wise total runs and batting averages.
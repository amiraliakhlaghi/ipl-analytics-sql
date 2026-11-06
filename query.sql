-- Q1: Most successful teams by wins
SELECT 
	winner AS team, 
	COUNT(*) AS total_wins
FROM matches
WHERE winner IS NOT NULL
GROUP BY winner
ORDER BY total_wins DESC;

-- Q2: Does winning toss help win the match?
SELECT 
	COUNT(*) AS total_matches, 
	SUM(
		CASE 
			WHEN toss_winner = winner THEN 1 
			ELSE 0 
		END) AS toss_winner_won, 
	ROUND(100.0 * SUM(
		CASE 
			WHEN toss_winner = winner THEN 1         
			ELSE 0
		END) / COUNT(*), 2) AS win_pct
FROM matches
WHERE winner IS NOT NULL;

-- Q3: Field first or bat first — which wins more?
SELECT 
	toss_decision, 
	COUNT(*) AS times_chosen, 
	SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) AS times_won, 
	ROUND(100.0 * SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) / COUNT(*), 2) AS win_pct
FROM matches
WHERE winner IS NOT NULL
GROUP BY toss_decision;

-- Q4: Top 10 run scorers of all time
SELECT 
	batsman, 
	SUM(runs_batsman) AS total_runs, 
	COUNT(DISTINCT match_id) AS matches_played,    
	ROUND(AVG(runs_batsman), 2) AS avg_runs_per_ball
FROM deliveries
GROUP BY batsman
ORDER BY total_runs DESC
LIMIT 10;

-- Q5: Most Player of the Match awards
SELECT 
	player_of_match, 
	COUNT(*) AS awards
FROM matches
WHERE player_of_match IS NOT NULL
GROUP BY player_of_match
ORDER BY awards DESC
LIMIT 10;

-- Q6: Most matches hosted by venue
SELECT 
	venue, 
	city, 
	COUNT(*) AS matches_hosted
FROM matches
GROUP BY venue, city
ORDER BY matches_hosted DESC
LIMIT 10;

-- Q7: Season-wise total runs scored (batting trends over years)
SELECT 
	season, 
	SUM(d.total_runs) AS total_runs, 
	COUNT(DISTINCT matches.id) AS total_matches, 
	ROUND(AVG(d.total_runs), 2) AS avg_runs_per_ball
FROM matches 
JOIN deliveries AS d ON matches.id = d.match_id
GROUP BY season
ORDER BY season;

-- Q8: Best bowling economy (min 100 overs bowled)
SELECT 
	bowler, 
	SUM(total_runs) AS runs_given, 
	COUNT(*) / 6 AS overs_bowled, 
	ROUND(SUM(total_runs) * 6.0 / COUNT(*), 2) AS economy
FROM deliveries
GROUP BY bowler
HAVING COUNT(*) >= 600 -- 100 overs = 600 balls
ORDER BY economy ASC
LIMIT 10;

-- Q9: Highest team totals in a single innings
SELECT 
	match_id, 
	batting_team, 
	inning, 
	SUM(total_runs) AS team_total
FROM deliveries
GROUP BY match_id, batting_team, inning
ORDER BY team_total DESC
LIMIT 10;
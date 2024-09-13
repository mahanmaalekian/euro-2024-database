-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Find the number of goals a player scored
SELECT COUNT(*)
AS "goal_scored_by_player"
FROM "goals"
WHERE "player_id" = (
    SELECT "id"
    FROM "players"
    WHERE "first_name" = 'Cristiano'
    AND "last_name" = 'Ronaldo'
);

-- Find all the players from a certain country
SELECT *
FROM "players"
WHERE "country_id" = (
    SELECT "id"
    FROM "countries"
    WHERE "country" = 'England'
);

-- Find all countries that qualified to a certain round
SELECT "country"
FROM "countries"
WHERE "id" IN (
    SELECT "home_country_id", "away_country_id"
    FROM "games"
    WHERE "round" = 'round of 16'
);

-- Add a new game
INSERT INTO "games"("date", "round", "stadium_id", "home_country_id",
"away_country_id", "stadium_id", "final_score")
VALUES ('14-06-2024', 'group stage', '1', '1' ,'2', '1', '3-0');



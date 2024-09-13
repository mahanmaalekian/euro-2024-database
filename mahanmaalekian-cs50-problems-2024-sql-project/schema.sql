-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

--Represent the countries participating in the Euros 2024
CREATE TABLE "countries" (
    "id" INTEGER,
    "country" TEXT NOT NULL,
    "fifa_ranking" INTEGER NOT NULL
    PRIMARY KEY("id")
);


-- Represent the players participating in the Euros 2024
CREATE TABLE "players" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "number" INTEGER NOT NULL CHECK("number" <= 23 and "number" >= 1),
    "position" TEXT NOT NULL,
    "birthday" NUMERIC NOT NULL,
    "club" TEXT,
    "country_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("country_id") REFERENCES "countries"("id")
);

-- Represent the players participating in the Euros 2024
CREATE TABLE "managers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "country_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("country_id") REFERENCES "countries"("id")
);

-- Represent the stadiums that are being used
CREATE TABLE "stadiums" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represent the games
CREATE TABLE "games" (
    "id" INTEGER,
    "date" NUMERIC NOT NULL,
    "round" TEXT CHECK("round" IN ('group stage', 'round of 16', 'quarter-final', 'semi-final', 'final')),
    "final_score" TEXT NOT NULL,
    "stadium_id" INTEGER,
    "home_country_id" INTEGER,
    "away_country_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("stadium_id") REFERENCES "stadiums"("id"),
    FOREIGN KEY("home_country_id") REFERENCES "countries"("id"),
    FOREIGN KEY("away_country_id") REFERENCES "countries"("id")
);

-- Represent the goals scored
CREATE TABLE "goals" (
    "id" INTEGER,
    "game_id" INTEGER,
    "player_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("game_id") REFERENCES "games"("id"),
    FOREIGN KEY("players_id") REFERENCES "players"("id")
);

--Indices to speed up the search
CREATE INDEX "player_name_search" ON "players"("first_name", "last_name");
CREATE INDEX "country_name_search" ON "countries" ("country");

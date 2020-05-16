DROP DATABASE IF EXISTS SoccerDatabase;

CREATE DATABASE SoccerDatabase;

USE SoccerDatabase;

CREATE TABLE Player (
    PlayerID INT AUTO_INCREMENT PRIMARY KEY,
    PFName VARCHAR(30) NOT NULL,
    PLName VARCHAR(30) NOT NULL,   
    DOB DATE NOT NULL,
    Img VARCHAR(200) NOT NULL
);

CREATE TABLE Team (
	TeamName VARCHAR(40) NOT NULL PRIMARY KEY
);

CREATE TABLE Championship (
	ChampionshipName CHAR(40) NOT NULL PRIMARY KEY,
	ChampDate DATE NOT NULL
);

CREATE TABLE Coach (
	CoachID INT AUTO_INCREMENT PRIMARY KEY,
	CoachFName VARCHAR(30) NOT NULL,
	CoachLName VARCHAR(30) NOT NULL,
	CoachDOB DATE NOT NULL
);

CREATE TABLE Matches (
	MatchID INT AUTO_INCREMENT PRIMARY KEY,
	MatchDate DATE,
	MatchLocation VARCHAR(30),
	Result CHAR(5)
);

CREATE TABLE Sponsor (
	CompanyName VARCHAR(40) PRIMARY KEY
);

CREATE TABLE Player_Team_Contract (
    PlayerID INT NOT NULL, 
    PlayerNumber INT NOT NULL,
    TeamName VARCHAR(40), 
    PContr_Numb INT NOT NULL, 
    PStart_Date DATE, 
    PEnd_Date DATE,
    PRIMARY KEY(PlayerID,TeamName,PContr_Numb),
    FOREIGN KEY(PlayerID) REFERENCES Player(PlayerID) ON DELETE CASCADE,
    FOREIGN KEY(TeamName) REFERENCES Team(TeamName) ON DELETE CASCADE
);

CREATE TABLE Coach_Team_Contract(
    CoachID INT,
    TeamName VARCHAR(40) NOT NULL,
    CContr_Numb INT NOT NULL,
    CStart_Date DATE, 
    CEnd_Date DATE,
    PRIMARY KEY(CoachID,TeamName,CContr_Numb),
    FOREIGN KEY(CoachID) REFERENCES Coach(CoachID) ON DELETE CASCADE,
    FOREIGN KEY(TeamName) REFERENCES Team(TeamName) ON DELETE CASCADE
);

CREATE TABLE Player_PlaysRole_in_Match(
    PlayerID INT, 
    MatchID INT, 
    PRole CHAR(2),
    PRIMARY KEY(PlayerID,MatchID),
    FOREIGN KEY(PlayerID) REFERENCES Player(PlayerID) ON DELETE CASCADE,
    FOREIGN KEY(MatchID) REFERENCES Matches(MatchID) ON DELETE CASCADE
);

CREATE TABLE Player_Scores_in_Match (
    PlayerID INT, 
    MatchID INT, 
    Score INT,
    PRIMARY KEY(PlayerID,MatchID),
    FOREIGN KEY(PlayerID) REFERENCES Player(PlayerID) ON DELETE CASCADE,
    FOREIGN KEY(MatchID) REFERENCES Matches(MatchID) ON DELETE CASCADE
);

CREATE TABLE Team_Wins_Championship (
    TeamName VARCHAR(40), 
    ChampionshipName CHAR(40), 
    Medal VARCHAR(6),
    PRIMARY KEY(TeamName,ChampionshipName),
    FOREIGN KEY(TeamName) REFERENCES Team(TeamName) ON DELETE CASCADE,
    FOREIGN KEY(ChampionshipName) REFERENCES Championship(ChampionshipName) ON DELETE CASCADE
);

CREATE TABLE Team_Participates_in_Match (
    TeamName VARCHAR(40),  
    MatchID INT, 
    PRIMARY KEY(TeamName,MatchID),
    FOREIGN KEY(TeamName) REFERENCES Team(TeamName) ON DELETE CASCADE,
    FOREIGN KEY(MatchID) REFERENCES Matches(MatchID) ON DELETE CASCADE
);

CREATE TABLE Sponsor_Sponsors_Match (
    CompanyName VARCHAR(40),
    TeamName VARCHAR(40), 
    MatchID INT,
    PRIMARY KEY(CompanyName,TeamName,MatchID),
    FOREIGN KEY(CompanyName) REFERENCES Sponsor(CompanyName) ON DELETE CASCADE,
    FOREIGN KEY(TeamName) REFERENCES Team(TeamName) ON DELETE CASCADE,
    FOREIGN KEY(MatchID) REFERENCES Matches(MatchID) ON DELETE CASCADE
);

-- PLAYER

INSERT INTO Player VALUES (NULL, 'Cristiano', 'Ronaldo', '1985-02-05', 'google.com/');
INSERT INTO Player VALUES (NULL, 'Mohamed', 'Salah', '1992-06-15', 'google.com/');
INSERT INTO Player VALUES (NULL, 'Lionel', 'Messi', '1987-06-24', 'google.com/');
INSERT INTO Player VALUES (NULL, 'Paulo', 'Dybala', '1993-11-15', 'google.com/');
INSERT INTO Player VALUES (NULL, 'Manuel', 'Neuer', '1986-03-27', 'google.com/');
INSERT INTO Player VALUES (NULL, 'Kylian', 'Mbappé', '1998-12-20', 'google.com/');
INSERT INTO Player VALUES (NULL, 'Roberto', 'Firmino', '1991-10-02', 'google.com/');
INSERT INTO Player VALUES (NULL, 'Sergio', 'Ramos', '1986-03-30', 'google.com/');
INSERT INTO Player VALUES (NULL, 'Gareth', 'Bale', '1989-07-16', 'google.com/');
INSERT INTO Player VALUES (NULL, 'Sadio', 'Mane', '1992-04-10', 'google.com/');
INSERT INTO Player VALUES (NULL, 'Keylor', 'Navas', '1986-12-15', 'google.com/');

-- TEAM

INSERT INTO Team VALUES ('Juventus');
INSERT INTO Team VALUES ('Liverpool');
INSERT INTO Team VALUES ('Barcelona');
INSERT INTO Team VALUES ('PSG');
INSERT INTO Team VALUES ('Real Madrid');
INSERT INTO Team VALUES ('Milan');
INSERT INTO Team VALUES ('Bayern');
INSERT INTO Team VALUES ('Chelsea');
INSERT INTO Team VALUES ('Internazionale');
INSERT INTO Team VALUES ('Manchester United');
INSERT INTO Team VALUES ('Tottenham Hotspur');
INSERT INTO Team VALUES ('Atletico');
INSERT INTO Team VALUES ('Ajax');
INSERT INTO Team VALUES ('Marseille');
INSERT INTO Team VALUES ('Arsenal');

-- CHAMPIONSHIP

INSERT INTO Championship VALUES ('Champions League 1985', '1985-05-29');
INSERT INTO Championship VALUES ('Champions League 2016', '2016-06-26');
INSERT INTO Championship VALUES ('Champions League 2017', '2017-06-26');
INSERT INTO Championship VALUES ('Champions League 2018', '2018-06-26');
INSERT INTO Championship VALUES ('Champions League 2019', '2019-06-26');

INSERT INTO Championship VALUES ('Europa League 2016', '2016-06-26');
INSERT INTO Championship VALUES ('Europa League 2017', '2017-06-26');
INSERT INTO Championship VALUES ('Europa League 2018', '2018-06-26');
INSERT INTO Championship VALUES ('Europa League 2019', '2019-06-26');

-- COACH

INSERT INTO Coach VALUES (NULL, 'Maurizio', 'Sarri', '1959-01-10');
INSERT INTO Coach VALUES (NULL, 'Jürgen', 'Klopp', '1967-06-16');
INSERT INTO Coach VALUES (NULL, 'Quique', 'Setien', '1958-09-27');
INSERT INTO Coach VALUES (NULL, 'Zinedine', 'Zidane', '1972-06-23');

-- MATCH

INSERT INTO Matches VALUES (NULL, '1985-05-29 19:00', 'Heysel Stadium', '1-0');
INSERT INTO Matches VALUES (NULL, '2019-11-26 19:00', 'Allianz Stadium', '1-0');
INSERT INTO Matches VALUES (NULL, '2019-05-07 19:00', 'Anfield', '4-0');
INSERT INTO Matches VALUES (NULL, '2018-05-26 19:00', 'NSC Olimpiyskiy Stadium', '3-1');
INSERT INTO Matches VALUES (NULL, '2018-05-26 19:00', 'NSC Olimpiyskiy Stadium', '3-1');

-- SPONSOR

INSERT INTO Sponsor VALUES ('Fly Emirates');
INSERT INTO Sponsor VALUES ('Jeep');
INSERT INTO Sponsor VALUES ('Standard Chartered');
INSERT INTO Sponsor VALUES ('Western Union');

-- PLAYER TEAM CONTRACT
INSERT INTO Player_Team_Contract
VALUES (1, 7, 'Juventus', '2018845', '2018-07-10', '2020-07-11');

INSERT INTO Player_Team_Contract
VALUES (2, 11, 'Liverpool', '2016458', '2016-10-30', '2021-11-15');

INSERT INTO Player_Team_Contract
VALUES (3, 10, 'Barcelona', '2015897', '2015-03-14', '2017-03-15');

INSERT INTO Player_Team_Contract
VALUES (4, 10, 'Barcelona', '2015897', '2018-08-01', '2020-08-01');

INSERT INTO Player_Team_Contract
VALUES (4, 1, 'Real Madrid', '1225448', '2014-08-03', '2019-08-04');

INSERT INTO Player_Team_Contract
VALUES (4, 1, 'PSG', '88774566', '2019-09-02', '2023-09-03');

-- COACH TEAM CONTRACT

INSERT INTO Coach_Team_Contract VALUES (1, 'Juventus', '572276', '2015-10-02', '2020-05-15');
INSERT INTO Coach_Team_Contract VALUES (2, 'Liverpool', '554778', '2015-10-02', '2020-05-15');
INSERT INTO Coach_Team_Contract VALUES (3, 'Barcelona', '4789954', '2015-10-02', '2020-05-15');
INSERT INTO Coach_Team_Contract VALUES (4, 'Real Madrid', '97846535', '2016-01-04', '2018-07-04');
INSERT INTO Coach_Team_Contract VALUES (4, 'Real Madrid', '166589999', '2019-03-11', '2022-06-01');

-- PLAYER ROLE MATCH

INSERT INTO Player_PlaysRole_in_Match VALUES (1, 2, 'CF');
INSERT INTO Player_PlaysRole_in_Match VALUES (3, 3, 'RW');
INSERT INTO Player_PlaysRole_in_Match VALUES (8, 4, 'CB');
INSERT INTO Player_PlaysRole_in_Match VALUES (2, 4, 'RW');
INSERT INTO Player_PlaysRole_in_Match VALUES (10, 4, 'LW');
INSERT INTO Player_PlaysRole_in_Match VALUES (9, 4, 'RW');
INSERT INTO Player_PlaysRole_in_Match VALUES (5, 5, 'GK');
INSERT INTO Player_PlaysRole_in_Match VALUES (11, 4, 'GK');

-- PLAYER SCORES IN MATCH
INSERT INTO Player_Scores_in_Match VALUES (4, 2, 1);
INSERT INTO Player_Scores_in_Match VALUES (10, 4, 1);
INSERT INTO Player_Scores_in_Match VALUES (9, 4, 2);

-- TEAM WINS CHAMPIONSHIP

-- Champions League
INSERT INTO Team_Wins_Championship VALUES ('Liverpool', 'Champions League 1985', 'Silver');
INSERT INTO Team_Wins_Championship VALUES ('Juventus', 'Champions League 1985', 'Gold');
INSERT INTO Team_Wins_Championship VALUES ('Atletico', 'Champions League 2016', 'Silver');
INSERT INTO Team_Wins_Championship VALUES ('Real Madrid', 'Champions League 2016', 'Gold');
INSERT INTO Team_Wins_Championship VALUES ('Juventus', 'Champions League 2017', 'Silver');
INSERT INTO Team_Wins_Championship VALUES ('Real Madrid', 'Champions League 2017', 'Gold');
INSERT INTO Team_Wins_Championship VALUES ('Liverpool', 'Champions League 2018', 'Silver');
INSERT INTO Team_Wins_Championship VALUES ('Real Madrid', 'Champions League 2018', 'Gold');
INSERT INTO Team_Wins_Championship VALUES ('Tottenham Hotspur', 'Champions League 2019', 'Silver');
INSERT INTO Team_Wins_Championship VALUES ('Liverpool', 'Champions League 2019', 'Gold');

-- Europa League

INSERT INTO Team_Wins_Championship VALUES ('Liverpool', 'Europa League 2016', 'Silver');
INSERT INTO Team_Wins_Championship VALUES ('Sevilla', 'Europa League 2016', 'Gold');
INSERT INTO Team_Wins_Championship VALUES ('Ajax', 'Europa League 2017', 'Silver');
INSERT INTO Team_Wins_Championship VALUES ('Manchester United', 'Europa League 2017', 'Gold');
INSERT INTO Team_Wins_Championship VALUES ('Marseille', 'Europa League 2018', 'Silver');
INSERT INTO Team_Wins_Championship VALUES ('Atletico', 'Europa League 2018', 'Gold');
INSERT INTO Team_Wins_Championship VALUES ('Arsenal', 'Europa League 2019', 'Silver');
INSERT INTO Team_Wins_Championship VALUES ('Chelsea', 'Europa League 2019', 'Gold');

-- TEAM MATCH

INSERT INTO Team_Participates_in_Match VALUES ('Juventus', 1);
INSERT INTO Team_Participates_in_Match VALUES ('Liverpool', 1);
INSERT INTO Team_Participates_in_Match VALUES ('Barcelona', 3);
INSERT INTO Team_Participates_in_Match VALUES ('Liverpool', 3);
INSERT INTO Team_Participates_in_Match VALUES ('Real Madrid', 4);
INSERT INTO Team_Participates_in_Match VALUES ('Liverpool', 4);

-- SPONSORS SPONSOR MATCH

INSERT INTO Sponsor_Sponsors_Match VALUES ('Jeep', 'Juventus', 2);
INSERT INTO Sponsor_Sponsors_Match VALUES ('Standard Chartered', 'Liverpool', 3);
INSERT INTO Sponsor_Sponsors_Match VALUES ('Western Union', 'Liverpool', 3);
INSERT INTO Sponsor_Sponsors_Match VALUES ('Standard Chartered', 'Liverpool', 4);
INSERT INTO Sponsor_Sponsors_Match VALUES ('Western Union', 'Liverpool', 4);
INSERT INTO Sponsor_Sponsors_Match VALUES ('Fly Emirates', 'Real Madrid', 4);

-- No 1
SELECT Coach.CoachFName, Coach.CoachLName, Coach_Team_Contract.CStart_Date, Coach_Team_Contract.CEnd_Date FROM Coach_Team_Contract
    INNER JOIN Coach ON Coach_Team_Contract.CoachID = Coach.CoachID
        WHERE DATE_FORMAT(Coach_Team_Contract.CStart_Date, '%Y') = 2016;

-- No 2
SELECT Player.PFName, Player.PLName, Player_Team_Contract.PlayerNumber FROM Player_Team_Contract
    INNER JOIN Player ON Player_Team_Contract.PlayerID = Player.PlayerID
        WHERE Player_Team_Contract.PlayerNumber = 10;

-- No 3
SELECT Player.PFName, Player.PLName, Player_PlaysRole_in_Match.PRole FROM Player_PlaysRole_in_Match
    INNER JOIN Player ON Player_PlaysRole_in_Match.PlayerID = Player.PlayerID
        WHERE Player_PlaysRole_in_Match.PRole = 'RW';

-- No 4
SELECT Player.PFName, Player.PLName, Player_Team_Contract.PStart_Date, Player_Team_Contract.PEnd_Date FROM Player_Team_Contract
    INNER JOIN Player ON Player_Team_Contract.PlayerID = Player.PlayerID
        WHERE DATE_FORMAT(Player_Team_Contract.PEnd_Date, '%Y') = 2020;

-- No 5
SELECT DISTINCT CompanyName, COUNT(*) FROM Sponsor_Sponsors_Match
    GROUP BY CompanyName
        ORDER BY COUNT(*) DESC
            LIMIT 1;

-- No 6
SELECT TeamName, Count(*) AS "Total Gold Medals" FROM Team_Wins_Championship
    WHERE Medal = 'Gold'
        GROUP BY TeamName
            ORDER BY COUNT(*) DESC
                LIMIT 1;

-- -- No 7
SELECT TeamName, Count(*) AS "Total Silver Medals" FROM Team_Wins_Championship
    WHERE Medal = 'Silver'
        GROUP BY TeamName
            ORDER BY COUNT(*) DESC
                LIMIT 1;

-- No 8
SELECT Team.TeamName, Count(*) AS 'Total Number of Wins' FROM Team_Wins_Championship
    INNER JOIN Team ON Team_Wins_Championship.TeamName = Team.TeamName
        WHERE Team_Wins_Championship.ChampionshipName LIKE 'Euro%' AND Team_Wins_Championship.Medal = 'Gold'
            GROUP BY Team_Wins_Championship.TeamName
                ORDER BY Team.TeamName DESC
                    LIMIT 1;

-- No 9
SELECT Player.PFName, Player.PLName, Player.DOB, Player_Team_Contract.TeamName AS 'Team' FROM Player
    INNER JOIN Player_Team_Contract ON Player.PlayerID = Player_Team_Contract.PlayerID
        WHERE TIMESTAMPDIFF(year, DOB, NOW()) > 30 
                AND Player_Team_Contract.TeamName = 'Barcelona';

-- No 10
SELECT * FROM Player
    WHERE TIMESTAMPDIFF(year, DOB, NOW()) < 25;

-- No 11
SELECT Player.PFName, Player.PLName, Player_Scores_in_Match.Score FROM Player_Scores_in_Match
    INNER JOIN Player ON Player_Scores_in_Match.PlayerID = Player.PlayerID
        GROUP BY Player.PFName
            ORDER BY Score DESC
             LIMIT 10;

-- No 12
SELECT Player.PlayerID, Player.PFName, Player.PLName, Player_Team_Contract.PStart_Date, Player_Team_Contract.PEnd_Date FROM Player_Team_Contract
    INNER JOIN Player ON Player_Team_Contract.PlayerID = Player.PlayerID
        WHERE TIMESTAMPDIFF(year, Player_Team_Contract.PStart_Date, Player_Team_Contract.PEnd_Date) > 2;

-- No 13
SELECT * FROM Coach
    JOIN Coach_Team_Contract
        WHERE Coach.CoachID = Coach_Team_Contract.CoachID
            GROUP BY TIMESTAMPDIFF(year,CStart_Date,CEnd_Date)
                ORDER BY COUNT(*) DESC
                    LIMIT 1;

-- No 14
SELECT * FROM Matches
    WHERE DATE_FORMAT(MatchDate, '%Y') = 2018;

-- No 15
SELECT MatchID, MatchDate, MatchLocation FROM Matches
    WHERE MatchLocation LIKE '%stadium%';

-- No 16
SELECT DISTINCT(CompanyName), TeamName FROM Sponsor_Sponsors_Match
    WHERE TeamName = 'Liverpool';

-- No 17 (Need to change something...)
SELECT Matches.MatchID, Team_Participates_in_Match.TeamName, Matches.Result FROM Team_Participates_in_Match
 INNER JOIN Matches ON Team_Participates_in_Match.MatchID = Matches.MatchID
    ORDER BY Team_Participates_in_Match.MatchID;

-- No 18
SELECT MatchID, Result FROM Matches
    WHERE Result = '1-0' OR Result = '0-1';

-- NO 19
SELECT Player_PlaysRole_in_Match.MatchID, Matches.MatchLocation, CONCAT(PFNAME,' ',PLNAME) AS NAME, Player_PlaysRole_in_Match.PRole FROM Matches 
    JOIN Player_PlaysRole_in_Match
    JOIN PLAYER
        ON Player_PlaysRole_in_Match.MatchID = Matches.MatchID
            WHERE PFName='Cristiano' AND Player_PlaysRole_in_Match.MatchID = 2;

-- NO 20
SELECT Matches.MatchID, MatchDate, MatchLocation, TeamName FROM Matches INNER JOIN Team_Participates_in_Match
    ON Matches.MatchID = Team_Participates_in_Match.MatchID
        WHERE Team_Participates_in_Match.TeamName = 'LIVERPOOL';
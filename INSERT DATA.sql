INSERT INTO Player
VALUES (NULL, 'Cristiano', 'Ronaldo', to_date('05-FEB-1985', 'dd-mon-yyyy'), 'google.com/');

INSERT INTO Player
VALUES (NULL, 'Mohamed', 'Salah', to_date('15-JUN-1992', 'dd-mon-yyyy'), 'google.com/');

INSERT INTO Player
VALUES (NULL, 'Lionel', 'Messi', to_date('24-JUN-1987', 'dd-mon-yyyy'), 'google.com/');

INSERT INTO Player
VALUES (NULL, 'Paulo', 'Dybala', to_date('15-NOV-1993', 'dd-mon-yyyy'), 'google.com/');

INSERT INTO Team
VALUES ('Juventus');

INSERT INTO Team
VALUES ('Liverpool');

INSERT INTO Team
VALUES ('Barcelona');

INSERT INTO Championship
VALUES ('Champions League 1985', to_date('29-MAY-1985', 'dd-mon-yyyy'));

INSERT INTO Championship
VALUES ('Champions League 2019', to_date('26-JUN-2018', 'dd-mon-yyyy'));

INSERT INTO Coach
VALUES (NULL, 'Maurizio', 'Sarri', to_date('10-JAN-1959', 'dd-mon-yyyy'));

INSERT INTO Coach
VALUES (NULL, 'Jürgen', 'Klopp', to_date('16-JUN-1967', 'dd-mon-yyyy'));

INSERT INTO Coach
VALUES (NULL, 'Quique', 'Setien', to_date('27-SEP-1958', 'dd-mon-yyyy'));

INSERT INTO Match
VALUES (NULL, to_date('29-MAY-1985 7:00', 'dd-mon-yyyy hh:mi P.M.'), 'Heysel Stadium', '1-0');

INSERT INTO Match
VALUES (NULL, to_date('26-NOV-2019 7:00', 'dd-mon-yyyy hh:mi P.M.'), 'Allianz Stadium', '1-0');

INSERT INTO Match
VALUES (NULL, to_date('07-MAY-2019 7:00', 'dd-mon-yyyy hh:mi P.M.'), 'Anfield', '4-0');

INSERT INTO Sponsor
VALUES ('Fly Emirates');

INSERT INTO Sponsor
VALUES ('Jeep');

INSERT INTO Sponsor
VALUES ('Standard Chartered');

INSERT INTO Player_Team_Contract
VALUES (1, 'Juventus', '2018845', to_date('10-JUL-2018', 'dd-mon-yyyy'), to_date('10-JUL-2020', 'dd-mon-yyyy'));

INSERT INTO Player_Team_Contract
VALUES (2, 'Liverpool', '2016458', to_date('30-OCT-2016', 'dd-mon-yyyy'), to_date('10-NOV-2021', 'dd-mon-yyyy'));

INSERT INTO Player_Team_Contract
VALUES (3, 'Barcelona', '2015897', to_date('10-MAR-2015', 'dd-mon-yyyy'), to_date('10-MAR-2020', 'dd-mon-yyyy'));

INSERT INTO Coach_Team_Contract
VALUES (1, 'Juventus', '572276', to_date('10-MAR-2015', 'dd-mon-yyyy'), to_date('10-MAR-2020', 'dd-mon-yyyy'));

INSERT INTO Coach_Team_Contract
VALUES (2, 'Liverpool', '554778', to_date('10-MAR-2015', 'dd-mon-yyyy'), to_date('10-MAR-2020', 'dd-mon-yyyy'));

INSERT INTO Coach_Team_Contract
VALUES (3, 'Barcelona', '4789954', to_date('10-MAR-2015', 'dd-mon-yyyy'), to_date('10-MAR-2020', 'dd-mon-yyyy'));

INSERT INTO Player_PlaysRole_in_Match
VALUES (1, 2, 'CF');

INSERT INTO Player_PlaysRole_in_Match
VALUES (3, 3, 'RW');

INSERT INTO Player_Scores_in_Match
VALUES (4, 2, 1);

INSERT INTO Team_Wins_Championship
VALUES ('Juventus', 'Champions League 1985', 'Gold');

INSERT INTO Team_Wins_Championship
VALUES ('Liverpool', 'Champions League 2019', 'Gold');

INSERT INTO Team_Participates_in_Match
VALUES ('Juventus', 1);

INSERT INTO Team_Participates_in_Match
VALUES ('Liverpool', 1);

INSERT INTO Team_Participates_in_Match
VALUES ('Barcelona', 3);

INSERT INTO Team_Participates_in_Match
VALUES ('Liverpool', 3);

INSERT INTO Sponsor_Sponsors_Match
VALUES ('Jeep', 'Juventus', 2);

INSERT INTO Sponsor_Sponsors_Match
VALUES ('Standard Chartered', 'Liverpool', 3);
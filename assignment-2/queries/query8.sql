SELECT 
    s.screeningID, 
    s.date, 
    sh.filmID
FROM Screening s
JOIN shows sh ON s.screeningID = sh.screeningID
JOIN Film f ON sh.filmID = f.filmID
WHERE YEAR(s.date) < f.year;
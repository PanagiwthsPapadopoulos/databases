SELECT 
    sch.clubID, 
    sch.screeningID, 
    sh.filmID AS shown_filmID, 
    f.filmID AS catalog_filmID, 
    f.title, 
    f.year
FROM 
    schedules sch
JOIN 
    shows sh ON sch.screeningID = sh.screeningID
CROSS JOIN 
    Film f
WHERE 
    sch.clubID = 3;
SELECT 
    f.filmID, 
    f.title, 
    f.year, 
    f.TMDBLink
FROM 
    Film f
LEFT JOIN 
    directed d ON f.filmID = d.filmID
WHERE 
    d.filmID IS NULL;
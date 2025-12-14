SELECT 
    FilmClub.clubID, 
    FilmClub.name, 
    FilmClub.foundingDate, 
    Film.title, 
    Film.year
FROM 
    FilmClub
JOIN 
    Film ON YEAR(FilmClub.foundingDate) < Film.year
WHERE 
    FilmClub.clubID = 12;
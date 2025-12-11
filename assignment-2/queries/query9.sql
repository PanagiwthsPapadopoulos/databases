SELECT fc.clubID
FROM FilmClub fc
WHERE NOT EXISTS (
    -- 1. Check if there is any film in the database...
    SELECT f.filmID
    FROM Film f
    WHERE NOT EXISTS (
        -- 2. ...that is NOT present in the combined shows/schedules for this club.
        SELECT s.clubID
        FROM schedules s
        JOIN shows sh ON s.screeningID = sh.screeningID
        WHERE s.clubID = fc.clubID 
          AND sh.filmID = f.filmID
    )
);
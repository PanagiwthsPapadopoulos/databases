SELECT instagramHandle AS handle
FROM Member
WHERE instagramHandle IS NOT NULL
UNION
SELECT instagramHandle AS handle
FROM FilmClub
WHERE instagramHandle IS NOT NULL;
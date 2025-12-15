/*
 * +------------------------+
 * | ECE Dept., AUTh        |
 * | 112 - Database Systems |
 * | Group 12               |
 * | query2.sql             |
 * | December 2025          |
 * +------------------------+
 */

/* Έστω πως οι χρήστες ζητούν τις ταινίες που υπάρχουν στη βάση και έχουν
 * κυκλοφορήσει τελευταία δύο έτη. Το παρακάτω ερώτημα επιστρέφει τον τίτλο
 * (title), το έτος κυκλοφορίας (year) και έναν σύνδεσμο προς την ταινία
 * στο TMDB (TMDBLink).
 */

SELECT Film.title, Film.year, Film.TMDBLink
FROM FilmClubsAUThDB.Film
WHERE Film.year=2024
UNION
SELECT Film.title, Film.year, Film.TMDBLink
FROM FilmClubsAUThDB.Film
WHERE Film.year=2025;
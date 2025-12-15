/*
 * +------------------------+
 * | ECE Dept., AUTh        |
 * | 112 - Database Systems |
 * | Group 12               |
 * | query1.sql             |
 * | December 2025          |
 * +------------------------+
 */

/* Έστω πως οι χρήστες θέλουν να δουν όλες τις προβολές που πραγματοποίησαν
 * από κοινού δύο ομάδες (π.χ. οι ομάδες με ID 09 και 12). Το παρακάτω ερώτημα
 * προβάλει τα αναγνωριστικά των προβολών (ID), την ημερομηνία της προβολής
 * (date), τον τίτλο της ταινίας (title), το έτος κυκλοφορίας της ταινίας
 * (year), το όνομα του χώρου στον οποίο πραγματοποιείται η προβολή
 * (Venue.name) και το τμήμα στο οποίο ανήκει ο χώρος (Venue.department).
 */
 
SELECT X.screeningID, Screening.date, Film.title, Film.year, Venue.name, Venue.departmentID
FROM (SELECT schedules.screeningID
FROM FilmClubsAUThDB.schedules
WHERE schedules.clubID=4
INTERSECT
SELECT schedules.screeningID
FROM FilmClubsAUThDB.schedules
WHERE schedules.clubID=3) AS X
JOIN FilmClubsAUThDB.shows ON X.screeningID=shows.screeningID
JOIN FilmClubsAUThDB.Film ON shows.filmID=Film.filmID
JOIN FilmClubsAUThDB.Screening ON X.screeningID=Screening.screeningID
JOIN FilmClubsAUThDB.Venue ON Screening.venueID=Venue.venueID;
/*
 * +------------------------+
 * | ECE Dept., AUTh        |
 * | 112 - Database Systems |
 * | Group 12               |
 * | query3.sql             |
 * | December 2025          |
 * +------------------------+
 */

/* Έστω πως κάποιος χρήστης ενδιαφέρεται για τις προβολές της ομάδας με
 * αναγνωριστικό 4 και οι οποίες δεν έχουν γίνει συνεργατικά με κάποια άλλη ομάδα.
 * Το ακόλουθο ερώτημα επιστρέφει τα αναγνωριστικά των προβολών (screeningID)
 * και τις ημερομηνίες των προβολών (date).
 */

SELECT X.screeningID, Screening.date
FROM (SELECT schedules.screeningID FROM FilmClubsAUThDB.schedules WHERE schedules.clubID = 4
EXCEPT
SELECT schedules.screeningID FROM FilmClubsAUThDB.schedules WHERE schedules.clubID <> 4) AS X
JOIN  FilmClubsAUThDB.Screening ON X.screeningID=Screening.screeningID;
/*
 * +------------------------+
 * | ECE Dept., AUTh        |
 * | 112 - Database Systems |
 * | Group 12               |
 * | users.sql              |
 * | December 2025          |
 * +------------------------+
 */


/* ==============
 *  Create Roles
 * ==============
 */
DROP ROLE IF EXISTS
	'guest',
	'clubMember',
	'contentManager',
	'equipmentManager',
    'clubAdmin',
    'dbAdministrator';
    
CREATE ROLE	'guest',
			'clubMember',
            'contentManager',
            'equipmentManager',
            'clubAdmin',
            'dbAdministrator';

/* ROLE: guest
 * guests can perform select queries related to screenings, venues,
 * films and clubs. Guests do not have access to club-members' info.
 */
GRANT SELECT ON FilmClubsAUThDB.Screening TO 'guest';
GRANT SELECT ON FilmClubsAUThDB.schedules TO 'guest';
GRANT SELECT ON FilmClubsAUThDB.FilmClub TO 'guest';
GRANT SELECT ON FilmClubsAUThDB.Department TO 'guest';
GRANT SELECT ON FilmClubsAUThDB.Venue TO 'guest';
GRANT SELECT ON FilmClubsAUThDB.Post TO 'guest';
GRANT SELECT ON FilmClubsAUThDB.shows TO 'guest';
GRANT SELECT ON FilmClubsAUThDB.Film TO 'guest';
GRANT SELECT ON FilmClubsAUThDB.spoken_in TO 'guest';
GRANT SELECT ON FilmClubsAUThDB.Language TO 'guest';
GRANT SELECT ON FilmClubsAUThDB.directed TO 'guest';
GRANT SELECT ON FilmClubsAUThDB.Director TO 'guest';
GRANT SELECT ON FilmClubsAUThDB.played_in TO 'guest';
GRANT SELECT ON FilmClubsAUThDB.Actor TO 'guest';

/* ROLE: clubMember
 * club members have the same rights as guests
 * PLUS access to membership (belongs_to) and other
 * club-members' info.
 */
GRANT SELECT ON FilmClubsAUThDB.belongs_to TO 'clubMember';
GRANT SELECT ON FilmClubsAUThDB.Member TO 'clubMember';
/* NOTE
 * Instead of copying all the permissions allocated to guests,
 * we grant to all clubMembers the guest role (See the examples
 * section).
 */

/* ROLE: contentManager
 * contentManagers have the same rights as clubMembers
 * PLUS they can perform insert, update on Films, Actors,
 * Directors, Screenings, Posts.
 */
GRANT INSERT, UPDATE ON FilmClubsAUThDB.Screening TO 'contentManager';
GRANT INSERT, UPDATE ON FilmClubsAUThDB.schedules TO 'contentManager';
GRANT INSERT, UPDATE ON FilmClubsAUThDB.FilmClub TO 'contentManager';
GRANT INSERT, UPDATE ON FilmClubsAUThDB.Department TO 'contentManager';
GRANT INSERT, UPDATE ON FilmClubsAUThDB.Venue TO 'contentManager';
GRANT INSERT, UPDATE ON FilmClubsAUThDB.Post TO 'contentManager';
GRANT INSERT, UPDATE ON FilmClubsAUThDB.shows TO 'contentManager';
GRANT INSERT, UPDATE ON FilmClubsAUThDB.Film TO 'contentManager';
GRANT INSERT, UPDATE ON FilmClubsAUThDB.spoken_in TO 'contentManager';
GRANT INSERT, UPDATE ON FilmClubsAUThDB.Language TO 'contentManager';
GRANT INSERT, UPDATE ON FilmClubsAUThDB.directed TO 'contentManager';
GRANT INSERT, UPDATE ON FilmClubsAUThDB.Director TO 'contentManager';
GRANT INSERT, UPDATE ON FilmClubsAUThDB.played_in TO 'contentManager';
GRANT INSERT, UPDATE ON FilmClubsAUThDB.Actor TO 'contentManager';

/* ROLE: equipmentManager
 * equipmentManagers have the same rights as clubMembers
 * PLUS they can perform select, insert, update on equipment,
 * and equipment usage.
 */
GRANT SELECT, INSERT, UPDATE ON FilmClubsAUThDB.Equipment TO 'equipmentManager';
GRANT SELECT, INSERT, UPDATE ON FilmClubsAUThDB.uses TO 'equipmentManager';
/* maybe FilmClubsAUThDB.owns?
 * DELETE?
 */

/* ROLE: clubAdmin
 * clubAdmins have the same rights as clubMembers
 * PLUS they can perform select, insert and update on
 * club members, film clubs and
 */
GRANT SELECT, INSERT, UPDATE ON FilmClubsAUThDB.FilmClub TO 'clubAdmin';
GRANT SELECT, INSERT, UPDATE ON FilmClubsAUThDB.belongs_to TO 'clubAdmin';
GRANT SELECT, INSERT, UPDATE ON FilmClubsAUThDB.owns TO 'clubAdmin';
GRANT SELECT, INSERT, UPDATE ON FilmClubsAUThDB.Equipment TO 'clubAdmin';

/* ROLE: dbAdministrator
 * dbAdministrators have select, insert, delete and update
 * rights on the entire database.
 */
GRANT SELECT, INSERT, DELETE, UPDATE ON FilmClubsAUThDB.* TO 'dbAdministrator';

/*
 * ==============
 *  Create Users
 * ==============
 */

# Example: Guest user
CREATE USER 'guestuser'@'localhost' IDENTIFIED BY 'guestpswrd';
GRANT 'guest' TO 'guestuser'@'localhost';

# Example: Club members
CREATE USER 'SpongeBob'@'localhost' IDENTIFIED BY 'SpongePassword123';
CREATE USER 'PatrickStar'@'localhost' IDENTIFIED BY 'Patrick00';
GRANT 'guest', 'clubMember' TO 'SpongeBob'@'localhost', 'PatrickStar'@'localhost';

# Example: Content manager
CREATE USER 'jodorowsky'@'localhost' IDENTIFIED BY 'Alejandro1929';
GRANT 'guest', 'clubMember', 'contentManager' TO 'jodorowsky'@'localhost';

# Example: Equipment manager
CREATE USER 'pepa'@'localhost' IDENTIFIED BY 'PepaPig123';
GRANT 'guest', 'clubMember', 'equipmentManager' TO 'pepa'@'localhost';

# Example: Club admin
CREATE USER 'alex'@'localhost' IDENTIFIED BY 'Alex_Pass_123';
CREATE USER 'antonis'@'localhost' IDENTIFIED BY 'Antonis_Pass_123';
CREATE USER 'panos'@'localhost' IDENTIFIED BY 'Panos_Pass_123';
GRANT 'guest', 'clubMember', 'clubAdmin' TO 'alex'@'localhost', 'antonis'@'localhost', 'panos'@'localhost';

# Example: DB admin
CREATE USER 'dbFilmAdmin'@'localhost' IDENTIFIED BY 'Admin_Password012';
GRANT 'dbAdministrator' TO 'dbFilmAdmin'@'localhost';
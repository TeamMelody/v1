
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 11, 2015 at 10:43 PM
-- Server version: 5.1.69
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `u733886938_mel`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`u733886938_mel`@`localhost` PROCEDURE `GetModulePresence`(IN ModuleCodeParam VARCHAR(10))
BEGIN
			Select CourseTitle from Course JOIN CourseModule ON Course.CourseCode = CourseModule.CourseCode where ModuleCode = ModuleCodeParam;
		END$$

CREATE DEFINER=`u733886938_mel`@`localhost` PROCEDURE `GetModuleUnPresence`(IN ModuleCodeParam VARCHAR(10))
BEGIN

select CourseCode from Course where CourseCode NOT IN (Select Course.CourseCode from Course JOIN CourseModule ON Course.CourseCode = CourseModule.CourseCode where ModuleCode = ModuleCodeParam);
END$$

CREATE DEFINER=`u733886938_mel`@`localhost` PROCEDURE `ModuleDisable`(IN ModuleCodeParam VARCHAR(10))
BEGIN
	Select ModuleCode from Module where ModuleCode NOT IN (Select DISTINCT ModuleCode from CourseModule where CourseCode IN (Select DISTINCT CourseCode from CourseModule where CourseCode IN (Select CourseCode from CourseModule where ModuleCode = ModuleCodeParam)));
END$$

CREATE DEFINER=`u733886938_mel`@`localhost` PROCEDURE `ModuleEnable`(IN ModuleCodeParam VARCHAR(10))
BEGIN
	Select DISTINCT CourseModule.ModuleCode from CourseModule where CourseModule.CourseCode in (Select Course.CourseCode from Course JOIN CourseModule ON Course.CourseCode = CourseModule.CourseCode where ModuleCode = ModuleCodeParam);

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE IF NOT EXISTS `Course` (
  `CourseCode` int(11) NOT NULL AUTO_INCREMENT,
  `SchoolID` int(11) NOT NULL,
  `Level` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CourseTitle` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CourseCode`),
  KEY `SchoolID` (`SchoolID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`CourseCode`, `SchoolID`, `Level`, `CourseTitle`) VALUES
(1, 1, 'Undergraduate', 'Music BMus (Hons)'),
(2, 2, 'Undergraduate', 'BA(Hons) Music Technology'),
(3, 2, 'Undergraduate', 'BSc(Hons) Music Technology and Audio Systems'),
(4, 2, 'Undergraduate', 'BA(Hons) Music Technology and Popular Music'),
(5, 1, 'Undergraduate', 'Music Performance BMus (Hons)'),
(6, 1, 'Undergraduate', 'Popular Music BMus (Hons)'),
(7, 2, 'Undergraduate', 'BA (Hons) Popular Music Production'),
(8, 2, 'Undergraduate', 'BSc (Hons) Popular Music Production'),
(9, 2, 'Undergraduate', 'BMus (Hons) Creative Music Technology');

-- --------------------------------------------------------

--
-- Table structure for table `CourseKeySkills`
--

CREATE TABLE IF NOT EXISTS `CourseKeySkills` (
  `CourseCode` int(11) NOT NULL,
  `KSID` int(11) NOT NULL,
  PRIMARY KEY (`CourseCode`,`KSID`),
  KEY `KSID` (`KSID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CourseModule`
--

CREATE TABLE IF NOT EXISTS `CourseModule` (
  `CourseCode` int(11) NOT NULL,
  `ModuleCode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CourseCode`,`ModuleCode`),
  KEY `ModuleCode` (`ModuleCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `CourseModule`
--

INSERT INTO `CourseModule` (`CourseCode`, `ModuleCode`) VALUES
(1, 'AFM1101'),
(1, 'AFM1110'),
(1, 'AFM1205'),
(1, 'AFM1208'),
(1, 'AFM1211'),
(1, 'AFM1213'),
(1, 'AFM1303'),
(1, 'AFM1304'),
(1, 'AFM1406'),
(1, 'AHM1415'),
(1, 'AHM3108'),
(1, 'AHM3216'),
(1, 'AHM3310'),
(1, 'AHM3311'),
(1, 'AHM3312'),
(1, 'AHM3313'),
(1, 'AHM3403'),
(1, 'AHM3409'),
(1, 'AHM3412'),
(1, 'AHM3416'),
(1, 'AHM3417'),
(1, 'AHM3506'),
(1, 'AHM3511'),
(1, 'AHM3518'),
(1, 'AIM2106'),
(1, 'AIM2107'),
(1, 'AIM2108'),
(1, 'AIM2109'),
(1, 'AIM2205'),
(1, 'AIM2302'),
(1, 'AIM2307'),
(1, 'AIM2310'),
(1, 'AIM2311'),
(1, 'AIM2313'),
(1, 'AIM2408'),
(1, 'AIM2411'),
(1, 'AIM2416'),
(1, 'AIM2417'),
(1, 'AIM2506'),
(1, 'DIE1120'),
(2, 'NFE2172 '),
(2, 'NFE2173'),
(2, 'NHE 2475'),
(2, 'NHE2425'),
(2, 'NHE2431'),
(2, 'NIE2236'),
(2, 'NIE2237'),
(2, 'NIE2274'),
(3, 'NFE2160'),
(3, 'NFE2173'),
(3, 'NHE 2475'),
(3, 'NHE2425'),
(3, 'NHE2429'),
(3, 'NHE2431'),
(3, 'NHE2440 '),
(3, 'NHE2490'),
(3, 'NHE2491'),
(3, 'NIE2236'),
(3, 'NIE2237'),
(3, 'NIE2274'),
(3, 'NIE2280'),
(3, 'NIE2285'),
(3, 'NIE2286'),
(4, 'NFE2173'),
(4, 'NHE2425'),
(4, 'NIE2236'),
(5, 'AFM1101'),
(5, 'AFM1110'),
(5, 'AFM1205'),
(5, 'AFM1208'),
(5, 'AFM1211'),
(5, 'AFM1213'),
(5, 'AFM1303'),
(5, 'AFM1304'),
(5, 'AFM1406'),
(5, 'AHM1415'),
(5, 'AHM3109'),
(5, 'AHM3310'),
(5, 'AHM3311'),
(5, 'AHM3312'),
(5, 'AHM3313'),
(5, 'AHM3403'),
(5, 'AHM3409'),
(5, 'AHM3412'),
(5, 'AHM3416'),
(5, 'AHM3417'),
(5, 'AHM3506'),
(5, 'AHM3518'),
(5, 'AIM2107'),
(5, 'AIM2108'),
(5, 'AIM2109'),
(5, 'AIM2302'),
(5, 'AIM2307'),
(5, 'AIM2310'),
(5, 'AIM2311'),
(5, 'AIM2312'),
(5, 'AIM2313'),
(5, 'AIM2408'),
(5, 'AIM2416'),
(5, 'AIM2417'),
(5, 'AIM2506'),
(5, 'DIE1120'),
(6, 'AFM1110'),
(6, 'AFM1205'),
(6, 'AFM1208'),
(6, 'AFM1211'),
(6, 'AFM1213'),
(6, 'AFM1303'),
(6, 'AFM1304'),
(6, 'AFM1406'),
(6, 'AHM1415'),
(6, 'AHM3109'),
(6, 'AHM3208'),
(6, 'AHM3216'),
(6, 'AHM3310'),
(6, 'AHM3311'),
(6, 'AHM3312'),
(6, 'AHM3403'),
(6, 'AHM3409'),
(6, 'AHM3412'),
(6, 'AHM3416'),
(6, 'AHM3506'),
(6, 'AHM3518'),
(6, 'AIM2110'),
(6, 'AIM2205'),
(6, 'AIM2302'),
(6, 'AIM2310'),
(6, 'AIM2312'),
(6, 'AIM2408'),
(6, 'AIM2411'),
(6, 'AIM2416'),
(6, 'AIM2505'),
(6, 'DIE1120'),
(7, 'NFE2160'),
(7, 'NFE2172 '),
(7, 'NFE2173'),
(7, 'NHE2425'),
(7, 'NHE2429'),
(7, 'NHE2440 '),
(7, 'NHE2490'),
(7, 'NHE2491'),
(7, 'NIE2236'),
(7, 'NIE2280'),
(7, 'NIE2285'),
(7, 'NIE2286'),
(8, 'NFE2160'),
(8, 'NFE2173'),
(8, 'NHE2425'),
(8, 'NHE2429'),
(8, 'NHE2440 '),
(8, 'NHE2490'),
(8, 'NHE2491'),
(8, 'NIE2236'),
(8, 'NIE2280'),
(8, 'NIE2285'),
(8, 'NIE2286'),
(9, 'NHE2425'),
(9, 'NIE2236');

-- --------------------------------------------------------

--
-- Table structure for table `KeySkills`
--

CREATE TABLE IF NOT EXISTS `KeySkills` (
  `KSID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`KSID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Module`
--

CREATE TABLE IF NOT EXISTS `Module` (
  `ModuleCode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ModuleTitle` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `Year` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ModuleCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Module`
--

INSERT INTO `Module` (`ModuleCode`, `ModuleTitle`, `Description`, `Year`) VALUES
('NHE 2475', 'Audio electronics', 'Analysis, design, build and test of audio circuits & systems with technical report writing and presentation. Using practical examples, data sheets and application of electronic theory audio transistor amplifiers, IC audio amplifiers, valve amplifier design, audio filters, mixing consoles, guitar and studio processors and audio equalisation networks will be explored.', 'Year Two'),
('NIE2237', 'Audio plug-ins and web audio', 'This module provides an overview of advanced programming techniques. Programming experience will be gained in C/C++ and HTML/Javascript/Web Audio/Canvas, resulting in the production of audio/MIDI processing routines, audio plug-ins and graphical user interfaces.', 'Year Two'),
('NFE2172 ', 'Audio technology 1', 'The module will introduce you to audio principles such as signals, acoustics, hearing, basic electronics and digital audio.', 'Year One'),
('NHE2490', 'Business and the music industry', 'In a continually re-shaping industry, this module will provide you with a greater awareness of how music is now being created, consumed and, with a view to future developments, exploited as a commodity in the larger context of the entertainment world', 'Final Year'),
('AHM3216', 'Composing music for film b', 'Advanced scoring techniques for film', 'Final Year'),
('AFM1101', 'Composition 1', 'Create your own music', 'Year One'),
('AIM2107', 'Composition 2: techniques and analysis', 'Compose for visiting performers, learn from analysing scores', 'Year Two'),
('NFE2160', 'Computer composition & sound design 1 (ccsd)', 'Computer composition and sound design.  Develop an independence of thought and an ability to use a range of skills and techniques in a range of small creative projects. Study techniques and the creative potential of combining a variety of approaches to electronic music in a number of different musical styles.', 'Year Two'),
('AFM1205', 'Computer composition 1', 'Write your own music using computer software, including options to work with film', 'Year One'),
('AIM2205', 'Computer composition 2', 'Write your own music using computer software, including options to work with film', 'Year Two'),
('AHM3208', 'Computer composition 3', 'Write your own music using computer software, including options to work with film', 'Final Year'),
('NIE2280', 'Computer composition and sound design 2 (ccsd2)', 'Study techniques and the creative potential of combining a variety of approaches to electronic music in a number of different musical styles.', 'Year One'),
('NHE2491', 'Creative programming with midi and digital audio', 'Advanced understanding in the use of computers for musical programming using software and the creative application of these techniques.', 'Final Year'),
('NHE2431', 'Digital audio signal processing', 'Manipulation of audio signals and the technology of digital audio systems', 'Final Year'),
('AIM2310', 'Experimental music 1', 'Explore contemporary experimental music through research, composition and performance', 'Year Two'),
('AHM3311', 'Experimental music 2', 'Explore contemporary experimental music through research, composition and performance', 'Final Year'),
('AFM1211', 'Grooves, glitches and crackles', 'Research the history of popular music', 'Year One'),
('AIM2307', 'Historical performance', 'Research the evidence for how music of the past was performed', 'Year Two'),
('NHE2440 ', 'Individual project (music technology)', 'Based on any of the subject areas of your previous modules on the course, you will be provided with an opportunity to  undertake a substantial project from a suitable objective to a satisfactory conclusion.', 'Final Year'),
('AIM2106', 'Intermediate composition', 'Individual tuition on a composition portfolio', 'Year Two'),
('AFM1303', 'Introduction to analysis', 'Learning how music works, Music notation and theory skills', 'Year One'),
('AFM1304', 'Introduction to music research', 'Learn to be an effective researcher in music', 'Year One'),
('NIE2285', 'Live music production', 'This module introduces you to live sound engineering. It covers the practical aspects involved in live music production  and provides practical experience of working in a team to produce a live performance in a venue.', 'Year Two'),
('NIE2274', 'Microcontrollers and acoustics', 'A module composed in two disticnts part. 1:Understanding of the hardware and software aspects of microcontroller interfacing. 2: The theory and analysis of acoustic signals and simulation of acoustic behaviour', 'Year Two'),
('AIM2505', 'Music and moving image', 'This module explores the relationship between the soundtrack and moving image. You will develop an understanding of the historical context of the soundtrack from silent film to the present day.', 'Year Two'),
('DIE1120', 'Music in educational contexts', 'Learn about teaching music in classroom and non-classroom settings, including instrumental teaching and community-based music', 'Year Two'),
('AHM3109', 'Music in the 21st century', 'Research the music of recent decades and discuss the issues relating to notation, performance, and compositional practice', 'Final Year'),
('AIM2311', 'Music in vienna 1770?1830', 'Research Austria?s history of classical and romantic music', 'Year Two'),
('AHM3518', 'Music major project', 'A substantial and advanced piece of original research or creative work, individually or in collaboration, supported by individual tuition', 'Final Year'),
('AIM2313', 'Music on stage: opera and musical theatre from orfeo to\nmatilda 1', 'Research the history of dramatic music', 'Year Two'),
('AHM3313', 'Music on stage: opera and musical theatre from orfeo to matilda 2', 'Research the history of dramatic music', 'Final Year'),
('AHM3312', 'Music, gender and identity', 'Explore the relationship between music, gender and identity in pop and classical music', 'Final Year'),
('AIM2108', 'Orchestration 1', 'Learn to write effectively for orchestra, using historical models', 'Year Two'),
('AHM3108', 'Orchestration 2', 'Learn to write effectively for orchestra, using historical models', 'Final Year'),
('AFM1406', 'Performance skills 1', 'Improvisation, singing, aural skills, aural dictation', 'Year One'),
('AIM2411', 'Performance skills 2 (major)', 'Improvisation, singing, aural skills, aural dictation', 'Year Two'),
('AHM3412', 'Performance skills 3 (minor)', 'Options in conducting, ensemble performance, improvisation, choral singing, piano accompaniment, singing with movement, and more', 'Final Year'),
('AIM2408', 'Popular music directed ensembles', 'Perform covers and original material in a band of your choice', 'Year Two'),
('AHM3409', 'Popular music directed ensembles 2', 'Perform covers and original material in a band of your choice', 'Final Year'),
('AIM2302', 'Popular music studies', 'Research the history of pop music', 'Year Two'),
('NIE2286', 'Radio production', 'This module will cover radio programme making, broadcasting technologies, communication theory, and the legal frameworks surrounding the production of broadcast material.', 'Year Two'),
('NFE2173', 'Recording 1', 'Basic concepts, theory and practical use of a broad range of equipment used for recording and mixing sound. Practical experience of sound recording in a digital recording studio, in a concert hall and on location.', 'Year One'),
('NIE2236', 'Recording 2', 'Theory and practice behind high standards of rock music production', 'Year Two'),
('NHE2429', 'Recording 3', 'Theory and practice of recording, mixing audio, studio production and 5.1 surround sound recording and production.', 'Final Year'),
('AHM3310', 'Research for music', 'Explore current research in musicology and write your own research project', 'Final Year'),
('AIM2109', 'Scoring and arranging for brass and wind', 'Learn to arrange music effectively for brass band or wind orchestra', 'Year Two'),
('AIM2312', 'Scoring the silver screen: the musicology of film and television', 'Research the history of music written for television and film', 'Year Two'),
('AIM2417', 'Singers and their songs: music, text and performance before 1600 1', 'Research early music, create and perform from your own editions', 'Year Two'),
('AHM3417', 'Singers and their songs: music, text and performance before 1600 2', 'Research early music, create and perform from your own editions', 'Final Year'),
('AHM1415', 'Solo performance 1', 'Individual tuition on your instrument, leading to a solo recital, classical or pop instruments or voice', 'Year One'),
('AIM2416', 'Solo performance 2 (minor)', 'Individual tuition on your instrument, leading to a solo recital, classical or pop instruments or voice', 'Year Two'),
('AHM3416', 'Solo performance 3 (minor)', 'Individual tuition on your instrument, leading to a solo recital', 'Final Year'),
('AFM1110', 'Songwriting 1', 'Compose your own songs', 'Year One'),
('AIM2110', 'Songwriting 2', 'Compose your own songs', 'Year Two'),
('AHM3403', 'Studies in performance', 'Supporting classes for advanced solo performers, with platform time, workshops, seminars and master classes', 'Final Year'),
('AFM1213', 'Stylistic composition', 'Write music in a variety of different styles', 'Year One'),
('AIM2506', 'Techniques of music analysis 1', 'Explore advanced analytical techniques', 'Year Two'),
('AHM3511', 'Techniques of music analysis 2', 'Explore advanced analytical techniques', 'Final Year'),
('AFM1208', 'Technology for music', 'Learn to use notation software, record sound and write music using computer software', 'Year One'),
('NHE2425', 'Vision & sound', 'Introduction to the use of  sound editing packages with video. The early part of the course will concentrate on the establishment of core skills. Simultaneously, you will begin to study and explore the creative and aesthetic aspects of adding sound and music to picture.', 'Final Year'),
('AHM3506', 'Work and professional practice', 'Explore current research in musicology and write your own research project', 'Final Year');

-- --------------------------------------------------------

--
-- Table structure for table `School`
--

CREATE TABLE IF NOT EXISTS `School` (
  `SchoolID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SchoolID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `School`
--

INSERT INTO `School` (`SchoolID`, `Name`) VALUES
(1, 'School of Music Humanities and'),
(2, 'School of Computing and Engine');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

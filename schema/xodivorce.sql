-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 20, 2026 at 06:53 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xodivorce`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL,
  `post_link` varchar(255) NOT NULL,
  `post_image` varchar(255) DEFAULT NULL,
  `post_image_alt` varchar(255) DEFAULT NULL,
  `post_category` varchar(100) NOT NULL,
  `post_date` date NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_text` text NOT NULL,
  `platform` enum('YouTube','Instagram','Facebook','Pinterest','Other') NOT NULL,
  `post_iframe` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `post_link`, `post_image`, `post_image_alt`, `post_category`, `post_date`, `post_title`, `post_text`, `platform`, `post_iframe`) VALUES
(1, 'https://www.youtube.com/watch?v=omSz7gUnyG0', './themes/dark_theme/assets/images/blogs/how-to-install-grand-theft-auto-iv.webp', 'how-to-install-grand-theft-auto-iv', 'Game', '2024-06-27', 'How To Install Grand Theft Auto IV - MacBook Air M1', 'Hey there, awesome people! 🚀 In this video, I’ll show you how to install GTA IV or else on macOS. We\'re exploring how people gonna play Mac games(🎮) for free and how the process works.', 'YouTube', NULL),
(2, 'https://www.youtube.com/watch?v=ZHySccRced0', './themes/dark_theme/assets/images/blogs/your-mac-will-never-be-the-same!.webp', 'your-mac-will-never-be-the-same!', 'OS', '2024-08-17', 'Your Mac will NEVER be the same!', 'Hey there, awesome people! 🚀 In today’s video, I’ll show you how to effortlessly update your Mac to macOS 15.1. And khow about is it perfect to update the base model of Mac with M1 chip! 🍏✨\r\n', 'YouTube', NULL),
(3, 'https://www.youtube.com/watch?v=0xZDMwt3aXA', './themes/dark_theme/assets/images/blogs/bluestacks-air-tutorial-m1.webp', 'bluestacks-air-tutorial-m1', 'OS', '2025-03-31', 'How To Play Android Games - Mac Book Air M1', 'Hey there, awesome people!🚀 In this video, I’ll show you how to effortlessly install Android Games on your macOS. It\'s quick & easy for all you gamers out there! 🎮🍏', 'YouTube', NULL),
(4, 'https://www.youtube.com/watch?v=D7ZGFCCfVkM', './themes/dark_theme/assets/images/blogs/cracked-softwares-on-macbook.webp', 'cracked-softwares-on-macbook', 'OS', '2025-11-04', 'Cracked Softwares On MacBook?', 'This video is for educational purposes(📚) only. We’re exploring how people find modified Mac apps and how the process works - but please use this knowledge responsibly 👻.\r\n', 'YouTube', NULL),
(5, 'https://www.instagram.com/p/CtG2gzyrGEQ/', NULL, 'It Ends With Us 🥀', 'Instagram', '2023-09-13', 'It Ends With Us 🥀', 'There is no such thing as bad people. We\'re all just people who sometimes do bad things...🥀 #IT ENDS WITH US, click to view on Instagram.', 'Instagram', NULL),
(6, 'https://www.instagram.com/p/C5LnyqLS5HR/', NULL, 'Apple MacBook Air M1 💻', 'Instagram', '2024-03-31', 'Apple MacBook Air M1 💻', 'Sometimes it\'s you, all you need to find yourself..☺️, I\'ve tried to spend all days through my Mac Air M1; click to view on Instagram.', 'Instagram', NULL),
(7, 'https://www.instagram.com/p/DMF7eIcyqKE/', NULL, 'Spotify 🎧', 'Instagram', '2024-05-14', 'Spotify 🎧', 'Her~ @this.is.gini , in dream 🌬️✨ !!, I\'ve tried this song and in love with it - spend all days 😭♥️; click to view on Instagram.', 'Instagram', NULL),
(8, 'https://www.instagram.com/reel/C78eHXlS3jf/', NULL, '나비 🦋', 'Instagram', '2024-06-08', '나비 🦋', 'Nymphalis polychloros & micro generative video. The butterfly(나비) is so pretty 😭🦋♥️ and fully upscaled through AI, click to view on Instagram.', 'Instagram', NULL),
(9, 'https://www.instagram.com/p/DMF8pH6yHRn/', NULL, 'Best of 2k23 🗿', 'Instagram', '2024-08-19', 'Best of 2k23 🗿', 'Don\'t compare me with others, if they\'re better, go with them; idgaf...!!; click to view on Instagram.', 'Instagram', NULL),
(10, 'https://www.instagram.com/p/DMF_FFMydz1/', NULL, 'My small Lilith.. 💨', 'Instagram', '2025-07-19', 'My small Lilith..💨', 'So, I bought the MacBook Air M1 finally. After lots of efforts finally full-fill my dream towards apple devices.', 'Instagram', NULL),
(11, 'https://www.instagram.com/p/DMGDoGZyagG/', NULL, 'Kolkata: The City of Joy 🤩', 'Instagram', '2025-07-18', 'Kolkata: The City of Joy 🤩', 'I explored all of the parts of Kolkata, with my friends and we made a lot of memories.', 'Instagram', NULL),
(12, 'https://www.instagram.com/reel/DAuptyny9dz/', NULL, 'Happy endings ✨', 'Instagram', '2024-10-05', 'Happy endings✨', 'Tried this trend \' 💀, better luck next time <3. \'; Everyone does deserve happy endings 🗿, for me not everyone. Click to view on Instagram.', 'Instagram', NULL),
(13, 'https://www.instagram.com/p/C64SDX1yI2B/', NULL, 'Prequelapp', 'Instagram', '2024-05-13', 'Prequelapp', 'Try this app @prequelapp with my sorts, in love 😭♥️. The filter named Air, Click to view on Instagram.', 'Instagram', NULL),
(14, 'https://www.instagram.com/p/DMGPxPSSI_9/', '', 'HR Meetup, Euphoria..💨', 'Instagram', '2025-07-20', 'HR Meetup, Euphoria..💨', 'Memories in 2k24, the fan meetup in Sep was unexpected! Some great clicks—check them out on Instagram.', 'Instagram', NULL),
(15, 'https://www.instagram.com/p/DMGQhIeyID4/', '', 'Santiniketan 🧩', 'Instagram', '2024-09-10', 'Santiniketan 🧩', 'Explored Santiniketan tourist spots. Although the adventure is awesome, must try at least once in a life.', 'Instagram', NULL),
(16, 'https://www.instagram.com/p/DNdRT2pS2X-/', '', 'iPhone 16 🪻.𖥔 ݁˖‧˖', 'Instagram', '2025-08-15', 'iPhone 16 🪻.𖥔 ݁˖‧˖', 'And if I changed everything - yeah, my whole fucking life! would you please love me? - yeah thats for my iPhone 16 🌪️', 'Instagram', NULL),
(17, 'https://www.instagram.com/p/DN2ROTx5BZR/', NULL, 'Salt Lake City 🌆', 'Instagram', '2025-08-27', 'Salt Lake City 🌆', 'At the dawn, the city feels like: Baby, I’m obsessed with you, and there’s no replica..🦋', 'Instagram', NULL),
(18, 'https://www.instagram.com/p/DOJlR9XkkEn/', '', 'A moody Kolkata 🌧️', 'Instagram', '2025-09-06', 'A moody Kolkata 🌧️', 'So give me the night to show you, hold you - don’t leave me out here dancin’ alone! Kolkata on a railny day hits hard though.', 'Instagram', NULL),
(19, 'https://www.instagram.com/p/DP2GE0-kpL8/', NULL, 'Naihati, 24 PGS(N)', 'Instagram', '2025-10-16', 'Naihati, 24 PGS(N)', 'I visited the Naihati, 24 PGS(N) with my mom; specially for Puja. Else I shot down some amazing pics on there ✨.', 'Instagram', NULL),
(20, 'https://www.instagram.com/p/DQz1NK4k5-t/', NULL, 'Swipe 👉🏻', 'Instagram', '2025-11-09', 'Swipe 👉🏻', 'Exactly nothing. I just live for a few hours on Instagram, Omegle. I enjoyed taking to random people from the world 🌍.', 'Instagram', NULL),
(21, 'https://www.instagram.com/p/DSWpP51kvSN/', NULL, 'Abroad Fair, LeapScholar 💻', 'Instagram', '2025-12-15', 'Abroad Fair, LeapScholar 💻', 'I visited the Abroad Study Fair by LeapScholar and spoke with representatives from several Western universities 🌍🎓.', 'Instagram', NULL),
(22, 'https://www.instagram.com/p/DSWrQ-iElV3/', NULL, 'St. Paul\'s Cathedral ♾️ †', 'Instagram', '2025-12-16', 'St. Paul\'s Cathedral ♾️ †', 'I spent a peaceful afternoon at Kolkata Maidan 🌿 and visited St. Paul’s Cathedral †. Overall it was a quiet and well-maintained place!', 'Instagram', NULL),
(23, 'https://www.instagram.com/reel/DMavV9XSh5Z/', NULL, 'The Theory of One Lap 🏎️', 'Instagram', '2025-07-22', 'The Theory of One Lap 🏎️', 'There\'s a point at 7,000 RPM... where everything fades. The machine becomes weightless. Just disappears!', 'Instagram', NULL),
(24, 'https://www.instagram.com/reel/DPZefBpk1HA/', NULL, 'Basirhat Carnival 25\'.. 🎡', 'Instagram', '2025-10-05', 'Basirhat Carnival 25\'.. 🎡', 'Shot on iPhone 16, edited on Mac, and brought to you on Instagram 📸 - capturing the energy, colors, and moments of the Basirhat Carnival 🎡.', 'Instagram', NULL),
(25, 'https://www.instagram.com/reel/DPf6IlmkbZk/', NULL, 'Yeah, we changed 🥀', 'Instagram', '2025-10-07', 'Yeah, we changed 🥀', 'This edit is for my gaming channel @divorce_plays 🎮💔 - moments, emotions, and silence between the shots. Sometimes the loudest changes happen quietly.', 'Instagram', NULL),
(26, 'https://www.instagram.com/reel/DRm9id_kgOY/', NULL, '日本利用压电瓷砖将脚步转化...', 'Instagram', '2025-11-28', '日本利用压电瓷砖将脚步转化...', 'I tried using this prompt purely for virality — and yeah, it worked. 🚀 We crossed 4.5M+ views. ⚡️', 'Instagram', NULL),
(27, 'https://www.instagram.com/reel/DSeh4BvkoEN/', NULL, '日本利用压电瓷砖将脚步转化为...', 'Instagram', '2025-12-20', '日本利用压电瓷砖将脚步转化为...', 'I tried a second time using this prompt purely for virality — and this time, it didn’t work. 😔', 'Instagram', NULL),
(28, 'https://www.instagram.com/reel/DSkPhNBEZbN/', NULL, 'Recap \'25 ⏳', 'Instagram', '2025-12-22', 'Recap \'25 ⏳', 'POV: 2025 is about to end — and this is your recap. The moments, the lessons, the wins, and everything in between. ✨', 'Instagram', NULL),
(29, 'https://www.instagram.com/p/DUDPPikklvu/?img_index=1', NULL, 'U da real love ❤️‍🩹', 'Instagram', '2026-01-28', 'U da real love ❤️‍🩹', 'A calm rooftop evening, lost in the moment 🌆. Clicked a few frames while the city slowed down - soft skies ☁️, quiet thoughts, and that kind of peace you don’t plan.', 'Instagram', NULL),
(30, 'https://www.instagram.com/p/DUOYFRBEq-R/?img_index=1', NULL, 'A day at GFG Kolkata 🏢', 'Instagram', '2026-02-02', 'A day at GFG Kolkata 🏢', 'Invited to the GeeksforGeeks Kolkata office - a day filled with insightful conversations 💡, community energy 🤝, and a closer look at how ideas turn into impact. Grateful for the experience and the people behind the platform.', 'Instagram', NULL),
(31, 'https://www.instagram.com/p/DUdF6BJEvns/?img_index=1', NULL, 'Last night, unforgettable 🎸', 'Instagram', '2026-02-07', 'Last night, unforgettable 🎸', 'Last night was unforgettable - attending the KEI Alumni event as an ex-student. Pure vibes, great music, and moments that stay with you. Huge love to @fakiramusic for making it special 🎶✨.', 'Instagram', NULL),
(32, 'https://www.instagram.com/p/DVjPepLkl5C/?img_index=1', NULL, 'She’s the colour :)', 'Instagram', '2026-03-20', 'She’s the colour :)', 'When she becomes your colour, and you start painting your life with her interests 🎨✨', 'Instagram', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `maintenance`
--

INSERT INTO `maintenance` (`id`, `is_active`, `updated_at`) VALUES
(1, 0, '2025-12-13 08:19:54');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_category` varchar(100) NOT NULL,
  `project_image` varchar(255) NOT NULL,
  `project_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `project_name`, `project_category`, `project_image`, `project_link`) VALUES
(1, 'Xodivorce.In', 'Web development', './themes/dark_theme/assets/images/projects/xodivorce_in_project.webp', 'https://www.xodivorce.in'),
(2, 'Isdowndetectordown', 'Web development', './themes/dark_theme/assets/images/projects/isdowndetectordown_project.webp', 'https://isdowndetectordown.xodivorce.in'),
(3, 'Face Recognigation System', 'Applications', './themes/dark_theme/assets/images/projects/face_recognation_project.webp', 'https://github.com/xodivorce/face_recognise_attend'),
(4, 'Anyencrypter Bot', 'Applications', './themes/dark_theme/assets/images/projects/encrypter_project.webp', 'https://telegram.me/anyencrypter_bot'),
(5, 'Xeorl - Link Shortener', 'Web development', './themes/dark_theme/assets/images/projects/xeorl_project.webp', 'https://xeorl.xodivorce.in'),
(6, 'Zukes - IG', 'Applications', './themes/dark_theme/assets/images/projects/zukes_ig_project.webp', 'https://telegram.me/Zukesinsta_bot'),
(7, 'Breakout Ball Game', 'Applications', './themes/dark_theme/assets/images/projects/breakout_game_project.webp', 'https://github.com/xodivorce/breakout-game'),
(8, 'Solar Explorer', 'Web development', './themes/dark_theme/assets/images/projects/solar_explorer_project.webp', 'https://solar-explorer.xodivorce.in'),
(9, 'Npx - Xodivorce', 'Applications', './themes/dark_theme/assets/images/projects/npx_business_card_project.webp', 'https://github.com/xodivorce/npx-xodivorce');

-- --------------------------------------------------------

--
-- Table structure for table `resume_education`
--

CREATE TABLE `resume_education` (
  `id` int(11) NOT NULL,
  `institution` varchar(255) NOT NULL,
  `degree` varchar(255) NOT NULL,
  `start_year` year(4) NOT NULL,
  `end_year` year(4) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resume_education`
--

INSERT INTO `resume_education` (`id`, `institution`, `degree`, `start_year`, `end_year`, `description`) VALUES
(1, 'Kingston Polytechnic College', 'Diploma in Computer Science and Technology (WBSCVTESD)', '2023', '2025', 'Kingston Polytechnic College, affiliated with Kingston Educational Institute (KEI); Barasat - Barrackpore Rd, Kajibari, Kolkata, West Bengal 700126.'),
(2, 'Basirhat High School (HS)', 'Higher Secondary Education (WBCHSE)', '2021', '2023', 'Completed 11th and 12th grade with Science (Physics, Chemistry, Biology) and Computer Applications under the WB Board at Basirhat High School (HS).'),
(3, 'Basirhat Town High School (HS)', 'Secondary Education (WBBSE)', '2015', '2021', 'Completed 5th to 10th grades under the WB Board at Basirhat Town High School (HS). Studied PT (Physical Training), Computer Studies, and Construction, gaining foundational knowledge and practical skills.'),
(4, 'Bhawanipur Harimohan Primary School', 'Primary Education (WBBPE)', '2011', '2015', 'Attended Bhawanipur Harimohan Primary School from class 1 to 4, starting with basic ABC and computer skills. Introduced to MS Paint, Word, and other applications from class 3 onwards.'),
(5, 'Camellia Institute of Technology', 'Bachelor of Technology (B.Tech) in Computer Science and Engineering (CSE)', '2025', '2028', 'Camellia Institute of Technology, under Maulana Abul Kalam Azad University of Technology (MAKAUT); located at Digberia, Badu Road, Near NSG Hub, Madhyamgram, Kolkata - 700128.');

-- --------------------------------------------------------

--
-- Table structure for table `resume_experience`
--

CREATE TABLE `resume_experience` (
  `id` int(11) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `start_year` year(4) NOT NULL,
  `end_year` varchar(10) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resume_experience`
--

INSERT INTO `resume_experience` (`id`, `job_title`, `start_year`, `end_year`, `description`) VALUES
(1, 'Web Developer (MERN)', '2024', 'Present', 'Currently expanding my skills with the MERN stack (MongoDB, Express, React, Node.js). \r\nWorking on new and exciting projects using modern web technologies. \r\nMore MERN stack-based projects are coming soon!'),
(2, 'Web Developer (Laravel)', '2023', 'Present', 'Self-taught Full Stacked Web Developed and managed web projects, including xodivorce.in. Collaborated with clients to create and deploy customized web solutions using HTML5, CSS3, JavaScript, PHP, and MySQL. Ensured mobile-friendliness with responsive design principles.'),
(3, 'CITA - IT And ITAS', '2023', '2024', 'Completed Youth Computer Training at CITA in Basirhat, West Bengal. Acquired practical experience with a range of IT tools and technologies. Successfully finished the IT/ITAS training program, which lasted for 6 months.'),
(4, 'Mobile App Development (iOS & Android)', '2025', 'Present', 'Learning to build modern iOS applications using Swift and SwiftUI, and modern Android applications using Kotlin and Jetpack Compose - with a strong focus on clean UI design, smooth performance, and intuitive user interactions.'),
(5, 'GeeksforGeeks Campus Ambassador (Campus Mantri)', '2026', '2026', 'Representing GeeksforGeeks as the official Campus Mantri at Camellia Institute of Technology (CIT), Kolkata. Mentoring students in DSA, web development, and career preparation. Organizing workshops, coding initiatives, and technical sessions to foster a strong problem-solving and learning culture on campus.');

-- --------------------------------------------------------

--
-- Table structure for table `resume_skills`
--

CREATE TABLE `resume_skills` (
  `id` int(11) NOT NULL,
  `skill_name` varchar(100) NOT NULL,
  `skill_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resume_skills`
--

INSERT INTO `resume_skills` (`id`, `skill_name`, `skill_level`) VALUES
(1, 'HTML', 95),
(2, 'CSS', 90),
(3, 'JavaScript', 65),
(4, 'PHP', 80),
(5, 'MySQL', 85),
(6, 'GIT', 85),
(7, 'Tailwindcss', 80),
(8, 'MongoDB', 75),
(9, 'Express.js', 50),
(10, 'React.js', 60),
(11, 'Node.js', 45),
(12, 'Python', 75),
(13, 'C', 35),
(14, 'Java', 45),
(15, 'Kotlin', 55);

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` int(11) NOT NULL,
  `platform` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon_name` varchar(50) NOT NULL,
  `display_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `platform`, `url`, `icon_name`, `display_order`) VALUES
(1, 'YouTube', 'https://www.youtube.com/@xodivorce', 'logo-youtube', 1),
(2, 'Instagram', 'https://www.instagram.com/xodivorce', 'logo-instagram', 2),
(3, 'GitHub', 'https://github.com/xodivorce', 'logo-github', 3),
(4, 'Pinterest', 'https://pinterest.com/xodivorc3/', 'logo-pinterest', 4),
(5, 'LinkedIn', 'https://www.linkedin.com/in/xodivorce/', 'logo-linkedin', 5);

-- --------------------------------------------------------

--
-- Table structure for table `town_map`
--

CREATE TABLE `town_map` (
  `id` int(11) NOT NULL,
  `town_name` varchar(255) NOT NULL,
  `main_city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `town_map`
--

INSERT INTO `town_map` (`id`, `town_name`, `main_city`) VALUES
(1, 'Alipurduar', 'Alipurduar, India'),
(2, 'Asansol', 'Asansol, India'),
(3, 'Bagdogra', 'Siliguri, India'),
(4, 'Balurghat', 'Dakshin Dinajpur, India'),
(5, 'Bally', 'Howrah, India'),
(6, 'Bankura', 'Bankura, India'),
(7, 'Baranagar', 'Kolkata, India'),
(8, 'Barasat', 'Kolkata, India'),
(9, 'Barrackpore', 'Kolkata, India'),
(10, 'Basirhat', 'Kolkata, India'),
(11, 'Bhadreswar', 'Howrah, India'),
(12, 'Bhatpara', 'Kolkata, India'),
(13, 'Bidhannagar', 'Kolkata, India'),
(14, 'Birnagar', 'Nadia, India'),
(15, 'Bishnupur', 'Bankura, India'),
(16, 'Bolpur', 'Birbhum, India'),
(17, 'Bongaon', 'Kolkata, India'),
(18, 'Burnpur', 'Asansol, India'),
(19, 'Chakdaha', 'Nadia, India'),
(20, 'Contai', 'Purba Medinipur, India'),
(21, 'Domjur', 'Howrah, India'),
(22, 'Dumdum', 'Kolkata, India'),
(23, 'Durgapur', 'Durgapur, India'),
(24, 'Egra', 'Purba Medinipur, India'),
(25, 'Haldia', 'Purba Medinipur, India'),
(26, 'Howrah', 'Howrah, India'),
(27, 'Jamuria', 'Asansol, India'),
(28, 'Jalpaiguri', 'Jalpaiguri, India'),
(29, 'Kalyani', 'Nadia, India'),
(30, 'Kharagpur', 'Midnapore, India'),
(31, 'Krishnanagar', 'Nadia, India'),
(32, 'Kulti', 'Asansol, India'),
(33, 'Matigara', 'Siliguri, India'),
(34, 'Memari', 'Durgapur, India'),
(35, 'Nabadwip', 'Nadia, India'),
(36, 'Naihati', 'Kolkata, India'),
(37, 'Naxalbari', 'Siliguri, India'),
(38, 'Panagarh', 'Durgapur, India'),
(39, 'Purulia', 'Purulia, India'),
(40, 'Raiganj', 'Uttar Dinajpur, India'),
(41, 'Ranaghat', 'Nadia, India'),
(42, 'Raniganj', 'Asansol, India'),
(43, 'Salt Lake City', 'Kolkata, India'),
(44, 'Sankrail', 'Howrah, India'),
(45, 'Siliguri', 'Darjeeling, India'),
(46, 'Tamluk', 'Purba Medinipur, India'),
(47, 'Uluberia', 'Howrah, India');

-- --------------------------------------------------------

--
-- Table structure for table `words_by_them`
--

CREATE TABLE `words_by_them` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(500) NOT NULL,
  `message` text NOT NULL,
  `date_added` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `words_by_them`
--

INSERT INTO `words_by_them` (`id`, `name`, `avatar`, `message`, `date_added`) VALUES
(1, 'AutoSquare Store', './themes/dark_theme/assets/images/avatars/avatar-1.png', 'We recently came across your GitHub profile and were truly impressed by your skills and projects. We think you could be a fantastic addition to our team at AutoSquare as a Full Stack Software Engineer.', '2024-11-30'),
(3, 'IIT Guwahati', './themes/dark_theme/assets/images/avatars/avatar-5.png', 'We are delighted to welcome you to the Credit-linked Program in Data Science, offered by Daksh Gurukul IIT Guwahati.\r\n\r\nYour journey toward academic excellence and personal growth begins now, and we are committed to supporting you every step of the way.', '2025-01-19'),
(4, 'Xiaorui from AutoMQ', './themes/dark_theme/assets/images/avatars/avatar-3.png', 'Prasid has shown a deep interest in open source, which immediately stood out to us. His passion and contributions align perfectly with high-performance systems like AutoMQ, and we believe his feedback and insights would be incredibly valuable.', '2025-06-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resume_education`
--
ALTER TABLE `resume_education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resume_experience`
--
ALTER TABLE `resume_experience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `town_map`
--
ALTER TABLE `town_map`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `words_by_them`
--
ALTER TABLE `words_by_them`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `resume_education`
--
ALTER TABLE `resume_education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `resume_experience`
--
ALTER TABLE `resume_experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

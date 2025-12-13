-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 10, 2025 at 05:54 PM
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
(1, 'https://www.youtube.com/watch?v=omSz7gUnyG0', './themes/dark_theme/assets/images/blogs/how-to-install-grand-theft-auto-iv.jpg', 'how-to-install-grand-theft-auto-iv', 'Game', '2024-06-27', 'How To Install Grand Theft Auto IV - MacBook Air M1', 'Hey there, awesome people! 🚀 In this video, I’ll show you how to install CrossOver on macOS.', 'YouTube', NULL),
(2, 'https://www.youtube.com/watch?v=ZHySccRced0', './themes/dark_theme/assets/images/blogs/your-mac-will-never-be-the-same!.jpg', 'your-mac-will-never-be-the-same!', 'OS', '2024-08-17', 'Your Mac will NEVER be the same!', 'Hey there, awesome people! 🚀 In this video, I’ll show you how to effortlessly install CrossOver on your macOS. It\'s quick, it\'s easy, and it’s perfect for all you gamers and app lovers out there! 🎮🍏', 'YouTube', ''),
(3, 'https://www.youtube.com/watch?v=0xZDMwt3aXA', './themes/dark_theme/assets/images/blogs/bluestacks-air-tutorial-m1.jpg', 'bluestacks-air-tutorial-m1', 'OS', '2025-03-31', 'How To Play Android Games - Mac Book Air M1', 'Welcome to the Homebrew installation tutorial! Works on All Apple Silicons (M1-M4) 🚀\r\n     Today, we’ll get Homebrew up and running on your Mac in no time! 🍏✨', 'YouTube', NULL),
(4, 'https://www.youtube.com/watch?v=D7ZGFCCfVkM', './themes/dark_theme/assets/images/blogs/cracked-softwares-on-macbook.jpg', 'cracked-softwares-on-macbook', 'OS', '2025-11-04', 'Cracked Softwares On MacBook?', 'This video is for educational purposes only. We’re exploring how people find modified Mac apps and how the process works - but please use this knowledge responsibly.\r\n', 'YouTube', NULL),
(11, 'https://www.facebook.com/share/14gwR67wAQq/', NULL, 'Talks 🌒', 'Facebook', '2023-03-08', 'Talks 🌒', '\'Like if you hold me without hurting me,<br>\r\n     &nbsp;You\'ll be the one who ever did.\' <br>~ And the Sun replies, click to view on Facebook.', 'Facebook', 'https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto.php%3Ffbid%3D935622664537381%26set%3Da.191979372235051%26type%3D3&show_text=false&width=500'),
(12, 'https://www.facebook.com/share/14gwR67wAQq/', NULL, 'Nostalgia 🎐', 'Facebook', '2023-02-06', 'Nostalgia 🎐', '\'Hold her while you can,<br>\r\n     &nbsp;\'Cause someday you won\'t get the chance!!\'<br>~ Some of my fav lyrics, click to view on Facebook.', 'Facebook', 'https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto.php%3Ffbid%3D917376926361955%26set%3Da.290981085668212%26type%3D3&show_text=false&width=500'),
(14, 'https://www.facebook.com/share/19VToboxEU/', NULL, 'Getting Over You 📙', 'Facebook', '2023-02-22', 'Getting Over You 📙', '\'What do you do<br> when your problem<br> and your solution<br> is the same person 🦋 ?\'<br>~ One of my fav books! Click to view on Facebook.', 'Facebook', 'https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto.php%3Ffbid%3D927474668685514%26set%3Da.191979372235051%26type%3D3&show_text=false&width=500'),
(15, 'https://www.facebook.com/share/12E7Gz9Dn5q/', NULL, 'Fallen Angel vibes. 🪐', 'Facebook', '2023-05-04', 'Fallen Angel vibes. 🪐', 'I\'m amazed that a railway station can feel like an angelic place 🦋. Here are some shots! Click to view on Facebook.', 'Facebook', 'https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto.php%3Ffbid%3D967019374731043%26set%3Da.191979372235051%26type%3D3&show_text=false&width=500'),
(16, 'https://www.facebook.com/share/1CvRJpYgr8/', NULL, 'Childish <', 'Facebook', '2023-04-20', 'Childish <', 'This is kinda Doraemon-era, so if we go back in time… But if we can 🫥.! Click to view on Facebook.', 'Facebook', 'https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto.php%3Ffbid%3D959398318826482%26set%3Da.290981085668212%26type%3D3&show_text=false&width=500'),
(17, 'https://www.facebook.com/photo.php?fbid=968598017906512&set=pb.100042689670857.-2207520000&type=3', NULL, 'Selenophile 🌒', 'Facebook', '2023-05-07', 'Selenophile 🌒', 'Hi, I\'m a selenophile 🌓, that\'s enough about me! So what is your type? Click to view on Facebook.', 'Facebook', 'https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto%2F%3Ffbid%3D968598017906512%26set%3Da.100419004724422&show_text=false&width=500'),
(18, 'https://www.facebook.com/share/p/15NQqY1EoF/', NULL, 'Blood Moon 🌒', 'Facebook', '2023-05-05', 'Blood Moon 🌒', 'Randomly at 📍 Basirhat Picnic Spot, spotted a Blood Moon. Here\'s some potoshots as I\'m a selenophile 🌓. Click to view photos on Facebook.', 'Facebook', 'https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto.php%3Ffbid%3D967628648003449%26set%3Da.191979372235051%26type%3D3&show_text=false&width=500'),
(19, 'https://www.facebook.com/photo.php?fbid=1231288908304087&set=a.100419004724422&type=3&ref=embed_post', NULL, 'Fest - KEI, 2k24 ✨', 'Facebook', '2024-08-09', 'Fest - KEI, 2k24 ✨', 'The first freshers Fest of Kingston Educational Institute \'23. That was an extreme day! Click to view on Facebook.', 'Facebook', 'https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto%2F%3Ffbid%3D1231288908304087%26set%3Da.100419004724422&show_text=false&width=500'),
(20, 'https://www.facebook.com/share/p/19g563kDKT/', NULL, 'Tarapith - 2, 2k23 ✨', 'Facebook', '2023-06-22', 'Tarapith - 2, 2k23 ✨', 'Bhaichara..!! @_the_swagatam also clicked some shots. Just in case if you\'re interested, click to view on Facebook.', 'Facebook', 'https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto.php%3Ffbid%3D994757075290606%26set%3Da.191979372235051%26type%3D3&show_text=false&width=500'),
(21, 'https://www.facebook.com/share/p/15YDwD9kiY/', NULL, 'Tarapith - 1, 2k23 ✨', 'Facebook', '2023-06-21', 'Tarapith - 1, 2k23 ✨', 'Bhaichara..!! @_the_swagatam also clicked some shots. Just in case if you\'re interested, click to view on Facebook.', 'Facebook', 'https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto.php%3Ffbid%3D994762201956760%26set%3Da.191979372235051%26type%3D3&show_text=false&width=500'),
(22, 'https://www.facebook.com/photo.php?fbid=1064175378348775&set=a.100419004724422&type=3&ref=embed_post', NULL, 'Did\'t give a shit', 'Facebook', '2023-10-28', 'Did\'t give a shit', 'And the moral of the story is: \"Don\'t give a lecture to someone who just needs a hug.\" They don\'t give a f*** about your lecture! Click to view on Facebook.', 'Facebook', 'https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto%2F%3Ffbid%3D1064175378348775%26set%3Da.100419004724422&show_text=false&width=500'),
(23, 'https://www.facebook.com/share/p/1CrDQA1gkB/', NULL, 'Be Black', 'Facebook', '2024-07-15', 'Be Black', 'The world is filled with \"Color\" and \"Rainbows\". If you aren\'t one, be the Black. Click to view on Facebook.', 'Facebook', 'https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto.php%3Ffbid%3D1004317811001199%26set%3Da.290981085668212%26type%3D3&show_text=true&width=500'),
(24, 'https://www.facebook.com/share/17P8aRqnWR/', NULL, 'Be One', 'Facebook', '2023-07-08', 'Be One', 'The world is filled with \"Good\" and \"Kind\" people. If you can\'t find one, be one! Click to view on Facebook.', 'Facebook', 'https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto.php%3Ffbid%3D1168922104540768%26set%3Da.100942014672121%26type%3D3&show_text=false&width=500'),
(25, 'https://www.facebook.com/photo.php?fbid=1105122847587361&set=pb.100042689670857.-2207520000&type=3', NULL, 'Developer', 'Facebook', '2024-01-10', 'Developer', '⚡ An 18-year-old self-taught full-stack web and Android developer & UI/UX designer ✨ is hustling to spice things up and make them more interesting! 🚀 Click to view on Facebook.', 'Facebook', 'https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto%2F%3Ffbid%3D1105122847587361%26set%3Da.100419004724422&show_text=true&width=500'),
(26, 'https://www.instagram.com/p/CtG2gzyrGEQ/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', NULL, 'It Ends With Us 🥀', 'Instagram', '2023-09-13', 'It Ends With Us 🥀', 'There is no such thing as bad people. We\'re all just people who sometimes do bad things...🥀 #IT ENDS WITH US, click to view on Instagram.', 'Instagram', '<blockquote class=\"instagram-media\" data-instgrm-permalink=\"https://www.instagram.com/p/CtG2gzyrGEQ/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==\" data-instgrm-version=\"14\" style=\"width:100%;\"></blockquote><script async src=\"//www.instagram.com/embed.js\"></script>'),
(27, 'https://www.instagram.com/p/C5LnyqLS5HR/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', NULL, 'Apple MacBook Air M1 💻', 'Instagram', '2024-03-31', 'Apple MacBook Air M1 💻', 'Sometimes it\'s you, all you need to find yourself..☺️, I\'ve tried to spend all days through my Mac Air M1; click to view on Instagram.', 'Instagram', '<blockquote class=\"instagram-media\" data-instgrm-permalink=\"https://www.instagram.com/p/C5LnyqLS5HR/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==\" data-instgrm-version=\"14\" style=\"width:100%;\"></blockquote><script async src=\"//www.instagram.com/embed.js\"></script>'),
(28, 'https://www.instagram.com/p/C68ujtkSvvF/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', NULL, 'Spotify 🎧', 'Instagram', '2024-05-14', 'Spotify 🎧', 'Her~ @this.is.gini , in dream 🌬️✨ !!, I\'ve tried this song and in love with it - spend all days 😭♥️; click to view on Instagram.', 'Instagram', '<blockquote class=\"instagram-media\" data-instgrm-permalink=\"https://www.instagram.com/p/C68ujtkSvvF/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==\" data-instgrm-version=\"14\" style=\"width:100%;\"></blockquote><script async src=\"//www.instagram.com/embed.js\"></script>'),
(29, 'https://www.instagram.com/reel/C78eHXlS3jf/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', NULL, '나비 🦋', 'Instagram', '2024-06-08', '나비 🦋', 'Nymphalis polychloros & micro generative video. The butterfly(나비) is so pretty 😭🦋♥️ and fully upscaled through AI, click to view on Instagram.', 'Instagram', '<blockquote class=\"instagram-media\" data-instgrm-permalink=\"https://www.instagram.com/reel/C78eHXlS3jf/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==\" data-instgrm-version=\"14\" style=\"width:100%;\"></blockquote><script async src=\"//www.instagram.com/embed.js\"></script>'),
(30, 'https://www.instagram.com/p/C-3EmVtSQ73/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', NULL, 'Best of 2k23 🗿', 'Instagram', '2024-08-19', 'Best of 2k23 🗿', 'Don\'t compare me with others, if they\'re better, go with them; idgaf...!!; click to view on Instagram.', 'Instagram', '<blockquote class=\"instagram-media\" data-instgrm-permalink=\"https://www.instagram.com/p/C-3EmVtSQ73/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==\" data-instgrm-version=\"14\" style=\"width:100%;\"></blockquote><script async src=\"//www.instagram.com/embed.js\"></script>'),
(31, 'https://www.instagram.com/p/C-80l0gyDkx/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', NULL, 'Santiniketan 2k23 🍀', 'Instagram', '2024-08-22', 'Santiniketan 2k23 🍀', 'Bhaichara..!! @_the_swagatam also some sorts clicked by him. Just in case if you\'re interested, click to view on Instagram.', 'Instagram', '<blockquote class=\"instagram-media\" data-instgrm-permalink=\"https://www.instagram.com/p/C-80l0gyDkx/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==\" data-instgrm-version=\"14\" style=\"width:100%;\"></blockquote><script async src=\"//www.instagram.com/embed.js\"></script>'),
(32, 'https://www.instagram.com/p/C_yaQx7TEa7/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', NULL, 'Maya Pur, Nadia 2k22 ✨', 'Instagram', '2024-09-12', 'Maya Pur, Nadia 2k22 ✨', 'Bhaichara..!! @_the_swagatam also some sorts clicked by him. Just in case if you\'re interested, click to view on Instagram.', 'Instagram', '<blockquote class=\"instagram-media\" data-instgrm-permalink=\"https://www.instagram.com/p/C_yaQx7TEa7/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==\" data-instgrm-version=\"14\" style=\"width:100%;\"></blockquote><script async src=\"//www.instagram.com/embed.js\"></script>'),
(33, 'https://www.instagram.com/reel/DAuptyny9dz/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', NULL, 'Happy endings✨', 'Instagram', '2024-10-05', 'Happy endings✨', 'Tried this trend \' 💀, better luck next time <3. \'; Everyone does deserve happy endings 🗿, for me not everyone. Click to view on Instagram.', 'Instagram', '<blockquote class=\"instagram-media\" data-instgrm-permalink=\"https://www.instagram.com/reel/DAuptyny9dz/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==\" data-instgrm-version=\"14\" style=\"width:100%;\"></blockquote><script async src=\"//www.instagram.com/embed.js\"></script>'),
(34, 'https://www.instagram.com/p/C64SDX1yI2B/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', NULL, 'Prequelapp', 'Instagram', '2024-05-13', 'Prequelapp', 'Try this app @prequelapp with my sorts, in love 😭♥️. The filter named Air, Click to view on Instagram.', 'Instagram', '<blockquote class=\"instagram-media\" data-instgrm-permalink=\"https://www.instagram.com/p/C64SDX1yI2B/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==\" data-instgrm-version=\"14\" style=\"width:100%;\"></blockquote><script async src=\"//www.instagram.com/embed.js\"></script>'),
(35, 'https://www.instagram.com/p/DABUXD9S-NH/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', '', 'LANA <', 'Instagram', '2024-09-17', 'LANA <', 'Memories in 2k24, the fan meetup in Sep was unexpected! Some great clicks—check them out on Instagram.', 'Instagram', NULL),
(36, 'https://www.instagram.com/p/DFLgXzGT964/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', '', 'Ekbar chuye dekho…🫴🏼', 'Instagram', '2025-01-24', 'Ekbar chuye dekho…🫴🏼', 'Explored Kolkata’s gems—Maidan, The 42, Museum, and Princep Ghat.  \r\n     The city’s charm never fades! ✨ Click to view on Instagram.', 'Instagram', NULL),
(38, 'https://www.instagram.com/p/DFUgCTByc4z/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', '', 'Billie Eilish hoodies', 'Instagram', '2025-01-27', 'Like a fever, I\'m burning alive…🪻.𖥔 ݁˖‧˖', 'Tried the Billie Eilish hoodies from @thebtclub and I\'m amazed by the quality! Highly recommended! Click to view on Instagram', 'Instagram', NULL);

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
(1, 0, '2025-11-30 10:54:58');

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
(1, 'Xodivorce.In', 'Web development', './themes/dark_theme/assets/images/projects/xodivorce_in_project.png', 'https://www.xodivorce.in'),
(2, 'Isdowndetectordown', 'Web development', './themes/dark_theme/assets/images/projects/isdowndetectordown_project.png', 'https://isdowndetectordown.xodivorce.in'),
(3, 'Face Recognigation System', 'Applications', './themes/dark_theme/assets/images/projects/face_recognation_project.png', 'https://github.com/xodivorce/face_recognise_attend'),
(4, 'Anyencrypter Bot', 'Applications', './themes/dark_theme/assets/images/projects/encrypter_project.png', 'https://telegram.me/anyencrypter_bot'),
(5, 'Xeorl - Link Shortener', 'Web development', './themes/dark_theme/assets/images/projects/xeorl_project.png', 'https://xeorl.xodivorce.in'),
(6, 'Zukes - IG', 'Applications', './themes/dark_theme/assets/images/projects/zukes_ig_project.png', 'https://telegram.me/Zukesinsta_bot'),
(7, 'Breakout Ball Game', 'Applications', './themes/dark_theme/assets/images/projects/breakout_game_project.png', 'https://github.com/xodivorce/breakout-game'),
(8, 'Solar Explorer', 'Web development', './themes/dark_theme/assets/images/projects/solar_explorer_project.png', 'https://solar-explorer.xodivorce.in'),
(9, 'Npx - Xodivorce', 'Applications', './themes/dark_theme/assets/images/projects/npx_business_card_project.png', 'https://github.com/xodivorce/npx-xodivorce');

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
(4, 'Mobile App Development (iOS & Android)', '2025', 'Present', 'Learning to build modern iOS applications using Swift and SwiftUI, and modern Android applications using Kotlin and Jetpack Compose - with a strong focus on clean UI design, smooth performance, and intuitive user interactions.');

-- --------------------------------------------------------

--
-- Table structure for table `resume_skills`
--

CREATE TABLE `resume_skills` (
  `id` int(11) NOT NULL,
  `skill_name` varchar(100) NOT NULL,
  `skill_level` int(11) NOT NULL CHECK (`skill_level` between 0 and 100)
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
(1, 'Facebook', 'https://www.facebook.com/xodivorce', 'logo-facebook', 1),
(2, 'Twitter (X)', 'https://x.com/xodivorce1', 'logo-twitter', 2),
(3, 'Instagram', 'https://www.instagram.com/xodivorce', 'logo-instagram', 3),
(4, 'Pinterest', 'https://in.pinterest.com/xodivorc3', 'logo-pinterest', 4),
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
-- Indexes for table `resume_skills`
--
ALTER TABLE `resume_skills`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `resume_skills`
--
ALTER TABLE `resume_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `town_map`
--
ALTER TABLE `town_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `words_by_them`
--
ALTER TABLE `words_by_them`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Official Portfolio Website of <?= ucwords(strtolower($_ENV['AUTHOR'])) ?> - Full-Stack Web Developer - (Also Reknowned as @<?= strtolower($_ENV['DOMAIN']) ?>). | Know More About Him and His Work Experince">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta property="og:title" content="<?= $_ENV['DOMAIN'] ?> - Portfolio | @<?= strtolower($_ENV['DOMAIN']) ?>">
    <meta property="og:description" content="Official Portfolio Website of <?= ucwords(strtolower($_ENV['AUTHOR'])) ?> - Full-Stack Web Developer - (Also Reknowned as @<?= strtolower($_ENV['DOMAIN']) ?>).">
    <meta property="og:image" content="https://<?= strtolower($_ENV['DOMAIN']) ?>.in/themes/dark_theme/assets/images/user/<?= strtolower($_ENV['DOMAIN']) ?>.png">
    <meta property="og:url" content="https://<?= strtolower($_ENV['DOMAIN']) ?>.in/" />
    <meta property="og:type" content="website" />
    <title><?= $_ENV['DOMAIN'] ?> - Portfolio | @<?= strtolower($_ENV['DOMAIN']) ?></title>
    <?php include './themes/dark_theme/assets/_integrate.php'; ?>
</head>

<body>
    <?php include './themes/dark_theme/assets/_preloader.php'; ?>

    <!--
    - #Main
  -->
    <main>

        <!--
      - #Sidebar
    -->
        <aside class="sidebar" data-sidebar>

            <div class="sidebar-info">

                <figure class="avatar-box">
                    <img src="./themes/dark_theme/assets/images/user/<?= strtolower($_ENV['DOMAIN']) ?>.png"
                        alt="<?= strtolower($_ENV['DOMAIN']) ?>" width="88">
                </figure>

                <div class="info-content">
                    <h1 class="name"><?= $_ENV['DOMAIN'] ?></h1>
                    <button onclick="window.location.href='core/pdf_config.php'" class="view-cv-btn">View CV</button>
                </div>

                <button class="info_more-btn" data-sidebar-btn>
                    <span>Show Contacts</span>

                    <ion-icon name="chevron-down"></ion-icon>
                </button>

            </div>

            <div class="sidebar-info_more">

                <div class="separator"></div>

                <ul class="contacts-list">

                    <li class="contact-item">

                        <div class="icon-box">
                            <ion-icon name="mail-outline"></ion-icon>
                        </div>

                        <div class="contact-info">

                            <p class="contact-title">Email</p>

                            <button class="contact-link"
                                onclick="window.location.href='mailto:<?= $_ENV['USER_CUSTOM_MAIL'] ?>'">
                                <?= $_ENV['USER_CUSTOM_MAIL'] ?>
                            </button>

                        </div>

                    </li>

                    <li class="contact-item">

                        <div class="icon-box">
                            <ion-icon name="call-outline"></ion-icon>
                        </div>

                        <div class="contact-info">
                            <p class="contact-title">Phone</p>

                            <?php
                            $rawPhone = $_ENV['USER_PHONE'];
                            $formattedPhone = '';
                            $telHref = '';

                            if (preg_match('/^\+(\d+)\s*(\d{10,12})$/', $rawPhone, $matches)) {
                                $countryCode = '+' . $matches[1];
                                $nationalNumber = $matches[2];

                                $part1 = substr($nationalNumber, 0, 4);
                                $part2 = substr($nationalNumber, 4, 3);
                                $part3 = substr($nationalNumber, 7);

                                $formattedPhone = "$countryCode ($part1) $part2-$part3";
                                $telHref = 'tel:' . preg_replace('/\s+/', '', $rawPhone);
                            }
                            ?>

                            <?php if ($formattedPhone && $telHref): ?>
                                <button class="contact-link"
                                    onclick="window.location.href='<?= $telHref ?>'"><?= $formattedPhone ?></button>
                            <?php else: ?>
                                <button class="contact-link">Invalid PH Format!</button>
                            <?php endif; ?>

                        </div>

                    </li>

                    <li class="contact-item">

                        <div class="icon-box">
                            <ion-icon name="calendar-outline"></ion-icon>
                        </div>

                        <div class="contact-info">
                            <p class="contact-title">Birthday</p>

                            <?php
                            $userBday = DateTime::createFromFormat('d-m-Y', $_ENV['USER_BDAY']);
                            ?>

                            <time datetime="<?= $userBday->format('Y-m-d') ?>">
                                <?= $userBday->format('F j, Y') ?>
                            </time>

                        </div>

                    </li>

                    <li class="contact-item">

                        <div class="icon-box">
                            <ion-icon name="location-outline"></ion-icon>
                        </div>

                        <?php
                        $gmapUrl = $_ENV['USER_GMAP'];
                        $locationName = 'Unknown Location';

                        if (preg_match('/!2s([^!]+)!/', $gmapUrl, $matches)) {
                            $rawLocation = urldecode($matches[1]);

                            $sql = "SELECT town_name, main_city FROM town_map";
                            $result = $conn->query($sql);

                            if ($result && $result->num_rows > 0) {
                                while ($row = $result->fetch_assoc()) {
                                    if (stripos($rawLocation, $row['town_name']) !== false) {
                                        $locationName = $row['main_city'];
                                        break;
                                    }
                                }
                            }

                            if ($locationName === 'Unknown Location') {
                                $locationName = 'Unknown Location!'; #Set Your Location In Db(Town_Map) as "INSERT INTO `town_map` (`town_name`, `main_city`) VALUES ('Your Location', 'Your Nearby Khown Main City, Country');"
                            }
                        }
                        ?>

                        <div class="contact-info">
                            <p class="contact-title">Based On</p>
                            <address><?= htmlspecialchars($locationName) ?></address>
                        </div>


                    </li>

                </ul>

                <div class="separator"></div>

                <?php
                $socials = [];
                $sql = "SELECT * FROM social_links ORDER BY display_order ASC";
                $result = $conn->query($sql);

                if ($result && $result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $socials[] = $row;
                    }
                }
                ?>

                <ul class="social-list">
                    <?php foreach ($socials as $social): ?>
                        <li class="social-item">

                            <button class="social-link"
                                onclick="window.open('<?= htmlspecialchars($social['url']) ?>', '_blank')">

                                <span class="icon-wrapper">
                                    <ion-icon name="<?= htmlspecialchars($social['icon_name']) ?>"></ion-icon>
                                </span>

                            </button>

                        </li>
                    <?php endforeach; ?>
                </ul>

            </div>

        </aside>

        <!--
      - #Main-Content
    -->
        <div class="main-content">

            <section class="about-text hoverAnimatedContainer">

                <!--
        - #Navbar
      -->
                <nav class="navbar">

                    <ul class="navbar-list">

                        <li class="navbar-item">
                            <button class="navbar-link  active" data-nav-link>About</button>
                        </li>

                        <li class="navbar-item">
                            <button class="navbar-link" data-nav-link>Resume</button>
                        </li>

                        <li class="navbar-item">
                            <button class="navbar-link" data-nav-link>Projects</button>
                        </li>

                        <li class="navbar-item">
                            <button class="navbar-link" data-nav-link>Blog</button>
                        </li>

                        <li class="navbar-item">
                            <button class="navbar-link" data-nav-link>Contact</button>
                        </li>

                    </ul>

                </nav>


                <!--
        - #About
      -->
                <article class="about  active" data-page="about">

                    <header>
                        <h2 class="h2 article-title">About</h2>
                    </header>

                    <?php

                    $birthDateString = $_ENV['USER_BDAY'] ?? $_SERVER['USER_BDAY'] ?? null;
                    $experienceStartYear = $_ENV['USER_EXPY'] ?? $_SERVER['USER_EXPY'] ?? null;

                    $birthDate = DateTime::createFromFormat('d-m-Y', $birthDateString);
                    if (!$birthDate) {
                        die("Invalid date format: Expected 'd-m-Y'.");
                    }

                    $today = new DateTime('today');
                    $age = $birthDate->diff($today)->y;

                    $experienceYears = $today->format('Y') - (int) $experienceStartYear;

                    ?>

                    <p>
                        Hey there! I'm <?= ucwords(strtolower($_ENV['AUTHOR'])) ?>,
                        formally khown as @<?=  $_ENV['DOMAIN'] ?> - a <?php echo $age; ?>-year-old tech enthusiast,
                        self-taught Full Stack Web Developer, and the GFG CM at Camellia Institute of Technology (CIT), Kolkata.
                        Delivering modern web apps with AI - entry level to modern frameworks for more than
                        <?php echo $experienceYears; ?>+ years - while mentoring students as a GFG CM.
                    </p>
                    <p>
                        Moreover, I add handcrafted touches on every line - every pixel I've placed. I'm on a mission to
                        make the web more interesting. So, share about me me via node:
                        <span class="npx-cli">$ npx <?= lcfirst($_ENV['DOMAIN']) ?></span>
                        (this requires Node.js installed on your system).
                    </p>

                    <!--
          - #Service
        -->
                    <section class="service">

                        <h3 class="h3 service-title">What I'm Doing</h3>

                        <ul class="service-list">

                            <li class="service-item">

                                <div class="service-icon-box">
                                    <img src="./themes/dark_theme/assets/images/icons/icon-dev.svg" alt="design icon"
                                        width="40">
                                </div>

                                <div class="service-content-box">
                                    <h4 class="h4 service-item-title">Web development</h4>

                                    <p class="service-item-text">
                                        Transforming my concepts into industry grade, high-quality code.
                                    </p>
                                </div>

                            </li>

                            <li class="service-item">

                                <div class="service-icon-box">
                                    <img src="./themes/dark_theme/assets/images/icons/icon-music-and-podcasts.svg"
                                        alt="Music and Podcasts icon" width="40">
                                </div>

                                <div class="service-content-box">
                                    <h4 class="h4 service-item-title">Music And Podcasts</h4>

                                    <p class="service-item-text">
                                        Enjoying music and podcasts that keep me focused and relaxed while I work.
                                    </p>
                                </div>

                            </li>

                            <li class="service-item">

                                <div class="service-icon-box">
                                    <img src="./themes/dark_theme/assets/images/icons/icon-app.svg"
                                        alt="mobile app icon" width="40">
                                </div>

                                <div class="service-content-box">
                                    <h4 class="h4 service-item-title">Android And iOS apps</h4>
                                    <p class="service-item-text">
                                        Building strong concepts while learning Android and iOS app development.
                                    </p>
                                </div>

                            </li>

                            <li class="service-item">

                                <div class="service-icon-box">
                                    <img src="./themes/dark_theme/assets/images/icons/icon-photo.svg" alt="camera icon"
                                        width="40">
                                </div>

                                <div class="service-content-box">
                                    <h4 class="h4 service-item-title">Photography</h4>
                                    <p class="service-item-text">
                                        Capturing photos and videos, exploring creative visuals through my lens.
                                    </p>
                                </div>

                            </li>

                        </ul>

                    </section>

                    <!-- 
        - #Words by them 
        -->
                    <section class="words_by_them">
                        <h3 class="h3 words_by_them-title">Words by Them</h3>

                        <?php
                        $sql = "SELECT * FROM words_by_them ORDER BY date_added DESC";
                        $result = $conn->query($sql);
                        ?>
                        <ul class="words_by_them-list has-scrollbar">
                            <?php while ($row = $result->fetch_assoc()) { ?>
                                <li class="words_by_them-item" data-words_by_them-item
                                    data-name="<?php echo htmlspecialchars($row['name']); ?>"
                                    data-avatar="<?php echo htmlspecialchars($row['avatar']); ?>"
                                    data-message="<?php echo htmlspecialchars($row['message']); ?>"
                                    data-date="<?php echo !empty($row['date_added']) ? htmlspecialchars($row['date_added']) : 'N/A'; ?>">

                                    <div class="content-card" data-model-trigger>
                                        <figure class="words_by_them-avatar-box">
                                            <img src="<?php echo htmlspecialchars($row['avatar']); ?>"
                                                alt="<?php echo htmlspecialchars($row['name']); ?>" width="60"
                                                data-words_by_them-avatar>
                                        </figure>

                                        <h4 class="h4 words_by_them-item-title" data-words_by_them-title>
                                            <?php echo htmlspecialchars($row['name']); ?>
                                        </h4>
                                        <time datetime="<?php echo htmlspecialchars($row['date_added']); ?>">
                                            <?php echo !empty($row['date_added']) ? date("d F, Y", strtotime($row['date_added'])) : "Date not available"; ?>
                                        </time>

                                        <div class="words_by_them-text" data-words_by_them-text>
                                            <p><?php echo htmlspecialchars($row['message']); ?></p>
                                        </div>
                                    </div>
                                </li>
                            <?php } ?>
                        </ul>
                    </section>

                    <!-- 
        - #Words by Them Model 
    -->
                    <div class="model-container" data-model-container>
                        <div class="overlay" data-overlay></div>

                        <section class="words_by_them-model">
                            <button class="model-close-btn" data-model-close-btn>
                                <ion-icon name="close-outline"></ion-icon>
                            </button>

                            <div class="model-img-wrapper">
                                <figure class="model-avatar-box">
                                    <img src="" alt="" width="80" data-model-img>
                                </figure>
                                <img src="./themes/dark_theme/assets/images/icons/icon-quote.svg" alt="quote icon">
                            </div>

                            <div class="model-content">
                                <h4 class="h3 model-title" data-model-title></h4>
                                <time datetime="" data-model-date></time>
                                <div data-model-text></div>
                            </div>
                        </section>
                    </div>

                    <!--
          - #Trusted By
        -->
                    <section class="clients">

                        <h3 class="h3 clients-title">Trusted By</h3>

                        <ul class="clients-list has-scrollbar">

                            <li class="clients-item">
                                <a>
                                    <img src="./themes/dark_theme/assets/images/brands/autosquare.png"
                                        alt="Autosquare logo">
                                </a>
                            </li>

                            <li class="clients-item">
                                <a>
                                    <img src="./themes/dark_theme/assets/images/brands/steamstube.png"
                                        alt="Steamstube logo">
                                </a>
                            </li>

                            <li class="clients-item">
                                <a>
                                    <img src="./themes/dark_theme/assets/images/brands/isdowndetectordown.png"
                                        alt="isdowndetectordown logo">
                                </a>
                            </li>

                        </ul>

                    </section>

                </article>

                <!--
        - #Resume
        -->
                <article class="resume" data-page="resume">

                    <header>
                        <h2 class="h2 article-title">Resume</h2>
                    </header>

                    <section class="timeline">
                        <div class="title-wrapper">
                            <div class="icon-box">
                                <ion-icon name="book-outline"></ion-icon>
                            </div>
                            <h3 class="h3">Education</h3>
                        </div>
                        <?php
                        $sql = "SELECT * FROM resume_education ORDER BY start_year DESC";
                        $result = $conn->query($sql);
                        ?>

                        <ol class="timeline-list">
                            <?php while ($row = $result->fetch_assoc()): ?>
                                <li class="timeline-item">
                                    <h4 class="h4 timeline-item-title">
                                        <?= htmlspecialchars($row['institution']) ?>
                                    </h4>
                                    <span><?= $row['start_year'] . ' — ' . $row['end_year'] ?></span>
                                    <p class="timeline-text">
                                        <?= htmlspecialchars($row['degree']) ?>; <br>
                                        <?= htmlspecialchars($row['description']) ?>
                                    </p>
                                </li>
                            <?php endwhile; ?>
                        </ol>
                    </section>

                    <section class="timeline">
                        <div class="title-wrapper">
                            <div class="icon-box">
                                <ion-icon name="book-outline"></ion-icon>
                            </div>
                            <h3 class="h3">Experience</h3>
                        </div>
                        <?php
                        $sql = "SELECT * FROM resume_experience ORDER BY start_year DESC";
                        $result = $conn->query($sql);
                        ?>

                        <ol class="timeline-list">
                            <?php while ($row = $result->fetch_assoc()): ?>
                                <li class="timeline-item">
                                    <h4 class="h4 timeline-item-title">
                                        <?= htmlspecialchars($row['job_title']) ?>
                                    </h4>
                                    <span><?= $row['start_year'] . ' – ' . htmlspecialchars($row['end_year']) ?></span>
                                    <p class="timeline-text">
                                        <?= htmlspecialchars_decode($row['description']) ?>
                                    </p>
                                </li>
                            <?php endwhile; ?>
                        </ol>
                    </section>

                    <!--
        - #Skills
    -->
                    <section class="skill">
                        <section class="skill">
                            <h3 class="h3 skills-title">My Skills</h3>
                            <?php
                            $sql = "SELECT * FROM resume_skills ORDER BY skill_level DESC";
                            $result = $conn->query($sql);
                            ?>
                            <ul class="skills-list content-card">
                                <?php while ($row = $result->fetch_assoc()): ?>
                                    <li class="skills-item">
                                        <div class="title-wrapper">
                                            <h5 class="h5"><?= htmlspecialchars($row['skill_name']) ?></h5>
                                            <data value="<?= $row['skill_level'] ?>"><?= $row['skill_level'] ?>%</data>
                                        </div>
                                        <div class="skill-progress-bg">
                                            <div class="skill-progress-fill" style="width: <?= $row['skill_level'] ?>%;">
                                            </div>
                                        </div>
                                    </li>
                                <?php endwhile; ?>
                            </ul>
                        </section>
                </article>

                <!--
        - #Projects
      -->
                <article class="projects" data-page="projects">

                    <header>
                        <h2 class="h2 article-title">Projects</h2>
                    </header>

                    <section class="projects">

                        <ul class="filter-list">

                            <li class="filter-item">
                                <button class="active" data-filter-btn>All</button>
                            </li>

                            <li class="filter-item">
                                <button data-filter-btn>Web development</button>
                            </li>

                            <li class="filter-item">
                                <button data-filter-btn>Applications</button>
                            </li>

                        </ul>

                        <div class="filter-select-box">

                            <button class="filter-select" data-select>

                                <div class="select-value" data-selecct-value>Select category</div>

                                <div class="select-icon">
                                    <ion-icon name="chevron-down"></ion-icon>
                                </div>

                            </button>

                            <ul class="select-list">

                                <li class="select-item">
                                    <button data-select-item>All</button>
                                </li>

                                <li class="select-item">
                                    <button data-select-item>Web development</button>
                                </li>

                                <li class="select-item">
                                    <button data-select-item>Applications</button>
                                </li>

                            </ul>

                        </div>

                        <!-- 
                        - #For Isuues, Deploy Comeing-soon

                        <div class="container">
                         <div class="title"><i class="fa-regular fa-clock icon-spin"></i>&nbsp; Coming Soon</div>
                          <div class="subtitle">Please be patient, something interesting is cooking up...!!
                          </div>
                        </div>
                    -->

                        <?php
                        $sql = "SELECT * FROM projects ORDER BY id ASC";
                        $result = $conn->query($sql);
                        ?>

                        <ul class="project-list">
                            <?php while ($row = $result->fetch_assoc()): ?>
                                <li class="project-item active" data-filter-item
                                    data-category="<?= strtolower($row['project_category']) ?>">
                                    <a href="<?= htmlspecialchars($row['project_link']) ?> " target="_blank"
                                        rel="noopener noreferrer" style="display:block;">
                                        <figure class="project-img">
                                            <div class="project-item-icon-box">
                                                <ion-icon name="eye-outline"></ion-icon>
                                            </div>
                                            <img src="<?= htmlspecialchars($row['project_image']) ?>"
                                                alt="<?= htmlspecialchars($row['project_name']) ?>" loading="lazy">
                                        </figure>
                                        <h3 class="project-title"><?= htmlspecialchars($row['project_name']) ?></h3>
                                        <p class="project-category"><?= htmlspecialchars($row['project_category']) ?></p>
                                    </a>
                                </li>
                            <?php endwhile; ?>

                        </ul>

                    </section>

                </article>


                <!--
        - #Blog
      -->

                <!-- 
        - #For Isuues, Deploy Comeing-soon
          
        <div class="container">
          <div class="title"><i class="fa-regular fa-clock icon-spin"></i>&nbsp; Coming Soon</div>
          <div class="subtitle">Please be patient, something interesting is cooking up...!!
          </div>
        </div>
    -->

                <article class="blog" data-page="blog">

                    <header>
                        <h2 class="h2 article-title">Blog</h2>
                    </header>

                    <section class="blog-posts">

                        <?php
                        $sql = "SELECT * FROM blog_posts 
                         ORDER BY FIELD(platform, 'Other', 'YouTube', 'Instagram', 'Facebook', 'Pinterest'), post_date DESC";
                        $result = $conn->query($sql);
                        ?>

                        <ul class="blog-posts-list">

                            <?php while ($row = $result->fetch_assoc()): ?>

                                <li class="blog-post-item">

                                    <a href="<?= htmlspecialchars($row['post_link']) ?>" target="_blank"
                                        rel="noopener noreferrer" style="display:block;">

                                        <figure class="blog-banner-box">

                                            <!-- 
                                            - #Instagram Embed
                                        -->
                                            <?php if ($row['platform'] == 'Instagram'): ?>

                                                <blockquote class="instagram-media"
                                                    data-instgrm-permalink="<?= htmlspecialchars($row['post_link']) ?>"
                                                    data-instgrm-version="14" style="width:100%;">
                                                </blockquote>
                                                <script async src="//www.instagram.com/embed.js"></script>

                                                <!-- 
                                            - #Facebook Embed 
                                        -->
                                            <?php elseif ($row['platform'] == 'Facebook' && !empty($row['post_iframe'])): ?>

                                                <iframe src="<?= htmlspecialchars($row['post_iframe']) ?>" width="100%"
                                                    height="365" style="border:none;overflow:hidden;" scrolling="no"
                                                    frameborder="0" allowfullscreen="true">
                                                </iframe>

                                                <!-- 
                                            - #Pinterest Embed 
                                        -->
                                            <?php elseif ($row['platform'] == 'Pinterest' && !empty($row['post_iframe'])): ?>

                                                <iframe src="<?= htmlspecialchars($row['post_iframe']) ?>" height="365"
                                                    width="100%" frameborder="0" scrolling="no"></iframe>

                                                <!-- 
                                            Default Image (YouTube, Other) 
                                        -->
                                            <?php else: ?>

                                                <img src="<?= htmlspecialchars($row['post_image']) ?>"
                                                    alt="<?= htmlspecialchars($row['post_image_alt']) ?>" loading="lazy">

                                            <?php endif; ?>

                                        </figure>

                                        <div class="blog-content">
                                            <div class="blog-meta">

                                                <p class="blog-category"><?= htmlspecialchars($row['post_category']) ?></p>

                                                <span class="dot"></span>

                                                <time datetime="<?= $row['post_date'] ?>">
                                                    <?= date("M d, Y", strtotime($row['post_date'])) ?>
                                                </time>

                                            </div>

                                            <h3 class="h3 blog-item-title"><?= htmlspecialchars($row['post_title']) ?></h3>
                                            <p class="blog-text"><?= htmlspecialchars_decode($row['post_text']) ?></p>

                                        </div>

                                    </a>

                                </li>

                            <?php endwhile; ?>

                        </ul>

                        <!--
                - #Temp For META Not Resolved Iframe
            -->

                        <!-- 
                        <div id="mobile-notification" class="notification">
                            <span class="close-btn" onclick="closeNotification()">&#10005;</span>

                            <p><span class="highlight-text">Apologies</span>, some blogs are unreachable due to
                                <span class="highlight-text">x-iframe</span><br> not being resolved by <span
                                    class="highlight-text">meta</span>. For the best experience,<br> switch to the
                                <span class="highlight-text">desktop mode</span>. Thanks for your understanding.
                            </p>
                        </div> 
                    -->

                        </ul>

                    </section>

                </article>

                <!--
        - #Contact
      -->
                <article class="contact" data-page="contact">
                    <header>
                        <h2 class="h2 article-title">Contact</h2>
                    </header>

                    <section class="mapbox" data-mapbox>
                        <figure>
                            <iframe src="<?= $_ENV['USER_GMAP']; ?>" width="400" height="300" loading="lazy">
                            </iframe>
                        </figure>
                    </section>

                    <section class="contact-form">

                        <h3 class="h3 form-title">Contact Form</h3>
                        <form id="contact-form" class="form" data-form>

                            <div class="input-wrapper">
                                <input type="text" name="fullname" class="form-input" placeholder="Your Full Name"
                                    required data-form-input>
                                <input type="email" name="email" class="form-input" placeholder="Your Email address"
                                    required data-form-input>
                            </div>

                            <textarea name="message" class="form-input" placeholder="Your Message" required
                                data-form-input></textarea>

                            <!-- 
                            - #Status Message 
                        -->
                            <div class="status-message">
                                <p id="form-status" style="display: none;"></p>
                            </div>

                            <button id="form-btn" class="form-btn" type="submit">
                                <ion-icon name="paper-plane"></ion-icon>
                                <span>Send Message</span>
                            </button>

                        </form>

                    </section>
                </article>

        </div>

    </main>

    <!--
    - #Custom js link
  -->
    <script src="./themes/dark_theme/assets/js/home.js"></script>
    <script src="./themes/dark_theme/assets/js/preloader_config.js"></script>
    <script src="./themes/dark_theme/assets/js/meta_config.js"></script>
    <script src="./themes/dark_theme/assets/js/mail_config.js"></script>
    <script src="./themes/dark_theme/assets/js/developer_config.js"></script>
    <!--
    - #Ionicon link
  -->
    <script type="module" src="https://cdn.jsdelivr.net/npm/ionicons@latest/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>
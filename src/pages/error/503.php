<?php

http_response_code(503);

require_once __DIR__ . './../../core/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../..');
$dotenv->Load();

$author = htmlspecialchars($_ENV['AUTHOR'], ENT_QUOTES, 'UTF-8');
$domain = htmlspecialchars($_ENV['DOMAIN'], ENT_QUOTES, 'UTF-8');

?>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>Service Paused - @<?= strtolower($domain) ?></title>

  <link rel="icon" type="image/png" href="./../../themes/dark_theme/assets/favicon/favicon-96x96.png" sizes="96x96">
  <link rel="icon" type="image/svg+xml" href="./../themes/dark_theme/assets/favicon/favicon.svg">
  <link rel="shortcut icon" href="./../themes/dark_theme/assets/favicon/favicon.ico">
  <link rel="apple-touch-icon" sizes="180x180" href="./../../themes/dark_theme/assets/favicon/apple-touch-icon.png">
  <link rel="manifest" href="./../../themes/dark_theme/assets/favicon/site.webmanifest">
  
  <link rel="stylesheet" href="./../../themes/dark_theme/assets/css/error_config.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@300;400;600;700&display=swap" rel="stylesheet">
</head>

<body class="body-font">
  <main>
    <div>
      <div><span>503 error</span><span>service paused</span></div>
      <svg viewBox="0 0 200 600">
        <polygon
          points="118.302698 8 59.5369448 66.7657528 186.487016 193.715824 14 366.202839 153.491505 505.694344 68.1413353 591.044514 200 591.044514 200 8">
        </polygon>
      </svg>
    </div>
    <svg class="crack" viewBox="0 0 200 600">
      <polyline
        points="118.302698 8 59.5369448 66.7657528 186.487016 193.715824 14 366.202839 153.491505 505.694344 68.1413353 591.044514">
      </polyline>
    </svg>
    <div>
      <svg viewBox="0 0 200 600">
        <polygon
          points="118.302698 8 59.5369448 66.7657528 186.487016 193.715824 14 366.202839 153.491505 505.694344 68.1413353 591.044514 0 591.044514 0 8">
        </polygon>
      </svg>
      <div><span>we’ll&nbsp;return&nbsp;shortly!</span>
        <span>
          <button class="return-btn" onclick="window.location.href='../../'">
            try again?
          </button>
        </span>
      </div>
  </main>
</body>

</html>
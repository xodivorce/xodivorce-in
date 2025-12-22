<link rel="icon" type="image/png" href="./themes/dark_theme/assets/favicon/favicon-96x96.png" sizes="96x96" />
<link rel="icon" type="image/svg+xml" href="./themes/dark_theme/assets/favicon/favicon.svg" />
<link rel="shortcut icon" href="./themes/dark_theme/assets/favicon/favicon.ico" />
<link rel="apple-touch-icon" sizes="180x180" href="./themes/dark_theme/assets/favicon/apple-touch-icon.png" />
<link rel="manifest" href="./themes/dark_theme/assets/favicon/site.webmanifest" />
<link rel="stylesheet" href="./themes/dark_theme/assets/css/home.css">
<link rel="stylesheet" href="./themes/dark_theme/assets/css/exeption.css">
<link rel="stylesheet" href="./themes/dark_theme/assets/css/meta_config.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@100..900&display=swap" rel="stylesheet">

<?php
$domainVerifyContent = $_ENV['PINTEREST_CONTENT_SECRET'];
?>
<meta name="p:domain_verify" content="<?= htmlspecialchars($domainVerifyContent) ?>" />
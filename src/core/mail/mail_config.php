<?php

require_once __DIR__ . '/../vendor/autoload.php';

use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__ . '/../../');
$dotenv->load();

$isBackup = filter_var($_ENV['IS_BACKUP'] ?? false, FILTER_VALIDATE_BOOLEAN);

$mailFile = $isBackup
    ? __DIR__ . '/formats/backup_smtp.php'
    : __DIR__ . '/formats/primary_smtp.php';

if (!file_exists($mailFile)) {
    echo "<span>The mail handler files are missing.</span>";
    exit;
}

require $mailFile;

?>
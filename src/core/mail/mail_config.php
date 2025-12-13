<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once __DIR__ . '/../vendor/autoload.php';

use Throwable;
use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__ . '/../../');
$dotenv->load();

try {
    require __DIR__ . '/formats/custom_mail.php';
} catch (Throwable $primaryErr) {
    $msg = (string) $primaryErr->getMessage();
    $lc = strtolower($msg);

    $isSmtpAuth = strpos($lc, 'authenticate') !== false
        || strpos($lc, 'authentication') !== false
        || strpos($lc, 'could not authenticate') !== false
        || strpos($lc, 'smtp error') !== false
        || strpos($lc, 'smtp') !== false;

    if ($isSmtpAuth) {
        try {
            require __DIR__ . '/formats/google_mail.php';
        } catch (Throwable $fallbackErr) {
            $err = htmlentities($fallbackErr->getMessage(), ENT_QUOTES, 'UTF-8');
            echo "<span><ion-icon name='bug-outline'></ion-icon> Both mail systems failed:<br><br>{$err}</span>";
        }
    } else {
        $err = htmlentities($msg, ENT_QUOTES, 'UTF-8');
        echo "<span><ion-icon name='bug-outline'></ion-icon> Mail system error:<br><br>{$err}</span>";
    }
}

<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once __DIR__ . '/vendor/autoload.php';

use Dotenv\Dotenv;
$dotenv = Dotenv::createImmutable(__DIR__ . '/../');
$dotenv->load();

$file = __DIR__ . '/../themes/dark_theme/assets/pdf/' . $_ENV['DOMAIN'] . '-Curriculum-Vitae.pdf';

if (!file_exists($file)) {
    http_response_code(404);
    echo 'File not found.';
    exit;
}

header('Content-Type: application/pdf');
header('Content-Disposition: inline; filename="' . $_ENV['DOMAIN'] . '-Curriculum-Vitae.pdf"');
header('Content-Length: ' . filesize($file));
header('Accept-Ranges: bytes');
header('Cache-Control: public, must-revalidate, max-age=0');
header('Pragma: public');
header('Access-Control-Allow-Origin: *');

readfile($file);
exit;

?>
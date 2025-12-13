<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

require __DIR__ . '/connection.php';

$host = $_SERVER['HTTP_HOST'];

$sql = "SELECT is_active FROM maintenance ORDER BY updated_at DESC LIMIT 1";
$result = $conn->query($sql);

if (!$result) {
    die("Error executing query: " . $conn->error);
}

if ($result->num_rows > 0) {

    $row = $result->fetch_assoc();
    $is_active = $row['is_active'];

    if ($is_active) {

        http_response_code(503);

        if ($host === 'localhost') {
            header('Location: /Php-devs/xodivorce-in/src/pages/error/503.php');
            exit;
        }

        header('Location: /../pages/error/503.php');
        exit;
    }

    include __DIR__ . '/../pages/home.php';
    exit;
}

die("No records found in the maintenance table.");

?>

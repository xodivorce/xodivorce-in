<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

error_reporting(E_ALL);
ini_set('display_errors', 1);

if (!function_exists('env')) {
    function env(string $k, $d = null)
    {
        return $_ENV[$k] ?? $d;
    }
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo "<span><ion-icon name='close-circle-outline'></ion-icon> Method not allowed.</span>";
    exit;
}

$fullname = filter_var($_POST['fullname'] ?? '', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$email = filter_var($_POST['email'] ?? '', FILTER_SANITIZE_EMAIL);
$message = filter_var($_POST['message'] ?? '', FILTER_SANITIZE_FULL_SPECIAL_CHARS);

if (empty($fullname) || empty($email) || empty($message)) {
    echo "<span><ion-icon name='close-circle-outline'></ion-icon> Please fill all required fields.</span>";
    exit;
}

$filteredEmails = array_map('trim', explode(',', env('FILTER_EMAILS', '')));
if (!empty($filteredEmails) && in_array(strtolower($email), array_map('strtolower', $filteredEmails))) {
    echo "<span><ion-icon name='mail-open-outline'></ion-icon> Yep, that's my email; use a valid email instead.</span>";
    exit;
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo "<span><ion-icon name='mail-open-outline'></ion-icon> Invalid email address! Please check and try again.</span>";
    exit;
}

$smtpHost = env('SMTP_HOST_BACKUP');
$smtpPort = env('SMTP_PORT');
$smtpUser = env('SMTP_USER_BACKUP');
$smtpPass = env('SMTP_PASS_BACKUP');

$useSMTP = true;
if (empty($smtpUser) || empty($smtpPass)) {
    $useSMTP = false;
}

$mail = new PHPMailer(true);
try {

    $domain = env('DOMAIN');
    $domainLower = strtolower($domain);
    $projectStartYear = env('PROJECT_START_YEAR');
    $company = env('COMPANY');
    $author = env('AUTHOR');
    $authorFirst = ucfirst(strtolower(explode(' ', trim($author))[0]));

    $currentYear = (int) date('Y');
    $startYear = (int) $projectStartYear;
    if ($startYear <= 0) {
        $startYear = $currentYear;
    }
    $yearText = ($currentYear > $startYear)
        ? "$startYear-" . substr((string) $currentYear, -2)
        : (string) $startYear;

    if ($useSMTP) {
        $mail->isSMTP();
        $mail->Host = $smtpHost;
        $mail->SMTPAuth = true;
        $mail->Username = $smtpUser;
        $mail->Password = $smtpPass;
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = $smtpPort;
    }
    $mail->CharSet = 'UTF-8';

    $fromName = env('DOMAIN');
    $fromAddress = $smtpUser ?: ('no-reply@' . $domainLower);

    $mail->setFrom($fromAddress, $fromName);
    $mail->addAddress(env('SMTP_SENDTO', $smtpUser ?: $fromAddress));
    $mail->addReplyTo($email, $fullname);

    $mail->isHTML(true);
    $mail->Subject = "{$domain} - New contact form submission received";

    $escFullname = htmlentities($fullname, ENT_QUOTES, 'UTF-8');
    $escEmail = htmlentities($email, ENT_QUOTES, 'UTF-8');
    $escMessage = nl2br(htmlentities($message, ENT_QUOTES, 'UTF-8'));

    $mail->Body = <<<HTML
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link href="https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@300;400;600;700&display=swap" rel="stylesheet" />
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@300;400;600;700&display=swap');
        .body-font { font-family: 'Lexend Deca', -apple-system !important; }
        .heading-font { font-family: 'Lexend Deca', -apple-system !important; font-weight: 600; }
        a { color: #1d4ed8; }
    </style>
</head>
<body class="body-font" style="margin:0;padding:0;background-color:#ffffff;color:#0f172a;font-family:'Lexend Deca', -apple-system;">
    <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="background:#ffffff;padding:24px 12px;font-family:'Lexend Deca', -apple-system;">
        <tr>
            <td align="center">
                <table role="presentation" cellpadding="0" cellspacing="0" width="640" style="max-width:640px;width:100%;border-collapse:collapse;text-align:left;font-family:'Lexend Deca', -apple-system;">
                    <tr>
                        <td style="padding-top:28px;padding-bottom:8px;text-align:center;">
                            <h1 class="heading-font" style="font-size:28px;line-height:34px;margin:0;font-weight:600;color:#0f172a;text-align:center;font-family:'Lexend Deca', -apple-system;">
                                 New Contact Form Submission Received
                            </h1>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding:18px 16px 8px 16px;background:#ffffff;font-family:'Lexend Deca', -apple-system;">
                            <p style="font-size:16px;line-height:22px;color:#475569;margin:0 0 16px 0;font-family:'Lexend Deca', -apple-system;">
                                Hi <strong style="color:#0f172a;">{$authorFirst}</strong>,
                            </p>
                            <p style="font-size:16px;line-height:22px;color:#475569;margin:0 0 16px 0;font-family:'Lexend Deca', -apple-system;">
                                Your domain <strong style="color:#0f172a;">{$domainLower}.in</strong> has received a contact form submission and our auto-email has sent a " <strong style="color:#0f172a;">Thanks For Reaching Out</strong> " template to our client.
                            </p>
                            <p style="font-size:16px;line-height:22px;color:#475569;margin:0 0 16px 0;font-family:'Lexend Deca', -apple-system;">
                                The submission details are as follows:
                            </p>
                            <div style="height:1px;background:#e6e9ef;margin:20px 0;"></div>
                            <p style="font-size:16px;line-height:22px;color:#475569;margin:0 0 16px 0;font-family:'Lexend Deca', -apple-system;">
                                Clients' full name: <span style="color:#0f172a;font-family:'Lexend Deca', -apple-system;">{$escFullname}</span><br>
                                Clients' email address:
                                <a href="mailto:{$escEmail}" style="color:#0f172a;font-family:'Lexend Deca', -apple-system;">{$escEmail}</a><br>
                                Clients' message: <span style="color:#0f172a;font-family:'Lexend Deca', -apple-system;">{$escMessage}</span>
                            </p>
                            <div style="height:1px;background:#e6e9ef;margin:20px 0;"></div>
                            <p style="font-size:14px;line-height:20px;color:#6b7280;margin:0 0 12px 0;font-family:'Lexend Deca', -apple-system;">
                                This is an auto-generated email system for contact form submissions. If this email successfully reached you, review the details above and respond to the client ASAP.
                            </p>
                            <p style="font-size:16px;line-height:18px;color:#475569;margin:18px 0 0 0;font-family:'Lexend Deca', -apple-system;">
                                Sincerely,
                            </p>
                            <p style="font-size:16px;line-height:18px;color:#0f172a;font-weight:600;margin:6px 0 0 0;font-family:'Lexend Deca', -apple-system;">
                                {$domain} Support
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding:14px 12px 28px 12px;font-family:'Lexend Deca', -apple-system;">
                            <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="background:#f8fafc;padding:12px;border-radius:6px;font-family:'Lexend Deca', -apple-system;">
                                <tr>
                                    <td style="text-align:center;font-size:12px;color:#6b7280;line-height:20px;font-family:'Lexend Deca', -apple-system;">
                                        <div style="margin-bottom:4px;font-family:'Lexend Deca', -apple-system;">
                                            <a href="https://www.{$domainLower}.in" style="color:inherit;text-decoration:none;font-family:'Lexend Deca', -apple-system;">{$domain}</a> |
                                            <a href="https://{$domainLower}.in/support" style="color:inherit;text-decoration:none;font-family:'Lexend Deca', -apple-system;">Support</a> |
                                            <a href="https://{$domainLower}.in/privacy-policy" style="color:inherit;text-decoration:none;font-family:'Lexend Deca', -apple-system;">Privacy Policy</a>
                                        </div>
                                        <div style="font-size:12px;color:#475569;font-family:'Lexend Deca', -apple-system;">
                                            &copy; {$yearText} {$domain}. All rights reserved.
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
HTML;

    $mail->AltBody = "New contact form submission from {$fullname} ({$email}). Message: " . strip_tags($message);

    if ($useSMTP) {
        $mail->send();
        echo "<span><ion-icon name='checkmark-circle-outline'></ion-icon> Thanks! Your message sent successfully.</span>";
    } else {
        $to = env('SMTP_SENDTO', $smtpUser ?: $fromAddress);
        $subject = $mail->Subject;
        $html = $mail->Body;
        $headers = "MIME-Version: 1.0\r\n";
        $headers .= "Content-type: text/html; charset=UTF-8\r\n";
        $headers .= "From: {$fromName} <{$fromAddress}>\r\n";
        $headers .= "Reply-To: {$escEmail}\r\n";
        if (mail($to, $subject, $html, $headers)) {
            echo "<span><ion-icon name='checkmark-circle-outline'></ion-icon> Thanks! Your message sent successfully (mail fallback).</span>";
        } else {
            echo "<span><ion-icon name='close-circle-outline'></ion-icon> Error sending message with PHP mail().</span>";
        }
    }

    try {
        $autoReply = new PHPMailer(true);
        if ($useSMTP) {
            $autoReply->isSMTP();
            $autoReply->Host = $smtpHost;
            $autoReply->SMTPAuth = true;
            $autoReply->Username = $smtpUser;
            $autoReply->Password = $smtpPass;
            $autoReply->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            $autoReply->Port = $smtpPort;
        }
        $autoReply->CharSet = 'UTF-8';

        $autoReply->setFrom($fromAddress, $fromName);
        $autoReply->addAddress($email, $fullname);
        $autoReply->addReplyTo(env('SMTP_SENDTO', $fromAddress), $fromName);

        $autoReply->isHTML(true);
        $autoReply->Subject = "{$domain} - We've received your message!";

        $firstName = htmlentities(explode(' ', trim($fullname))[0] ?? $fullname, ENT_QUOTES, 'UTF-8');

        $autoReply->Body = <<<HTML
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link href="https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@300;400;600;700&display=swap" rel="stylesheet" />
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@300;400;600;700&display=swap');
        .body-font { font-family: 'Lexend Deca', -apple-system !important; }
        .heading-font { font-family: 'Lexend Deca', -apple-system !important; font-weight: 600; }
        a { color: #1d4ed8; }
    </style>
</head>
<body class="body-font" style="margin:0;padding:0;background-color:#ffffff;color:#0f172a;font-family:'Lexend Deca', -apple-system;">
    <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="background:#ffffff;padding:24px 12px;font-family:'Lexend Deca', -apple-system;">
        <tr>
            <td align="center">
                <table role="presentation" cellpadding="0" cellspacing="0" width="640" style="max-width:640px;width:100%;border-collapse:collapse;text-align:left;font-family:'Lexend Deca', -apple-system;">
                    <tr>
                        <td style="padding-top:28px;padding-bottom:8px;text-align:center;">
                            <h1 class="heading-font" style="font-size:28px;line-height:34px;margin:0;font-weight:600;color:#0f172a;text-align:center;font-family:'Lexend Deca', -apple-system;">
                                 Thanks For Reaching Out
                            </h1>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding:18px 16px 8px 16px;background:#ffffff;font-family:'Lexend Deca', -apple-system;">
                            <p style="font-size:16px;line-height:22px;color:#475569;margin:0 0 16px 0;font-family:'Lexend Deca', -apple-system;">
                                Hi <strong style="color:#0f172a;">{$firstName}</strong>,
                            </p>
                            <p style="font-size:16px;line-height:22px;color:#475569;margin:0 0 16px 0;font-family:'Lexend Deca', -apple-system;">
                                <strong style="color:#0f172a;">{$domain}</strong> has received the query and will review the details you’ve shared.
                                I'm pleased to thank you for spending your valuable time with <strong style="color:#0f172a;">{$domainLower}.in</strong>.
                            </p>
                            <p style="font-size:16px;line-height:22px;color:#475569;margin:0 0 16px 0;font-family:'Lexend Deca', -apple-system;">
                                Once I’ve reviewed your message, I’ll let you know if I can ful-fill the request and will get back to you ASAP.
                            </p>
                            <div style="height:1px;background:#e6e9ef;margin:20px 0;"></div>
                            <p style="font-size:16px;line-height:22px;color:#475569;margin:0 0 16px 0;font-family:'Lexend Deca', -apple-system;">
                                This query was received by the email address:
                                <a href="mailto:{$email}" style="color:#0f172a;font-family:'Lexend Deca', -apple-system;">{$email}</a>
                            </p>
                            <div style="height:1px;background:#e6e9ef;margin:20px 0;"></div>
                            <p style="font-size:14px;line-height:20px;color:#6b7280;margin:0 0 12px 0;font-family:'Lexend Deca', -apple-system;">
                                This is an auto-generated email system for contact form submissions.
                                If you did not make this query, or believe we contacted the wrong person, kindly ignore this email.
                                However, if you have any new queries, requests, or wish to contribute, just feel free to reach out to us at this email address.
                            <p style="font-size:16px;line-height:18px;color:#475569;margin:18px 0 0 0;font-family:'Lexend Deca', -apple-system;">
                                Sincerely,
                            </p>
                            <p style="font-size:16px;line-height:18px;color:#0f172a;font-weight:600;margin:6px 0 0 0;font-family:'Lexend Deca', -apple-system;">
                                {$domain} Support
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding:14px 12px 28px 12px;font-family:'Lexend Deca', -apple-system;">
                            <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="background:#f8fafc;padding:12px;border-radius:6px;font-family:'Lexend Deca', -apple-system;">
                                <tr>
                                    <td style="text-align:center;font-size:12px;color:#6b7280;line-height:20px;font-family:'Lexend Deca', -apple-system;">
                                        <div style="margin-bottom:4px;font-family:'Lexend Deca', -apple-system;">
                                            <a href="https://{$domainLower}.in" style="color:inherit;text-decoration:none;font-family:'Lexend Deca', -apple-system;">{$domain}</a> |
                                            <a href="https://{$domainLower}.in/support" style="color:inherit;text-decoration:none;font-family:'Lexend Deca', -apple-system;">Support</a> |
                                            <a href="https://{$domainLower}.in/privacy-policy" style="color:inherit;text-decoration:none;font-family:'Lexend Deca', -apple-system;">Privacy Policy</a>
                                        </div>
                                        <div style="font-size:12px;color:#475569;font-family:'Lexend Deca', -apple-system;">
                                            &copy; {$yearText} {$domain}. All rights reserved.
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
HTML;

        $autoReply->AltBody = "Thanks for reaching out. We'll review your message and get back to you soon.";

        if ($useSMTP) {
            $autoReply->send();
        } else {
            $to = $escEmail;
            $subject = $autoReply->Subject;
            $html = $autoReply->Body;
            $headers = "MIME-Version: 1.0\r\n";
            $headers .= "Content-type: text/html; charset=UTF-8\r\n";
            $headers .= "From: {$fromName} <{$fromAddress}>\r\n";
            $headers .= "Reply-To: " . env('SMTP_SENDTO', $fromAddress) . "\r\n";
            $mailResult = mail($to, $subject, $html, $headers);
            if (!$mailResult) {
                echo "<span><ion-icon name='bug-outline'></ion-icon> Auto-reply failed using PHP mail().</span>";
            }
        }
    } catch (Exception $e) {
        $autoErr = htmlentities($e->getMessage(), ENT_QUOTES, 'UTF-8');
        echo "<span><ion-icon name='bug-outline'></ion-icon> Auto-reply error occurred: <br><br> {$autoErr}</span>";
    }
} catch (Exception $e) {
    $err = htmlentities($mail->ErrorInfo ?? $e->getMessage(), ENT_QUOTES, 'UTF-8');
    echo "<span><ion-icon name='bug-outline'></ion-icon> Mailer error occurred: <br><br> {$err}</span>";
}

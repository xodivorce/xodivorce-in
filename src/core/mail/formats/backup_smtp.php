<?php

require __DIR__ . '/../../vendor/autoload.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__ . '/../../../');
$dotenv->load();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    exit;
}

$fullname = trim($_POST['fullname'] ?? '');
$email = trim($_POST['email'] ?? '');
$message = trim($_POST['message'] ?? '');

if ($fullname === '' || $email === '' || $message === '') {
    echo "<span><ion-icon name='alert-outline'></ion-icon> Fill all the required fields.</span>";
    exit;
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo "<span><ion-icon name='alert-outline'></ion-icon> The email address is invalid.</span>";
    exit;
}

$escFullname = htmlspecialchars($fullname, ENT_QUOTES, 'UTF-8');
$escEmail = htmlspecialchars($email, ENT_QUOTES, 'UTF-8');
$escMessage = nl2br(htmlspecialchars($message, ENT_QUOTES, 'UTF-8'));

$domain = $_ENV['DOMAIN'];
$domainLower = strtolower($domain);
$author = $_ENV['AUTHOR'];
$authorFirst = ucfirst(strtolower(explode(' ', trim($author))[0]));

$projectStartYear = (int) ($_ENV['PROJECT_START_YEAR'] ?? date('Y'));
$currentYear = (int) date('Y');
$yearText = ($currentYear > $projectStartYear)
    ? $projectStartYear . '-' . substr((string) $currentYear, -2)
    : (string) $projectStartYear;

$mail = new PHPMailer(true);

try {
    $mail->isSMTP();
    $mail->Host = $_ENV['SMTP_HOST_BACKUP'];
    $mail->SMTPAuth = true;
    $mail->Username = $_ENV['SMTP_USER_BACKUP'];
    $mail->Password = $_ENV['SMTP_PASS_BACKUP'];
    $mail->Port = (int) $_ENV['SMTP_PORT'];
    $mail->SMTPSecure = ($mail->Port === 465)
        ? PHPMailer::ENCRYPTION_SMTPS
        : PHPMailer::ENCRYPTION_STARTTLS;

    $mail->CharSet = 'UTF-8';

    $mail->setFrom($_ENV['SMTP_USER_BACKUP'], "{$domain}");
    $mail->addAddress($_ENV['SMTP_SENDTO']);
    $mail->addReplyTo($email, preg_replace('/[^a-zA-Z\s]/', '', $fullname));

    $mail->isHTML(true);
    $mail->Subject = "{$domain} - New contact form submission received";

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

    $mail->send();

    $autoReply = new PHPMailer(true);

    $autoReply->isSMTP();
    $autoReply->Host = $_ENV['SMTP_HOST_BACKUP'];
    $autoReply->SMTPAuth = true;
    $autoReply->Username = $_ENV['SMTP_USER_BACKUP'];
    $autoReply->Password = $_ENV['SMTP_PASS_BACKUP'];
    $autoReply->Port = (int) $_ENV['SMTP_PORT'];
    $autoReply->SMTPSecure = ($autoReply->Port === 465)
        ? PHPMailer::ENCRYPTION_SMTPS
        : PHPMailer::ENCRYPTION_STARTTLS;

    $autoReply->CharSet = 'UTF-8';

    $autoReply->setFrom($_ENV['SMTP_USER_BACKUP'], "{$domain}");
    $autoReply->addAddress($email, $fullname);

    $firstName = explode(' ', $fullname)[0];

    $autoReply->isHTML(true);
    $autoReply->Subject = "{$domain} - We've received your message";

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
    $autoReply->send();

    echo "<span><ion-icon name='mail-outline'></ion-icon> Your message was sent successfully.</span>";

} catch (Exception $e) {
    echo "<span><ion-icon name='bug-outline'></ion-icon> Mailer Error: <br><br> {$mail->ErrorInfo}</span>";
}

?>
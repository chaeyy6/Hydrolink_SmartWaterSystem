<?php
session_start();
require_once 'db_connect.php';

if (isset($_SESSION['UserID']) && $_SESSION['Role'] === 'Admin') {
    $adminID = $_SESSION['UserID'];
    $ip = $_SERVER['REMOTE_ADDR'] ?? 'UNKNOWN';
    if ($ip === '::1') $ip = '127.0.0.1'; // normalize localhost
    $userAgent = $_SERVER['HTTP_USER_AGENT'] ?? 'UNKNOWN';

    // ✅ Insert into audit trail
    $stmtAudit = $conn->prepare("
        INSERT INTO audit_logs (AdminID, Action, Details, IPAddress, UserAgent, CreatedAt)
        VALUES (?, 'Logout', 'Administrator logged out', ?, ?, NOW())
    ");
    $stmtAudit->bind_param("iss", $adminID, $ip, $userAgent);
    $stmtAudit->execute();
    $stmtAudit->close();
}

session_unset();
session_destroy();

header("Location: index.php");
exit;
?>

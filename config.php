<?php
declare(strict_types=1);
session_start();

const DB_HOST = '127.0.0.1';
const DB_NAME = 'earns_electronics';
const DB_USER = 'root';
const DB_PASS = '';

const STORE_NAME = 'Earns Electronics & Mobile Store';
const CURRENCY = 'KES';

const MPESA_ENV = 'sandbox'; // change to production after testing
const MPESA_CONSUMER_KEY = '';
const MPESA_CONSUMER_SECRET = '';
const MPESA_SHORTCODE = '';
const MPESA_PASSKEY = '';
const MPESA_CALLBACK_URL = '';

function db(): PDO {
    static $pdo = null;
    if ($pdo === null) {
        $pdo = new PDO(
            'mysql:host='.DB_HOST.';dbname='.DB_NAME.';charset=utf8mb4',
            DB_USER, DB_PASS,
            [PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC]
        );
    }
    return $pdo;
}
function e(?string $v): string { return htmlspecialchars($v ?? '', ENT_QUOTES, 'UTF-8'); }
function json_response(array $data, int $status=200): never {
    http_response_code($status); header('Content-Type: application/json'); echo json_encode($data); exit;
}
function require_admin(): void {
    if (empty($_SESSION['admin_id'])) json_response(['error'=>'Unauthorized'],401);
}
function require_customer(): void {
    if (empty($_SESSION['customer_id'])) json_response(['error'=>'Login required'],401);
}
function csrf(): string {
    if (empty($_SESSION['csrf'])) $_SESSION['csrf']=bin2hex(random_bytes(24));
    return $_SESSION['csrf'];
}
function check_csrf(): void {
    if (!hash_equals($_SESSION['csrf'] ?? '', $_POST['csrf'] ?? '')) json_response(['error'=>'Invalid request token'],419);
}
function money(float $n): string { return 'KES '.number_format($n,2); }

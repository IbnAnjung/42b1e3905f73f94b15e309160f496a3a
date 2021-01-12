<?php
require_once __DIR__ . '/../vendor/autoload.php';

use App\Controllers\RequestController;
use App\Controllers\MailController;
use App\Models\Connection;
print_r(getenv('DB_USER'));

$c = new MailController;

echo json_encode($c->sendMail(), true);

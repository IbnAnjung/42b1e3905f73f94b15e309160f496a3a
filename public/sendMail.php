<?php
require "../bootstrap.php";

use App\Controllers\RequestController;
use App\Controllers\MailController;


header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$request = new RequestController;

$title = $request->post("title");
$email = $request->post('email');
$subject = $request->post('subject');
$body = $request->post("body");

$mail = new MailController;
$mail->send($title, $subject, $email, $body);

echo json_encode([
  'email berhasil di kirim'
]);
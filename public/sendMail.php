<?php
require "../bootstrap.php";

use App\Controllers\RequestController;
use App\Controllers\MailController;

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
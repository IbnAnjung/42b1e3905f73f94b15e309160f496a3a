<?php
require_once __DIR__ . '/vendor/autoload.php';

use App\Controllers\MessageBrokerController;
use App\Controllers\MailController;

echo " [*] Waiting for messages. To exit press CTRL+C\n";

$mailController = new MailController;

$callback = function ($msg) use ($mailController){
  $sendMail = $mailController->sendMail($msg->body);
  echo '[x] mail id is ', $msg->body, "\n";
  echo ' [->]' . $sendMail['message'];
  echo "[*] Waiting for messages. To exit press CTRL+C\n";

};

$mBroker = new MessageBrokerController;
$mBroker->setQueue('mail_job')->consume($callback)->wait();
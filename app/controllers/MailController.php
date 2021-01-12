<?php

namespace App\Controllers;

use App\Middlewares\JWTMiddleware;
use PHPMailer\PHPMailer\PHPMailer;
use App\Controllers\MessageBrokerController;
use App\Models\MailModel;

class MailController {
  
  use JWTMiddleware;
  const CONFIG = [
    'HOST' => 'tls://smtp.gmail.com',
    'USERNAME' => '',
    'PASSWORD' => ''
  ];

  public function sendMail($id)
  {
    $emailDetail = new MailModel;
    $emailDetail->id = $id;
    
    if(!$emailDetail->find()){
      return "id email tidak di temukan";
    }

    $mail = new PHPMailer;
    $mail->Host = SELF::CONFIG['HOST'];
    $mail->Username = SELF::CONFIG['USERNAME']; 
    $mail->Password = SELF::CONFIG['PASSWORD'];
    $mail->SMTPSecure = "tls";
    $mail->Port = 587;
    $mail->isSMTP();
    $mail->SMTPDebug = 3;
    $mail->SMTPAuth = true;
    $mail->From = SELF::CONFIG['USERNAME'];
    $mail->FromName = "angga saputra";
    $mail->addAddress($emailDetail->email, $emailDetail->title); 
    $mail->isHTML(true);
    $mail->Subject = $emailDetail->subject;
    $mail->Body    = $emailDetail->body; 
    $mail->AltBody = "PHP mailer";

    if(!$mail->send())
    {
      $emailDetail->updateStatus("failed");
      return [
        'status' => false,
        'message' => "Mailer Error: email gagal di kirim" 
      ];
    }
    else
    {
      $emailDetail->updateStatus("success");
      return [
        'status' => true,
        'message' => "email berhasil di kirim" 
      ];
    }
  }

  public function send($title, $subject, $email, $body){

    $userId = null;
    $validatedToken = $this->isTokenValidate();
    if(!$validatedToken){
        ['status' => true, 'message' => 'token kamu tidak valid'];
    }

    $mail = new MailModel;
    $mail->title = $title;
    $mail->subject = $subject;
    $mail->email = $email;
    $mail->body = $body;
    $mail->user_id = $validatedToken->data->id;
    
    if($mail->createdNewSendJob()){
      print $mail->id . "\n";
      $mBroker = new MessageBrokerController;
      $mBroker->setQueue('mail_job')->declare()
      ->setAMPQMessage($mail->id)->publish();

      return ['status' => true, 'message' => 'email berhasil di kirim'];
    }else{
      return ['status' => false, 'message' => 'gagal mengirim email'];
    }

  }

}


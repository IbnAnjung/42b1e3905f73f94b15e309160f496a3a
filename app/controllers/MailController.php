<?php

namespace App\Controllers;

use App\Middlewares\JWTMiddleware;

class MailController {

  use JWTMiddleware;

  public function sendMail()
  {

    if($this->isTokenValidate()){
      return ['status' => true, 'message' => $this->isTokenValidate()];
    }else{
      return ['status' => true, 'message' => 'token kamu tidak valid'];
    }

  }

}
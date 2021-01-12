<?php

namespace App\Controllers;

use App\Models\UserModel;
use App\Middlewares\JWTMiddleware;
use \Firebase\JWT\JWT;

class AuthController {

  use JWTMiddleware;

  public function login($username, $password)
  { 

    $userModel = new UserModel;
    $userModel->username = $username;
    $userModel->password = $password;
    
    $user = $userModel->find();

    if(!$user) {
      return ['status' => false, 'message' => 'username tidak ketemu'];
    }

    if(\password_verify($password, $user['password'])){
      return $this->createJwtToken($user);
    }

  }

  public function createJwtToken($user)
  {

    $iat = time();
    $nbf = $iat + 10;
    $exp = $iat + 3600;

    $token = [
      "iss" => "odeo_mail",
      "aud" => $user['username'],
      "iat" => $iat,
      "nbf" => $nbf,
      "exp" => $exp,
      "data" => [
        "username" => $user['username'],
        "id" => $user['id']
      ]
    ];

    $jwtToken = JWT::encode($token, $this->getSecretKey());
    return [
            "status" => true,
            "message" => "LOGIN berhasil.",
            "jwt" => $jwtToken,
            "username" => $user['username'],
            "expireAt" => $exp
        ];


  }

}
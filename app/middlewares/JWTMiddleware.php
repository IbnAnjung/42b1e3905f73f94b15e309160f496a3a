<?php

namespace App\Middlewares;
use \Firebase\JWT\JWT;

trait jwtMiddleware {
  
  protected function getSecretKey()
  {

    return  $_ENV['JWT_KEY'];

  }
  
  protected function isTokenValidate()
  {

    $requestHeaders = apache_request_headers();
    // Server-side fix for bug in old Android versions (a nice side-effect of this fix means we don't care about capitalization for Authorization)
    $requestHeaders = array_combine(array_map('ucwords', array_keys($requestHeaders)), array_values($requestHeaders));
    //print_r($requestHeaders);
    $headers = trim($requestHeaders['Authorization']);
    

    $headers = explode(" ", $headers);

    if(!isset($headers[1])){
      return false;
    }

    $token = $headers[1];

    
    try {

      $decodedToken = JWT::decode($token, $this->getSecretKey(), array('HS256'));
      
      return $decodedToken;
    }catch (Exception $e){
      return null;
    }

  }

}
<?php

require_once __DIR__ . '/../vendor/autoload.php';

use App\Controllers\RequestController;
use App\Controllers\AuthController;

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");


$request = new RequestController;
$username = $request->post("username");
$password = $request->post("password");

$authController = new AuthController;
$login = $authController->login($username, $password);

if($login['status']) {
  echo json_encode([
    $login
  ], true);
}else{
  echo json_encode([
    'login gagal, ' . $login['message']
  ], true);
}
<?php
require_once '../bootstrap.php';

use App\Controllers\RequestController;
use App\Controllers\UserController;

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");


$request = new RequestController;
$username = $request->post("username");
$password = $request->post("password");

$userController = new UserController;
$createdUser = $userController->createUser($username, $password);

if($createdUser['status']) {
  echo json_encode([
    'user' => $createdUser
  ], true);
}else{
  echo json_encode([
    'proses register gagal, ' . $createdUser['message']
  ], true);
}

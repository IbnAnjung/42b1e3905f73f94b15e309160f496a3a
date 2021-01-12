<?php

namespace App\Controllers;
use App\Models\UserModel;

class UserController{

  private $_user;

  public function __construct()
  {
    
    $this->_user = new UserModel;

  }
  public function createUser($username, $password)
  {

      $user = new UserModel;
      $user->username = $username;
      $password_hash = password_hash($password, PASSWORD_BCRYPT);
      $user->password = $password_hash;
      
      if(!$user->find()){
        
        $createdUser = $user->create();
        
        return ['status' => true, 'user' => $user->username];
      }else{
        return ['status' => false, 'message' => 'username sudah ada'];
      }
      
  }

}

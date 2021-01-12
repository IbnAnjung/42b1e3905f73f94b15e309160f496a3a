<?php

namespace App\Models;

use App\Models\Connection;
use PDO;
class UserModel
{

  private $_connection;
  public $id;
  public $username;
  public $password;

  public function __construct()
  {

    $this->_connection = (Connection::getInstance())->getConnection();

  }

  public function create()
  {
    $queryInsert = $this->_connection->prepare('INSERT INTO users (username, password) VALUES (:username, :password)');
    $queryInsert->bindParam(':username', $this->username);
    $queryInsert->bindParam(':password', $this->password);

    try{
      $queryInsert->execute();
      
      return true;
    }catch(PDOException $pdoException) {
      throw new ModelException('query insert gagal');
    }
  }

  public function find()
  {

    $query = $this->_connection->prepare("SELECT id, username, password FROM users where username=:username limit 1");
    $query->bindParam(':username', $this->username);
    $query->execute();
    $users = $query->fetchAll();

    try{
      if(count($users) >  0 ){
        $this->id = $users[0]['id'];
        return $users[0];
      } else{
        return NULL;
      }
    }catch(PDOException $pdoException) {
      throw new ModelException('query insert gagal');
    }
  }

}

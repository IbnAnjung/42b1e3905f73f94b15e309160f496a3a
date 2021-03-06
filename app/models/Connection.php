<?php

namespace App\Models;
use PDO;

class Connection{
  
  private static $_instance = null;
  private $_connection;


  public function __construct()
  {
    try {
      $this->_connection = new PDO('pgsql:host='.$_ENV['DB_HOST'].';dbname= '. $_ENV['DB_NAME'],
        $_ENV['DB_USER'], $_ENV['DB_PASSWORD']);
      $this->_connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        print "Error!: " . $e->getMessage() . "<br/>";
        die();
    }

  }

  public static function getInstance()
  {

    if(Connection::$_instance == null){
      Connection::$_instance = new Connection();
    }

    return Connection::$_instance;

  }  

  public function getConnection()
  { 

    return $this->_connection;

  }

}
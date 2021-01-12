<?php
namespace App\Models;

use App\Models\Connection;
use PDO;
class MailModel
{

  private $_connection;
  
  public $id;
  public $title;
  public $email;
  public $subject;
  public $body;
  public $status;
  public $user_id;
  public $creted_at;

  public function __construct()
  {

    $this->_connection = (Connection::getInstance())->getConnection();

  }

  public function createdNewSendJob()
  {

    $query = $this->_connection->prepare(
      "INSERT INTO mails (title,subject, email, body, user_id) VALUES
        (:title, :subject, :email, :body, :user_id)
      "
    );
    $query->bindParam(":title", $this->title);
    $query->bindParam(":subject",$this->subject);
    $query->bindParam(":email", $this->email);
    $query->bindParam(":user_id", $this->user_id);
    $query->bindParam(":body", $this->body);

    try{
      $this->_connection->beginTransaction();
      $query->execute();
      $this->_connection->commit();
      $this->id = $this->_connection->lastInsertId();
      return true;
    }catch(PDOException $e){
      throw new ModelException('query insert gagal', $e);
    }
  }

  public function find()
  {

    $query = $this->_connection->prepare("SELECT * 
      FROM mails where id = :id LIMIT 1");
    $query->bindParam(":id", $this->id);
    $query->execute();
    $mails = $query->fetchAll();

    if(count($mails) > 0 ){
      $this->id = $mails[0]['id'];
      $this->title = $mails[0]['title'];
      $this->email = $mails[0]['email'];
      $this->subject = $mails[0]['subject'];
      $this->body = $mails[0]['body'];
      $this->user_id = $mails[0]['user_id'];
      $this->created_at = $mails[0]['created_at'];
      return true; 
    }else{
      return false;
    }
    
  }

  public function updateStatus($status)
  {

    $query = $this->_connection->prepare("UPDATE mails 
      set status=:status WHERE id=:id");
    $query->bindParam(":status", $statud);
    $query->bindParam(":id", $this->id);
    $query->execute();

    return true;
  }
}
<?php

namespace App\Controllers;

use PhpAmqpLib\Connection\AMQPStreamConnection;
use PhpAmqpLib\Message\AMQPMessage;

class MessageBrokerController {

  const CONFIG = [
    'HOST' => 'localhost',
    'PORT' => '5672',
    'USER' => 'guest',
    'PASSWORD' => 'guest'
  ];

  private $_connection;
  private $_channel;
  private $_queue;
  private $_AMPQMessage;

  public function __construct()
  {

    $this->_connection = new AMQPStreamConnection(
      SELF::CONFIG['HOST'], SELF::CONFIG['PORT'], 
      SELF::CONFIG['USER'], SELF::CONFIG['PASSWORD']);
    
    $this->_channel = $this->_connection->channel();

  }

  public function setQueue($name)
  {

    $this->_queue = $name;
    return $this;

  }

  public function declare()
  {

    $this->_channel->queue_declare($this->_queue, false, false, false, false);
    return $this;
  }

  public function setAMPQMessage($message)
  {

    $this->_AMPQMessage = new AMQPMessage($message);
    return $this;
  }

  public function  publish()
  {

    $this->_channel->basic_publish($this->_AMPQMessage, '', $this->_queue);
    
  }


  public function __destruct(){

    $this->_channel->close();
    $this->_connection->close();

  }

  public function consume($callback)
  {

    $this->_channel->basic_consume($this->_queue, '', false,
       true, false, false, $callback);
    
    return $this;

  }

  public function wait()
  {

    while ($this->_channel->is_consuming()) {
      $this->_channel->wait();
    }

  }
}
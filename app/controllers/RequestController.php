<?php

namespace App\Controllers;

class RequestController {

  public function post($param)
  {

    return htmlentities(strip_tags(trim($_POST["$param"])));

  }

  public function get($param)
  {

    return htmlentities(strip_tags(trim($_POST["$param"])));

  }

  public function sanitize($value, $type)
  {

    switch ($type) {
      case 'string':
        return filterfilter_var($value, FILTER_SANITIZE_STRING);
        break;
      case 'email':
        return filterfilter_var($value, FILTER_SANITIZE_EMAIL);
        break;
    }
    
    return $value;

  }

}
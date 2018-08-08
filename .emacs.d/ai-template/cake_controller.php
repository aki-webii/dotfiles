/*
 * %file% - cake controller
 *  
 *   Copyright (C) %cyear% rakuten 
 *     by %name% <%mail%> 
 *     Date : %cdate%
 */
<?php
class HelloController extends AppController {
  public $name = 'Hello';
  public $uses = null;
  public $autoRender = false;
  function index(){
    echo "hello world !";
  }
}
?>

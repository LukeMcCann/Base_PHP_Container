<?php
    require_once('db_credentials.php');

    function db_disconnect($connection) {
        if(isset($connection)) { 
            mysqli_close($connection);
        }
    }
?>
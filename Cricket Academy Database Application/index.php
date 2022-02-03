<?php
    $connection = mysqli_connect('localhost','root','','cricket_academy');
    if ($connection) {
        header('location: login.php');
    }
    else {
        header('location: connection_error.php');
    }
?>
<?php
$conn = mysqli_connect('localhost','root','','cricket_academy');
    if (!$conn) {
        header("location: connection_error.php");
    }
    ?>

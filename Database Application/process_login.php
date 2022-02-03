<?php
    include('check_connection.php');
    session_start();
    $message = "Incorrect User ID or Password! Try again...";
    $conn = mysqli_connect('localhost','root','','cricket_academy');
    $user_id = $_POST['front_user_id'];
    $user_password = $_POST['front_password'];
    $sql = "SELECT * FROM user WHERE user_id='$user_id' AND password='$user_password'";
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) === 1) {
        $row = mysqli_fetch_assoc($result);
        if ($row['user_id'] === $user_id && $row['password'] === $user_password) {
            $_SESSION['USER'] = $row['user_id'];
            $_SESSION['LOGIN'] = true;
            if ($row['type']==='staff') {
                header('location: staff_profile.php');
            }
            else if ($row['type']==='coach') {
                header('location: coach_profile.php');
            }
            else if ($row['type']==='player') {
                header('location: player_profile.php');
            }
        }
        else {
            session_destroy();
            header('location: login.php');
        }
    }
    else {
        session_destroy();
        header('location: login.php');
    }
?>
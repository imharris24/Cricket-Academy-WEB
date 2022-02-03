<?php
session_start();
include('check_connection.php');
$conn = mysqli_connect('localhost','root','','cricket_academy');
if (isset($_GET['del']))
{
    $user_id = $_GET['del'];
    mysqli_query($conn,"DELETE FROM statistics WHERE player_user_id = '$user_id';");
    mysqli_query($conn,"DELETE FROM coach_players WHERE player_user_id = '$user_id';");
    mysqli_query($conn,"DELETE FROM player WHERE user_id = '$user_id';");
    mysqli_query($conn,"DELETE FROM user WHERE user_id = '$user_id';");
    header('location: staff_view_players.php');
}
?>
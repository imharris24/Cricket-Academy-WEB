<?php
include('check_connection.php');
session_start();
$conn = mysqli_connect('localhost','root','','cricket_academy');
$user_id = $_POST['front_user_id'];
$user_name = $_POST['front_user_name'];
$user_email = $_POST['front_user_email'];
$user_dob = $_POST['front_user_dob'];
$user_nationality = $_POST['front_user_nationality'];
$user_password = $_POST['front_user_password'];
$user_type = $_POST['front_user_type'];
$player_role = $_POST['front_player_role'];
$player_batting_style = $_POST['front_player_batting_style'];
$player_bowling_style = $_POST['front_player_bowling_style'];
$player_coach_id = $_POST['front_player_coach_id'];
$coach_role = $_POST['front_coach_role'];
$staff_designation = $_POST['front_staff_designation'];
$insert_user = "INSERT INTO user VALUES ('$user_id','$user_name','$user_type','$user_email','$user_dob','$user_nationality',TIMESTAMPDIFF(YEAR, '$user_dob', CURDATE()),'$user_password');";
$insert_player = "INSERT INTO player VALUES ('$user_id','$player_role','$player_batting_style','$player_bowling_style','$player_coach_id');";
$insert_coach = "INSERT INTO coach Values ('$user_id','$coach_role');";
$insert_staff = "INSERT INTO staff VALUE ('$user_id','$staff_designation');";
$insert_coach_players = "INSERT INTO coach_players VALUES ('$user_id','$player_coach_id');";
$insert_statistics = "INSERT INTO statistics(player_user_id) VALUES ('$user_id');";
mysqli_query($conn,$insert_user);
if ($user_type === 'staff') {
    mysqli_query($conn,$insert_staff);
    header('location: staff_register_new_user.php');
}
else if ($user_type === 'coach') {
    mysqli_query($conn,$insert_coach);
    header('location: staff_register_new_user.php');
}
else if ($user_type === 'player') {
    mysqli_query($conn,$insert_player);
    mysqli_query($conn,$insert_coach_players);
    mysqli_query($conn,$insert_statistics);
    header('location: staff_register_new_user.php');
}
header('location: staff_register_new_user.php');
?>
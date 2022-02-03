<?php
include('check_connection.php');
session_start();
$conn = mysqli_connect('localhost','root','','cricket_academy');
$player_user_id = $_POST['front_user_id'];
$innings = $_POST['front_innings'];
$runs = $_POST['front_runs'];
$balls = $_POST['front_balls'];
$dismissals = $_POST['front_dismissals'];
$wickets = $_POST['front_wickets'];
$overs = $_POST['front_overs'];
$runs_conceived = $_POST['front_runs_conceived'];
$average = $runs / $innings;
$strike_rate = ($runs/$balls)*100;
$economy = $runs_conceived/$overs;
$update_query=("UPDATE statistics SET innings = $innings, runs_scored = $runs, balls_faced = $balls, batting_average = $average, strike_rate = $strike_rate, dismissals = $dismissals, wickets = $wickets, over_bowled = $overs, runs_conceived = $runs_conceived, economy=$economy WHERE player_user_id='$player_user_id';");
mysqli_query($conn,$update_query);
header('location: staff_update_player_records.php');
?>

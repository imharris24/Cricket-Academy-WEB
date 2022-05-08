<?php include('check_connection.php'); session_start(); ?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>View Coaches - Cricket Academy</title>
    <meta name="description" content="Database for Cricket Academy used to store personal information and records of players, coaches and staff present in Cricket Academy,">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css?h=b49e92aaabdaea192912ecb989b9dd15">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css?h=3166695f5111bb49984dab9ce0b4fc77">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css?h=3166695f5111bb49984dab9ce0b4fc77">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css?h=3166695f5111bb49984dab9ce0b4fc77">
</head>

<body id="page-top">
<div id="wrapper">
    <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" style="background: #008751;">
        <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                <div class="sidebar-brand-icon rotate-n-15"></div>
                <div class="sidebar-brand-text mx-3"><span>Main menu</span></div>
            </a>
            <hr class="sidebar-divider my-0">
            <ul class="navbar-nav text-light" id="accordionSidebar">
                <li class="nav-item"><a class="nav-link" href="staff_view_players.php"><i class="fas fa-tachometer-alt"></i><span>View Players</span></a></li>
                <li class="nav-item"><a class="nav-link" href="staff_view_coaches.php"><i class="fas fa-user"></i><span>View Coaches</span></a></li>
                <li class="nav-item"><a class="nav-link" href="staff_view_staff.php"><i class="fas fa-table"></i><span>View Staff</span></a></li>
                <li class="nav-item"><a class="nav-link" href="staff_update_player_records.php"><i class="far fa-user-circle"></i><span>Update Player Records</span></a></li>
                <li class="nav-item"><a class="nav-link" href="staff_register_new_user.php"><i class="fas fa-user-circle"></i><span>Register New User</span></a></li>
            </ul>
            <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
        </div>
    </nav>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                    <ul class="navbar-nav flex-nowrap ms-auto">
                        <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><i class="fas fa-search"></i></a>
                            <div class="dropdown-menu dropdown-menu-end p-3 animated--grow-in" aria-labelledby="searchDropdown">
                                <form class="me-auto navbar-search w-100">
                                    <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                        <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                    </div>
                                </form>
                            </div>
                        </li>
                        <div class="d-none d-sm-block topbar-divider"></div>
                        <li class="nav-item dropdown no-arrow">
                            <div class="nav-item dropdown show no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="true" data-bs-toggle="dropdown" href="#"><img class="border rounded-circle img-profile" src="assets/img/avatars/images.png?h=4cf6ea1278652efbecfd6ec680662850"></a>
                                <div class="dropdown-menu show shadow dropdown-menu-end animated--grow-in"><a class="dropdown-item" href="staff_profile.php"><i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Profile</a>
                                    <div class="dropdown-divider"></div><a class="dropdown-item" href="process_logout.php"><i class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Logout</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="container-fluid">
                <h3 class="text-dark mb-4">Cricket Academy</h3>
                <div class="card shadow">
                    <div class="card-header py-3">
                        <p class="text-primary m-0 fw-bold" style="border-color: #009977;color: #009977;">Coaches in Cricket Academy</p>
                    </div>
                    <div class="card-body">
                        <?php
                        $conn = mysqli_connect('localhost','root','','cricket_academy');
                        $query = "SELECT user.user_id, user.name, user.email, user.date_of_birth, user.nationality, user.age, coach.role, (SELECT COUNT(*) FROM coach_players WHERE coach_user_id=user.user_id) as number FROM user JOIN coach ON user.user_id=coach.user_id;";
                        $result = mysqli_query($conn, $query);
                        ?>
                        <table class="table table-borderless">
                            <thead>
                            <tr>
                                <th>User ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Date of Birth</th>
                                <th>Nationality</th>
                                <th>Age</th>
                                <th>Role</th>
                                <th>Players Under Coaching</th>
                                <th colspan="2">Action</th>
                            </tr>
                            </thead>
                            <?php while($row = mysqli_fetch_array($result)) { ?>
                                <tr border = '2px solid black'>
                                    <td> <?php echo $row['user_id']; ?> </td>
                                    <td> <?php echo $row['name']; ?> </td>
                                    <td> <?php echo $row['email']; ?> </td>
                                    <td> <?php echo $row['date_of_birth']; ?> </td>
                                    <td> <?php echo $row['nationality']; ?> </td>
                                    <td> <?php echo $row['age']; ?> </td>
                                    <td> <?php echo $row['role']; ?> </td>
                                    <td> <?php echo $row['number']; ?> </td>
                                    <!--------Add Delete and Edit Button--------->
                                    <td>
                                        <a href="process_delete_coach.php?del=<?php echo $row['user_id']; ?>" class="del_btn">Delete</a>
                                    </td>
                                </tr>
                            <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
<script src="assets/bootstrap/js/bootstrap.min.js?h=5488c86a1260428f0c13c0f8fb06bf6a"></script>
<script src="assets/js/theme.js?h=79f403485707cf2617c5bc5a2d386bb0"></script>
</body>

</html>

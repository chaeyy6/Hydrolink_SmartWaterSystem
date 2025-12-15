<?php
session_start();

// Track current page for navbar active state
$current_page = basename($_SERVER['PHP_SELF']);

// Redirect to login if not logged in
if (!isset($_SESSION['UserID'])) {
  header("Location: login.php");
  exit();
}

// Include database connection & QR library
require_once 'db_connect.php';
require_once 'phpqrcode/qrlib.php';

// Initialize multi-role flags
$isClient = false;
$isSponsor = false;

if (isset($_SESSION['UserID'])) {
  $userID = $_SESSION['UserID'];

  // Check client
  $stmt = $conn->prepare("SELECT 1 FROM clients WHERE UserID=? LIMIT 1");
  $stmt->bind_param("i", $userID);
  $stmt->execute();
  $stmt->store_result();
  $isClient = $stmt->num_rows > 0;
  $stmt->close();

  // Check sponsor
  $stmt = $conn->prepare("SELECT 1 FROM sponsorships WHERE UserID=? LIMIT 1");
  $stmt->bind_param("i", $userID);
  $stmt->execute();
  $stmt->store_result();
  $isSponsor = $stmt->num_rows > 0;
  $stmt->close();
}

// Fetch logged in user info
$userId = $_SESSION['UserID'];
$stmt = $conn->prepare("SELECT Name, Email, Contact, Role, QRCode, PasswordHash FROM users WHERE UserID = ?");
$stmt->bind_param("i", $userId);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
$stmt->close();

// Handle QR code image path
$qrImagePath = "";
if (!empty($user['QRCode'])) {
  $qrDir = __DIR__ . "/qr_codes/";
  if (!file_exists($qrDir)) {
    mkdir($qrDir, 0777, true);
  }

  $qrImagePath = $qrDir . $user['QRCode'] . ".png";

  // Generate QR image if it doesn’t exist yet
  if (!file_exists($qrImagePath)) {
    QRcode::png($user['QRCode'], $qrImagePath, QR_ECLEVEL_L, 5);
  }

  // Web-accessible path
  $qrImagePath = "qr_codes/" . $user['QRCode'] . ".png";
}

// --- AUDIT TRAIL: Track Profile Visit ---
$ip = $_SERVER['REMOTE_ADDR'] ?? 'UNKNOWN';
if ($ip === '::1')
  $ip = '127.0.0.1';
$userAgent = $_SERVER['HTTP_USER_AGENT'] ?? 'UNKNOWN';
$role = $_SESSION['Role'] ?? '';

$stmtAudit = $conn->prepare("
  INSERT INTO audit_logs (AdminID, Action, Details, IPAddress, UserAgent, CreatedAt)
  VALUES (?, 'Visit', ?, ?, ?, NOW())
");
$details = "Visited Profile Page as $role ($current_page)";
$stmtAudit->bind_param("isss", $userId, $details, $ip, $userAgent);
$stmtAudit->execute();
$stmtAudit->close();

// --- Handle Profile Update (Password Only) ---
$errors = [];
$success = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
  $password = trim($_POST['password'] ?? '');
  $confirmPassword = trim($_POST['confirm_password'] ?? '');

  $updatePassword = false;
  if (!empty($password)) {
    if (strlen($password) < 6) {
      $errors[] = "Password must be at least 6 characters.";
    } elseif ($password !== $confirmPassword) {
      $errors[] = "Password and Confirm Password do not match.";
    } else {
      $updatePassword = true;
      $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
    }
  }

  if (empty($errors) && $updatePassword) {
    $stmt = $conn->prepare("UPDATE users SET PasswordHash=? WHERE UserID=?");
    $stmt->bind_param("si", $hashedPassword, $userId);

    if ($stmt->execute()) {
      $success = "Password updated successfully!";

      // --- AUDIT TRAIL: Track Password Update ---
      $stmtAudit = $conn->prepare("
        INSERT INTO audit_logs (AdminID, Action, Details, IPAddress, UserAgent, CreatedAt)
        VALUES (?, 'Update', ?, ?, ?, NOW())
      ");
      $updateDetails = "Updated Password";
      $stmtAudit->bind_param("isss", $userId, $updateDetails, $ip, $userAgent);
      $stmtAudit->execute();
      $stmtAudit->close();
    } else {
      $errors[] = "Error updating password.";
    }
    $stmt->close();
  }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Hydrolink - User Profile Page</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Google Web Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
    href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wdth,wght@0,75..100,300..800;1,75..100,300..800&family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap"
    rel="stylesheet">

  <!-- Icon Font Stylesheet -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

  <!-- Libraries Stylesheet -->
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


  <!-- Customized Bootstrap Stylesheet -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <!-- Template Stylesheet -->
  <link href="css/style.css" rel="stylesheet">
</head>

<body>

  <!-- Spinner Start -->
  <div id="spinner"
    class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>
  <!-- Spinner End -->

  <!-- Navbar & Hero Start -->
  <div class="container-fluid position-relative p-0">
    <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
      <a href="" class="navbar-brand p-0">
        <h1 class="text-primary"><i class="fas fa-hand-holding-water me-3"></i>Hydrolink</h1>
        <!-- <img src="img/logo.png" alt="Logo"> -->
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="fa fa-bars"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto py-0">
          <a href="index.php" class="nav-item nav-link <?= $current_page == 'index.php' ? 'active' : '' ?>">Home</a>
          <a href="about.php" class="nav-item nav-link <?= $current_page == 'about.php' ? 'active' : '' ?>">About</a>
          <a href="service.php"
            class="nav-item nav-link <?= $current_page == 'service.php' ? 'active' : '' ?>">Service</a>
          <a href="blog.php" class="nav-item nav-link <?= $current_page == 'blog.php' ? 'active' : '' ?>">Blog</a>

          <div class="nav-item dropdown">
            <a href="#"
              class="nav-link dropdown-toggle <?= in_array($current_page, ['feature.php', 'product.php', 'team.php', 'testimonial.php', '404.php']) ? 'active' : '' ?>"
              data-bs-toggle="dropdown">Pages</a>
            <div class="dropdown-menu m-0">
              <a href="feature.php" class="dropdown-item <?= $current_page == 'feature.php' ? 'active' : '' ?>">Our
                Feature</a>
              <a href="team.php" class="dropdown-item <?= $current_page == 'team.php' ? 'active' : '' ?>">Our Team</a>
              <a href="testimonial.php"
                class="dropdown-item <?= $current_page == 'testimonial.php' ? 'active' : '' ?>">Testimonial</a>
              <a href="404.php" class="dropdown-item <?= $current_page == '404.php' ? 'active' : '' ?>">404 Page</a>
            </div>
          </div>

          <a href="contact.php"
            class="nav-item nav-link <?= $current_page == 'contact.php' ? 'active' : '' ?>">Contact</a>

          <?php if (isset($_SESSION['UserID'])):
            $userID = $_SESSION['UserID'];

            // Multi-role checks
            $isClient = $conn->query("SELECT 1 FROM clients WHERE UserID=$userID LIMIT 1")->num_rows > 0;
            $isSponsor = $conn->query("SELECT 1 FROM sponsorships WHERE UserID=$userID LIMIT 1")->num_rows > 0;
            ?>

            <!-- Admin Dashboard -->
            <?php if ($_SESSION['Role'] === 'Admin'): ?>
              <a href="admin_dashboard.php"
                class="nav-item nav-link <?= $current_page == 'admin_dashboard.php' ? 'active' : '' ?>">Admin
                Dashboard</a>
            <?php endif; ?>

            <!-- Sponsor Dashboard -->
            <?php if ($isSponsor): ?>
              <a href="sponsor_dashboard.php"
                class="nav-item nav-link <?= $current_page == 'sponsor_dashboard.php' ? 'active' : '' ?>">Sponsor
                Dashboard</a>
            <?php endif; ?>

            <!-- Client Dashboard -->
            <?php if ($isClient): ?>
              <a href="client_dashboard.php"
                class="nav-item nav-link <?= $current_page == 'client_dashboard.php' ? 'active' : '' ?>">Client
                Dashboard</a>
            <?php endif; ?>

            <!-- Attendant Dashboard -->
            <?php if ($_SESSION['Role'] === 'Attendant' || $_SESSION['Role'] === 'Admin'): ?>
              <a href="attendant_dispense.php"
                class="nav-item nav-link <?= $current_page == 'attendant_dispense.php' ? 'active' : '' ?>">
                Attendant Dashboard
              </a>
            <?php endif; ?>

            <!-- ✅ Blockchain Explorer (Admin, Client, Sponsor only) -->
            <?php if ($_SESSION['Role'] === 'Admin' || $isClient || $isSponsor): ?>
              <a href="chain_explorer.php"
                class="nav-item nav-link <?= $current_page == 'chain_explorer.php' ? 'active' : '' ?>">
                Blockchain Explorer
              </a>
            <?php endif; ?>

            <!-- Apply dropdown only for basic users (not in clients/sponsorships and not admin) -->
            <?php if (!$isClient && !$isSponsor && $_SESSION['Role'] === 'User'): ?>
              <div class="nav-item dropdown">
                <a href="#"
                  class="nav-link dropdown-toggle <?= in_array($current_page, ['apply_sponsor.php', 'apply_client.php', 'my_applications.php']) ? 'active' : '' ?>"
                  data-bs-toggle="dropdown">Apply</a>
                <div class="dropdown-menu m-0">
                  <a href="apply_sponsor.php"
                    class="dropdown-item <?= $current_page == 'apply_sponsor.php' ? 'active' : '' ?>">Apply
                    as Sponsor</a>
                  <a href="apply_client.php"
                    class="dropdown-item <?= $current_page == 'apply_client.php' ? 'active' : '' ?>">Apply
                    as Client</a>
                  <a href="my_applications.php"
                    class="dropdown-item <?= $current_page == 'my_applications.php' ? 'active' : '' ?>">My
                    Applications</a>
                </div>
              </div>
            <?php endif; ?>

            <!-- ✅ User Profile -->
            <a href="profile.php"
              class="nav-item nav-link <?= $current_page == 'profile.php' ? 'active' : '' ?>">Profile</a>

            <span class="nav-item nav-link">Welcome,
              <strong><?= htmlspecialchars($_SESSION['Name']); ?></strong></span>
            <a href="logout.php" class="nav-item nav-link text-danger">Logout</a>

          <?php else: ?>
            <a href="login.php" class="nav-item nav-link <?= $current_page == 'login.php' ? 'active' : '' ?>">Login</a>
            <a href="registration.php"
              class="nav-item nav-link <?= $current_page == 'registration.php' ? 'active' : '' ?>">Register</a>
          <?php endif; ?>
        </div>

        <div class="d-none d-xl-flex me-3">
          <div class="d-flex flex-column pe-3 border-end border-primary"></div>
        </div>
        <button class="btn btn-primary btn-md-square d-flex flex-shrink-0 mb-3 mb-lg-0 rounded-circle me-3"
          data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search"></i></button>
      </div>
    </nav>

    <!-- Header Start -->
    <div class="container-fluid bg-breadcrumb">
      <div class="container text-center py-5" style="max-width: 900px;">
        <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">User Profile</h4>
      </div>
    </div>
    <!-- Header End -->
  </div>
  <!-- Navbar & Hero End -->

  <?php
  $conn->close();
  ?>

  <!-- Modal Search Start -->
  <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
      <div class="modal-content rounded-0">
        <div class="modal-header">
          <h4 class="modal-title mb-0" id="exampleModalLabel">Search by keyword</h4>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body d-flex align-items-center">
          <div class="input-group w-75 mx-auto d-flex">
            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
            <span id="search-icon-1" class="input-group-text btn border p-3"><i
                class="fa fa-search text-white"></i></span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Modal Search End -->


  <!-- Profile Start -->
  <div class="container-fluid bg-light py-5">
    <div class="container py-5">
      <div class="text-center mx-auto pb-5 wow fadeInUp" data-wow-delay="0.2s" style="max-width:800px;">
        <h4 class="text-uppercase text-primary">User Profile</h4>
        <h1 class="display-3 text-capitalize mb-3">Welcome, <?= htmlspecialchars($user['Name']); ?>!</h1>
      </div>

      <div class="row justify-content-center">
        <!-- Left: Account Info -->
        <div class="col-lg-6 mb-4">
          <div class="card shadow p-4 rounded-3">
            <?php if (!empty($errors)): ?>
              <div class="alert alert-danger">
                <?php foreach ($errors as $error)
                  echo "<p>$error</p>"; ?>
              </div>
            <?php endif; ?>

            <?php if (!empty($success)): ?>
              <div class="alert alert-success">
                <p><?= $success; ?></p>
              </div>
            <?php endif; ?>

            <h5 class="mb-4">Account Information</h5>
            <form method="POST" action="">
              <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" class="form-control" value="<?= htmlspecialchars($user['Name']); ?>" readonly>
              </div>
              <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" value="<?= htmlspecialchars($user['Email']); ?>" readonly>
              </div>
              <div class="mb-3">
                <label class="form-label">Contact</label>
                <input type="text" class="form-control" value="<?= htmlspecialchars($user['Contact']); ?>" readonly>
              </div>
              <hr>
              <div class="mb-3">
                <label class="form-label">New Password (leave blank to keep current)</label>
                <input type="password" name="password" class="form-control">
              </div>
              <div class="mb-3">
                <label class="form-label">Confirm New Password</label>
                <input type="password" name="confirm_password" class="form-control">
              </div>
              <button type="submit" class="btn btn-primary rounded-pill px-4">Update Password</button>
            </form>
          </div>
        </div>

        <!-- Right: QR Code -->
        <div class="col-lg-6 mb-4">
          <div class="card shadow p-4 rounded-3 text-center">
            <?php if (!empty($qrImagePath)): ?>
              <h5>Your Unique QR Code</h5>
              <img src="<?= $qrImagePath; ?>" alt="User QR Code" class="img-fluid my-3 mx-auto d-block"
                style="max-width:350px; width:100%; height:auto;">
              <div>
                <a href="<?= $qrImagePath; ?>" download="HydroLink-QR.png" class="btn btn-success rounded-pill px-4 py-2">
                  Download QR
                </a>
              </div>
            <?php else: ?>
              <p class="text-danger">No QR code generated for this user.</p>
            <?php endif; ?>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Profile End -->


  <!-- Footer Start -->
  <div class="container-fluid footer py-5 wow fadeIn" data-wow-delay="0.2s">
    <div class="container py-5">
      <div class="row g-5">
        <div class="col-md-6 col-lg-6 col-xl-3">
          <div class="footer-item d-flex flex-column">
            <div class="footer-item">
              <h3 class="text-white mb-4"><i class="fas fa-hand-holding-water text-primary me-3"></i>Hydrolink</h3>
              <p class="mb-3">Hydrolink is a student-led innovation using IoT, blockchain, and QR
                technology to deliver smart, secure, and sustainable water access to communities</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-6 col-xl-3">
          <div class="footer-item d-flex flex-column">
            <h4 class="text-white mb-4">About Us</h4>
            <a href="why_choose_us.php"><i class="fas fa-angle-right me-2"></i> Why Choose Us</a>
            <a href="water_bottles.php"><i class="fas fa-angle-right me-2"></i> Water Bottles</a>
            <a href="water_dispensers.php"><i class="fas fa-angle-right me-2"></i> Water Dispensers</a>
            <a href="contact.php"><i class="fas fa-angle-right me-2"></i> Contact Us</a>
            <a href="terms_conditions.php"><i class="fas fa-angle-right me-2"></i> Terms &amp;
              Conditions</a>
          </div>
        </div>
        <div class="col-md-6 col-lg-6 col-xl-3">
          <div class="footer-item d-flex flex-column">
            <h4 class="text-white mb-4">Contact Info</h4>
            <a href="#"><i class="fa fa-map-marker-alt me-2"></i> San Beda College Alabang, Muntinlupa City,
              Philippines</a>
            <a href="mailto:SBCA.hydrolink@gmail.com"><i class="fas fa-envelope me-2"></i>
              SBCA.hydrolink@gmail.com</a>
            <a href="tel:+639123456789"><i class="fas fa-phone me-2"></i> +63 912 345 6789</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Footer End -->

  <!-- Copyright Start -->
  <div class="container-fluid copyright py-4">
    <div class="container">
      <div class="row g-4 align-items-center">
        <div class="col-md-6 text-center text-md-start mb-md-0">
          <span class="text-body"><a href="#" class="border-bottom text-white"><i
                class="fas fa-copyright text-light me-2"></i>Hydrolink</a>, All right reserved.</span>
        </div>
        <div class="col-md-6 text-center text-md-end text-body">
          Designed By <a class="border-bottom text-white" href="https://htmlcodex.com">HTML Codex</a>
        </div>
      </div>
    </div>
  </div>
  <!-- Copyright End -->


  <!-- Back to Top -->
  <a href="#" class="btn btn-secondary btn-lg-square rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>


  <!-- JavaScript Libraries -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="lib/wow/wow.min.js"></script>
  <script src="lib/easing/easing.min.js"></script>
  <script src="lib/waypoints/waypoints.min.js"></script>
  <script src="lib/counterup/counterup.min.js"></script>
  <script src="lib/owlcarousel/owl.carousel.min.js"></script>


  <!-- Template Javascript -->
  <script src="js/main.js"></script>

  <script>
    document.querySelector('form').addEventListener('submit', function (e) {
      const password = document.getElementById('password').value;
      const confirmPassword = document.getElementById('confirm_password').value;

      if (password !== confirmPassword) {
        e.preventDefault(); // stop submission
        alert('Passwords do not match!');
      }
    });
  </script>

</body>

</html>
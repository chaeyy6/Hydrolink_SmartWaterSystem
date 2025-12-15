<?php
session_start();
require_once 'db_connect.php';

// Redirect to login if user not logged in
if (!isset($_SESSION['UserID'])) {
  header("Location: login.php");
  exit;
}

// Generate CSRF token
if (!isset($_SESSION['csrf_token'])) {
  $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}
$csrf_token = $_SESSION['csrf_token'];

$current_page = basename($_SERVER['PHP_SELF']);

$errors = [];
$success = "";

// If form submitted
if ($_SERVER["REQUEST_METHOD"] === "POST") {

  // Validate CSRF token
  if (!isset($_POST['csrf_token']) || !hash_equals($_SESSION['csrf_token'], $_POST['csrf_token'])) {
    die("Invalid CSRF token.");
  }

  $userID = $_SESSION['UserID'];
  $site_name = trim($_POST['site_name'] ?? '');
  $location = trim($_POST['location'] ?? '');
  $device_info = trim($_POST['device_info'] ?? '');
  $hours = trim($_POST['hours'] ?? '');
  $contact_person = trim($_POST['contact_person'] ?? '');
  $contact_number = trim($_POST['contact_number'] ?? '');
  $notes = trim($_POST['notes'] ?? '');

  // Validation
  if (empty($site_name))
    $errors[] = "Site/Outlet name is required.";
  if (empty($contact_person))
    $errors[] = "Responsible person's name is required.";
  if (empty($contact_number))
    $errors[] = "Contact number is required.";

  // Check for pending Client application
  if (empty($errors)) {
    $check = $conn->prepare("SELECT ApplicationID FROM RoleApplications WHERE UserID=? AND RoleRequested='Client' AND Status='Pending'");
    $check->bind_param("i", $userID);
    $check->execute();
    $check->store_result();

    if ($check->num_rows > 0) {
      $errors[] = "You already have a pending Client application.";
    }
    $check->close();
  }

  // Handle file upload
  $filePath = NULL;
  if (!empty($_FILES["attachment"]["name"])) {
    $targetDir = "uploads/";
    $fileName = uniqid() . "_" . basename($_FILES["attachment"]["name"]);
    $targetFile = $targetDir . $fileName;
    $fileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

    // Basic check (max 2MB and only certain types)
    if ($_FILES["attachment"]["size"] > 2 * 1024 * 1024) {
      $errors[] = "File too large (max 2MB).";
    } elseif (!in_array($fileType, ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx'])) {
      $errors[] = "Invalid file type. Allowed: jpg, jpeg, png, pdf, doc, docx.";
    } else {
      move_uploaded_file($_FILES["attachment"]["tmp_name"], $targetFile);
      $filePath = $fileName;
    }
  }

  if (empty($errors)) {

    // (1) Insert into parent RoleApplications
    $stmt = $conn->prepare("INSERT INTO RoleApplications (UserID, RoleRequested, Notes) VALUES (?, 'Client', ?)");
    $stmt->bind_param("is", $userID, $notes);

    if ($stmt->execute()) {
      $applicationID = $stmt->insert_id;
      $stmt->close();

      // (2) Insert child to ClientApplications
      $stmt2 = $conn->prepare("INSERT INTO ClientApplications
                (ApplicationID, SiteName, Location, DeviceInfo, OperatingHours, ContactPerson, ContactNumber, AttachmentFile)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
      $stmt2->bind_param("isssssss", $applicationID, $site_name, $location, $device_info, $hours, $contact_person, $contact_number, $filePath);

      if ($stmt2->execute()) {
        $success = "Application submitted successfully! You may check your status in My Applications.";

        // regenerate token after successful submit
        $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
      } else {
        $errors[] = "Error inserting client details.";
      }
      $stmt2->close();

    } else {
      $errors[] = "Something went wrong. Please try again.";
      $stmt->close();
    }
  }
}

?>



<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Hydrolink - Apply as a Client Page</title>
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
      </div>
    </nav>

    <!-- Header Start -->
    <div class="container-fluid bg-breadcrumb">
      <div class="container text-center py-5" style="max-width: 900px;">
        <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">Apply as a Client</h4>
      </div>
    </div>
    <!-- Header End -->
  </div>
  <!-- Navbar & Hero End -->

  <!-- Apply as Client Start -->
  <div class="container-fluid bg-light py-5">
    <div class="container py-5">
      <div class="text-center mx-auto pb-5 wow fadeInUp" data-wow-delay="0.2s" style="max-width: 800px;">
        <h4 class="text-uppercase text-primary">Client Application</h4>
        <h1 class="display-4 text-capitalize mb-3">Apply as a Hydrolink Distributor</h1>
        <p>Please fill the form below to request access as a distribution client.</p>
      </div>
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <form method="POST" action="" enctype="multipart/form-data">

            <!-- CSRF token -->
            <input type="hidden" name="csrf_token" value="<?= htmlspecialchars($csrf_token) ?>">

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

            <div class="mb-4">
              <label class="form-label">Site / Outlet Name</label>
              <input type="text" name="site_name" class="form-control p-3" placeholder="e.g. Barangay 17 Water Kiosk">
            </div>

            <div class="mb-4">
              <label class="form-label">Exact Location</label>
              <textarea name="location" class="form-control p-3" rows="3"
                placeholder="Street / City / Coordinates"></textarea>
            </div>

            <div class="mb-4">
              <label class="form-label">Tank or Device Label (if existing)</label>
              <input type="text" name="device_info" class="form-control p-3" placeholder="e.g. Tank #005, ESP32_01">
            </div>

            <div class="mb-4">
              <label class="form-label">Operating Hours</label>
              <input type="text" name="hours" class="form-control p-3" placeholder="e.g. 8AM – 5PM">
            </div>

            <div class="mb-4">
              <label class="form-label">Responsible Person</label>
              <input type="text" name="contact_person" class="form-control p-3" placeholder="Your full name"
                value="<?= htmlspecialchars($_SESSION['Name'] ?? '') ?>">
            </div>

            <div class="mb-4">
              <label class="form-label">Contact Number</label>
              <input type="text" name="contact_number" class="form-control p-3" placeholder="11-digit mobile number"
                value="<?= htmlspecialchars($_SESSION['Contact'] ?? '') ?>">
            </div>

            <div class="mb-4">
              <label class="form-label">Additional Notes / Purpose</label>
              <textarea name="notes" class="form-control p-3" rows="4"
                placeholder="Describe why you are applying as a client"></textarea>
            </div>

            <div class="mb-4">
              <label class="form-label">Upload Permit / Supporting File (optional)</label>
              <input type="file" class="form-control p-3" name="attachment">
            </div>

            <button type="submit" class="btn btn-primary rounded-pill py-3 px-5">Submit Application</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- Apply as Client End -->



  <!-- Footer Start -->
  <div class="container-fluid footer py-5 wow fadeIn" data-wow-delay="0.2s">
    <div class="container py-5">
      <div class="row g-5">
        <div class="col-md-6 col-lg-6 col-xl-3">
          <div class="footer-item d-flex flex-column">
            <div class="footer-item">
              <h3 class="text-white mb-4"><i class="fas fa-hand-holding-water text-primary me-3"></i>Hydrolink</h3>
              <p class="mb-3">Hydrolink is a student-led innovation using IoT, blockchain, and QR technology to deliver
                smart, secure, and sustainable water access to communities</p>
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
</body>

</html>
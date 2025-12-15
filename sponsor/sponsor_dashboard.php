<?php
session_start();
require_once 'db_connect.php';

if (!isset($_SESSION['UserID'])) {
  header("Location: login.php");
  exit;
}

$userId = $_SESSION['UserID'];
$role = $_SESSION['Role'] ?? '';

// --- 1. Fetch sponsor's total funded amount ---
$totalFunded = 0;
if ($role === 'Sponsor') {
  $stmt = $conn->prepare("SELECT Amount FROM sponsorships WHERE UserID = ?");
  $stmt->bind_param("i", $userId);
  $stmt->execute();
  $sponsorData = $stmt->get_result()->fetch_assoc();
  $totalFunded = $sponsorData['Amount'] ?? 0;
  $stmt->close();
}

// --- 2. Calculate totals for this sponsor ---
$costPerBottle = 20;   // PHP cost per 200ml bottle
$litersPerBottle = 0.2;  // 200ml = 0.2 L

if ($role === 'Sponsor') {
  $query = "
        SELECT COUNT(*) AS total_dispenses, COALESCE(SUM(Quantity), 0) AS total_quantity 
        FROM water_dispenses 
        WHERE SponsorID = ?
    ";
  $stmt = $conn->prepare($query);
  $stmt->bind_param("i", $userId);
} else {
  // Admin sees all
  $query = "
        SELECT COUNT(*) AS total_dispenses, COALESCE(SUM(Quantity), 0) AS total_quantity 
        FROM water_dispenses
    ";
  $stmt = $conn->prepare($query);
}
$stmt->execute();
$data = $stmt->get_result()->fetch_assoc();
$totalQuantity = $data['total_quantity'];
$totalLiters = $totalQuantity * $litersPerBottle;
$totalCost = $totalQuantity * $costPerBottle;
$remainingBalance = ($role === 'Sponsor') ? max($totalFunded - $totalCost, 0) : 0;
$stmt->close();

// --- 3. Fetch recent transactions (with blockchain link) ---
if ($role === 'Sponsor') {
  $recentQuery = "
        SELECT wd.DispenseDate, c.SiteName, wd.Quantity, br.Hash, b.BlockIndex
        FROM water_dispenses wd
        JOIN clients c ON wd.ClientID = c.ClientID
        LEFT JOIN blockchain_records br ON br.TransactionID = wd.DispenseID
        LEFT JOIN blocks b ON br.BlockID = b.BlockID
        WHERE wd.SponsorID = ?
        ORDER BY wd.DispenseDate DESC
        LIMIT 5
    ";
  $stmt = $conn->prepare($recentQuery);
  $stmt->bind_param("i", $userId);
} else {
  // Admin sees all
  $recentQuery = "
        SELECT wd.DispenseDate, c.SiteName, wd.Quantity, br.Hash, b.BlockIndex
        FROM water_dispenses wd
        JOIN clients c ON wd.ClientID = c.ClientID
        LEFT JOIN blockchain_records br ON br.TransactionID = wd.DispenseID
        LEFT JOIN blocks b ON br.BlockID = b.BlockID
        ORDER BY wd.DispenseDate DESC
        LIMIT 5
    ";
  $stmt = $conn->prepare($recentQuery);
}
$stmt->execute();
$recentResult = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Hydrolink - Sponsor Dashboard</title>
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
      </div>
    </nav>

    <!-- Header Start -->
    <div class="container-fluid bg-breadcrumb">
      <div class="container text-center py-5" style="max-width: 900px;">
        <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">Sponsor Dashboard</h4>
      </div>
    </div>
    <!-- Header End -->
  </div>
  <!-- Navbar & Hero End -->

  <!-- Sponsor/Admin Dashboard Start -->
  <div class="container-fluid bg-light py-5">
    <div class="container py-5">

      <!-- Heading -->
      <div class="text-center mx-auto pb-5" style="max-width: 800px;">
        <h4 class="text-uppercase text-primary"><?= ($role === 'Admin') ? 'Admin' : 'Sponsor' ?> Dashboard</h4>
        <h1 class="display-4 text-capitalize mb-3">Welcome, <?= htmlspecialchars($_SESSION['Name'] ?? '') ?>!</h1>
        <p>Overview of <?= ($role === 'Admin') ? 'all distributions' : 'your funding impact and water distribution' ?>.
        </p>
      </div>

      <!-- Overview Cards -->
      <div class="row justify-content-center mb-5">
        <?php if ($role === 'Sponsor'): ?>
          <div class="col-md-4 mb-3">
            <div class="border rounded p-4 bg-white h-100 text-center">
              <h5>Total Funded</h5>
              <h2 class="text-primary mb-0">₱<?= number_format($totalFunded, 2) ?></h2>
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <div class="border rounded p-4 bg-white h-100 text-center">
              <h5>Remaining Balance</h5>
              <h2 class="text-success mb-0">₱<?= number_format($remainingBalance, 2) ?></h2>
            </div>
          </div>
        <?php endif; ?>
        <div class="col-md-4 mb-3">
          <div class="border rounded p-4 bg-white h-100 text-center">
            <h5>Total Liters Distributed</h5>
            <h2 class="text-info mb-0"><?= number_format($totalLiters, 2) ?> L</h2>
          </div>
        </div>
      </div>

      <!-- Recent Transactions Table -->
      <div class="row">
        <div class="col-lg-12">
          <div class="border rounded p-4 bg-white">
            <h5 class="mb-4">Recent Distributed Water Transactions</h5>
            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th>Date</th>
                    <th>Client Site</th>
                    <th>Bottles Dispensed</th>
                    <th>Liters</th>
                    <th>Blockchain Record</th>
                  </tr>
                </thead>
                <tbody>
                  <?php while ($row = $recentResult->fetch_assoc()): ?>
                    <tr>
                      <td><?= htmlspecialchars(date("M d, Y h:i A", strtotime($row['DispenseDate']))) ?></td>
                      <td><?= htmlspecialchars($row['SiteName']) ?></td>
                      <td><?= htmlspecialchars($row['Quantity']) ?></td>
                      <td><?= number_format($row['Quantity'] * $litersPerBottle, 2) ?> L</td>
                      <td>
                        <?php if (!empty($row['Hash'])): ?>
                          <a href="#" class="text-primary small">
                            <?= htmlspecialchars(substr($row['Hash'], 0, 10)) ?>...
                          </a>
                          <br><span class="badge bg-light text-dark">Block #<?= $row['BlockIndex'] ?></span>
                        <?php else: ?>
                          <span class="text-muted small">Not mined yet</span>
                        <?php endif; ?>
                      </td>
                    </tr>
                  <?php endwhile; ?>
                  <?php if ($recentResult->num_rows == 0): ?>
                    <tr>
                      <td colspan="5" class="text-center">No transactions yet</td>
                    </tr>
                  <?php endif; ?>
                </tbody>
              </table>
            </div>
            <div class="text-end mt-3">
              <a href="chain_explorer.php" class="btn btn-primary">
                🔗 View Full Blockchain
              </a>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
  <!-- Sponsor/Admin Dashboard End -->
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
</body>

</html>
<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
file_put_contents('debug.log', "SESSION: " . print_r($_SESSION, true) . "\n", FILE_APPEND);
file_put_contents('debug.log', "POST: " . print_r($_POST, true) . "\n", FILE_APPEND);
file_put_contents('debug.log', "FILES: " . print_r($_FILES, true) . "\n", FILE_APPEND);

session_start();
require_once 'db_connect.php';
require 'vendor/autoload.php';

use Zxing\QrReader;

if (!isset($_SESSION['UserID']) || 
    ($_SESSION['Role'] !== 'Attendant' && $_SESSION['Role'] !== 'Admin')) {
  header("Location: index.php");
  exit;
}


$attendantID = $_SESSION['UserID'];
$message = "";
$error = "";
$userData = null;

// Handle QR upload
if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_FILES['qr_file'])) {
  $uploadFile = $_FILES['qr_file']['tmp_name'];

  if ($_FILES['qr_file']['error'] === 0) {
    // Decode QR image
    $qrcode = new QrReader($uploadFile);
    $decodedText = $qrcode->text(); // Extract QR content (should match users.QRCode)

    if ($decodedText) {
      // Validate QRCode in DB
      $stmt = $conn->prepare("SELECT UserID, Name, DailyLimitClaim FROM users WHERE QRCode = ?");
      $stmt->bind_param("s", $decodedText);
      $stmt->execute();
      $result = $stmt->get_result();

      if ($row = $result->fetch_assoc()) {
        $userData = $row;

        // Check if claimed already
        if ($row['DailyLimitClaim'] >= 1) {
          $error = "❌ User already claimed water today.";
        }
      } else {
        $error = "❌ User not found in database.";
      }
    } else {
      $error = "❌ Could not decode QR.";
    }
  } else {
    $error = "❌ Upload error.";
  }
}

// Handle confirmation of dispense
if (isset($_POST['confirm_dispense']) && isset($_POST['userid'])) {
  $userId = intval($_POST['userid']);

  // Verify user exists and hasn't claimed yet
  $stmt = $conn->prepare("SELECT UserID, DailyLimitClaim FROM users WHERE UserID = ?");
  $stmt->bind_param("i", $userId);
  $stmt->execute();
  $userRes = $stmt->get_result();

  if ($user = $userRes->fetch_assoc()) {
    if ($user['DailyLimitClaim'] < 1) {
      // Deduct sponsor fund (₱20) - take from first sponsor with enough balance
      $sponsorStmt = $conn->prepare("SELECT SponsorID, Amount FROM sponsorships WHERE Amount >= 20 ORDER BY SponsorID LIMIT 1");
      $sponsorStmt->execute();
      $sponsorRes = $sponsorStmt->get_result();

      if ($sponsor = $sponsorRes->fetch_assoc()) {
        $conn->query("UPDATE sponsorships SET Amount = Amount - 20 WHERE SponsorID = {$sponsor['SponsorID']}");

        // ✅ Credit client Balance by PaymentPerBottle
        $clientStmt = $conn->prepare("UPDATE clients SET Balance = Balance + PaymentPerBottle WHERE UserID = ?");
        $clientStmt->bind_param("i", $userId);
        $clientStmt->execute();

        // Mark as claimed
        $conn->query("UPDATE users SET DailyLimitClaim = 1 WHERE UserID = {$userId}");

        // ✅ Insert into dispense_logs
        $logStmt = $conn->prepare("INSERT INTO dispense_logs (UserID, AttendantID, AmountDispensed) VALUES (?, ?, 1.00)");
        $logStmt->bind_param("ii", $userId, $attendantID);
        $logStmt->execute();

        $message = "✅ Dispense confirmed. ₱20 deducted from sponsor and credited ₱15 to client balance.";
      } else {
        $error = "❌ No sponsor with sufficient funds.";
      }
    } else {
      $error = "❌ User already claimed today.";
    }
  } else {
    $error = "❌ User not found.";
  }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Hydrolink - Dispense</title>
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
        <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">Attendant Dispense</h4>
      </div>
    </div>
    <!-- Header End -->
  </div>
  <!-- Navbar & Hero End -->

  <!-- Attendant Dispense Start -->
  <div class="container-fluid bg-light py-5">
    <div class="container py-5">
      <div class="text-center mx-auto pb-5 wow fadeInUp" data-wow-delay="0.2s" style="max-width: 800px;">
        <h4 class="text-uppercase text-primary">Attendant Module</h4>
        <h1 class="display-5 fw-bold">Dispense Water via QR</h1>
        <p class="text-muted">Upload and scan a user’s QR code to confirm water distribution.</p>
      </div>

      <!-- Alerts -->
      <?php if (!empty($message)): ?>
        <div class="alert alert-success text-center">
          <?= $message ?>
          <div class="mt-3">
            <a href="finance_summary.php" class="btn btn-outline-dark">
              <i class="fas fa-chart-line me-2"></i> View Finance Summary
            </a>
          </div>
        </div>
      <?php elseif (!empty($error)): ?>
        <div class="alert alert-danger text-center"><?= $error ?></div>
      <?php endif; ?>


      <!-- Upload QR Form -->
      <div class="card shadow p-4 mb-4 wow fadeInUp" data-wow-delay="0.3s">
        <form method="POST" enctype="multipart/form-data" class="row g-3 align-items-center">
          <div class="col-md-8">
            <label for="qr_file" class="form-label fw-bold">Upload QR Image</label>
            <input type="file" name="qr_file" id="qr_file" class="form-control" accept="image/*" required>
          </div>
          <div class="col-md-4 d-flex align-items-end">
            <button type="submit" class="btn btn-primary w-100">
              <i class="fas fa-qrcode me-2"></i> Process QR
            </button>
          </div>
        </form>
      </div>

      <!-- User Details + Confirm Dispense -->
      <?php if ($userData && empty($error)): ?>
        <div class="card shadow p-4 wow fadeInUp" data-wow-delay="0.4s">
          <h4 class="fw-bold text-dark mb-3">User Details</h4>
          <p><strong>Name:</strong> <?= htmlspecialchars($userData['Name']) ?></p>
          <p><strong>User ID:</strong> <?= $userData['UserID'] ?></p>
          <p><strong>Daily Claim:</strong>
            <?= $userData['DailyLimitClaim']
              ? '<span class="badge bg-danger">Already Claimed</span>'
              : '<span class="badge bg-success">Available</span>' ?>
          </p>

          <?php if ($userData['DailyLimitClaim'] == 0): ?>
            <form method="POST" class="mt-3">
              <input type="hidden" name="userid" value="<?= $userData['UserID'] ?>">
              <button type="submit" name="confirm_dispense" class="btn btn-success">
                <i class="fas fa-check-circle me-2"></i> Confirm Dispense
              </button>
            </form>
          <?php else: ?>
            <p class="text-danger fw-bold mt-3">❌ This user has already claimed water today.</p>
          <?php endif; ?>
        </div>
      <?php endif; ?>


      <!-- Persistent Finance Summary Button -->
      <div class="text-center mt-5 wow fadeInUp" data-wow-delay="0.5s">
        <a href="finance_summary.php" class="btn btn-dark btn-lg">
          <i class="fas fa-database me-2"></i> Go to Finance Summary
        </a>
      </div>
    </div>
  </div>
  <!-- Attendant Dispense End -->


    <!-- Rows will be inserted by JS -->
  </tbody>
</table>




  <!-- Footer Start -->
  <div class="container-fluid footer py-5 wow fadeIn" data-wow-delay="0.2s">
    <div class="container py-5">
      <div class="row g-5">
        <div class="col-md-6 col-lg-6 col-xl-3">
          <div class="footer-item d-flex flex-column">
            <div class="footer-item">
              <h3 class="text-white mb-4"><i class="fas fa-hand-holding-water text-primary me-3"></i>Hydrolink</h3>
              <p class="mb-3">Hydrolink is a student-led innovation using IoT, blockchain, and QR
                technology to deliver smart, secure, and sustainable water access to communities.</p>
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
          <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
          <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
          <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
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
  <script>
  window.addEventListener('load', () => {
      const spinner = document.getElementById('spinner');
      if (spinner) spinner.classList.remove('show');
  });
  async function loadFinancialChain() {
    try {
      const response = await fetch("http://localhost:5000/get_financial_chain");
      if (!response.ok) throw new Error("Network response was not ok");

      const data = await response.json();
      const tableBody = document.querySelector("#financialChainTable tbody");
      tableBody.innerHTML = ""; // clear old rows

      data.chain.forEach(block => {
        const tr = document.createElement("tr");

        // Block info
        const txDetails = block.transactions.map(tx => {
          return `
            <div>
              <b>Type:</b> ${tx.tx_type || "-"} |
              <b>Party:</b> ${tx.party || "-"} |
              <b>Amount:</b> ₱${tx.amount || 0} <br>
              <b>SponsorID:</b> ${tx.sponsor_id || "-"} |
              <b>ClientID:</b> ${tx.client_id || "-"} <br>
              <b>Details:</b> ${tx.details || ""} |
              <b>Time:</b> ${new Date(tx.timestamp * 1000).toLocaleString()}
            </div>
          `;
        }).join("<hr>");

        tr.innerHTML = `
          <td>${block.index}</td>
          <td style="word-break:break-all">${block.hash}</td>
          <td style="word-break:break-all">${block.previous_hash}</td>
          <td>${txDetails || "No Transactions"}</td>
        `;

        tableBody.appendChild(tr);
      });
    } catch (err) {
      console.error("❌ Error loading financial chain:", err);
    }
  }

  // Load on page load
  document.addEventListener("DOMContentLoaded", loadFinancialChain);
  </script>

</body>

</html>
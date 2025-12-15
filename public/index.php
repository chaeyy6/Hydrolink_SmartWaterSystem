<?php
session_start();
$current_page = basename($_SERVER['PHP_SELF']); // e.g., "index.php"

// Include database connection
require_once 'db_connect.php'; // <-- make sure $conn is initialized

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

    // === AUDIT TRAIL: Track Admin visits ===
    if (isset($_SESSION['Role']) && $_SESSION['Role'] === 'Admin') {
        $ip = $_SERVER['REMOTE_ADDR'] ?? 'UNKNOWN';
        if ($ip === '::1')
            $ip = '127.0.0.1'; // normalize localhost
        $userAgent = $_SERVER['HTTP_USER_AGENT'] ?? 'UNKNOWN';

        $stmtAudit = $conn->prepare("
            INSERT INTO audit_logs (AdminID, Action, Details, IPAddress, UserAgent, CreatedAt)
            VALUES (?, 'Visit', 'Visited homepage (index.php)', ?, ?, NOW())
        ");
        $stmtAudit->bind_param("iss", $userID, $ip, $userAgent);
        $stmtAudit->execute();
        $stmtAudit->close();
    }
}

// ✅ Fetch all published blogs
$sql = "SELECT b.BlogID, b.Title, b.Excerpt, b.Content, b.ImagePath, b.CreatedAt, u.Name AS Author
        FROM blogs b
        JOIN users u ON b.AuthorID = u.UserID
        WHERE b.Status = 'published'
        ORDER BY b.CreatedAt DESC";

$result = $conn->query($sql);
$blogs = [];
while ($row = $result->fetch_assoc()) {
    $blogs[] = $row;
}
?>




<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Hydrolink - Home Page</title>
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
                    <a href="index.php"
                        class="nav-item nav-link <?= $current_page == 'index.php' ? 'active' : '' ?>">Home</a>
                    <a href="about.php"
                        class="nav-item nav-link <?= $current_page == 'about.php' ? 'active' : '' ?>">About</a>
                    <a href="service.php"
                        class="nav-item nav-link <?= $current_page == 'service.php' ? 'active' : '' ?>">Service</a>
                    <a href="blog.php"
                        class="nav-item nav-link <?= $current_page == 'blog.php' ? 'active' : '' ?>">Blog</a>

                    <div class="nav-item dropdown">
                        <a href="#"
                            class="nav-link dropdown-toggle <?= in_array($current_page, ['feature.php', 'product.php', 'team.php', 'testimonial.php', '404.php']) ? 'active' : '' ?>"
                            data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu m-0">
                            <a href="feature.php"
                                class="dropdown-item <?= $current_page == 'feature.php' ? 'active' : '' ?>">Our
                                Feature</a>
                            <a href="team.php"
                                class="dropdown-item <?= $current_page == 'team.php' ? 'active' : '' ?>">Our Team</a>
                            <a href="testimonial.php"
                                class="dropdown-item <?= $current_page == 'testimonial.php' ? 'active' : '' ?>">Testimonial</a>
                            <a href="404.php"
                                class="dropdown-item <?= $current_page == '404.php' ? 'active' : '' ?>">404 Page</a>
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
                        <a href="login.php"
                            class="nav-item nav-link <?= $current_page == 'login.php' ? 'active' : '' ?>">Login</a>
                        <a href="registration.php"
                            class="nav-item nav-link <?= $current_page == 'registration.php' ? 'active' : '' ?>">Register</a>
                    <?php endif; ?>
                </div>

                <div class="d-none d-xl-flex me-3">
                    <div class="d-flex flex-column pe-3 border-end border-primary"></div>
                </div>
            </div>
        </nav>


        <!-- Carousel Start -->
        <div class="carousel-header">
            <div id="carouselId" class="carousel slide" data-bs-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-bs-target="#carouselId" data-bs-slide-to="0" class="active"></li>
                    <li data-bs-target="#carouselId" data-bs-slide-to="1"></li>
                    <li data-bs-target="#carouselId" data-bs-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active">
                        <img src="img/carousel-1.jpg" class="img-fluid w-100" alt="Image">
                        <div class="carousel-caption-1">
                            <div class="carousel-caption-1-content" style="max-width: 900px;">
                                <h4 class="text-white text-uppercase fw-bold mb-4 fadeInLeft animated"
                                    data-animation="fadeInLeft" data-delay="1s" style="animation-delay: 1s;"
                                    style="letter-spacing: 3px;">Importance life</h4>
                                <h1 class="display-2 text-capitalize text-white mb-4 fadeInLeft animated"
                                    data-animation="fadeInLeft" data-delay="1.3s" style="animation-delay: 1.3s;">Smart
                                    Water Access for a Sustainable Future</h1>
                                <p class="mb-5 fs-5 text-white fadeInLeft animated" data-animation="fadeInLeft"
                                    data-delay="1.5s" style="animation-delay: 1.5s;"> Hydrolink leverages IoT,
                                    blockchain, and QR technology to provide real-time monitoring, transparent resource
                                    distribution, and community-driven water conservation. Empowering communities with
                                    sustainable and efficient water access,
                                </p>
                                <div class="carousel-caption-1-content-btn fadeInLeft animated"
                                    data-animation="fadeInLeft" data-delay="1.7s" style="animation-delay: 1.7s;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="img/carousel-2.jpg" class="img-fluid w-100" alt="Image">
                        <div class="carousel-caption-2">
                            <div class="carousel-caption-2-content" style="max-width: 900px;">
                                <h4 class="text-white text-uppercase fw-bold mb-4 fadeInRight animated"
                                    data-animation="fadeInRight" data-delay="1s" style="animation-delay: 1s;"
                                    style="letter-spacing: 3px;">Importance life</h4>
                                <h1 class="display-2 text-capitalize text-white mb-4 fadeInRight animated"
                                    data-animation="fadeInRight" data-delay="1.3s" style="animation-delay: 1.3s;">
                                    Empowering Communities with Smart Water Access</h1>
                                <p class="mb-5 fs-5 text-white fadeInRight animated" data-animation="fadeInRight"
                                    data-delay="1.5s" style="animation-delay: 1.5s;">Our IoT and blockchain-powered
                                    water distribution system ensures clean, secure, and sustainable access to
                                    water—bridging the gap between innovation and community well-being.</p>

                                <div class="carousel-caption-2-content-btn fadeInRight animated"
                                    data-animation="fadeInRight" data-delay="1.7s" style="animation-delay: 1.7s;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon btn btn-primary fadeInLeft animated" aria-hidden="true"
                        data-animation="fadeInLeft" data-delay="1.1s" style="animation-delay: 1.3s;"> <i
                            class="fa fa-angle-left fa-3x"></i></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                    <span class="carousel-control-next-icon btn btn-primary fadeInRight animated" aria-hidden="true"
                        data-animation="fadeInLeft" data-delay="1.1s" style="animation-delay: 1.3s;"><i
                            class="fa fa-angle-right fa-3x"></i></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <!-- Carousel End -->
    </div>
    <!-- Navbar & Hero End -->

    <!-- feature Start -->
    <div class="container-fluid feature bg-light py-5">
        <div class="container py-5">
            <div class="text-center mx-auto pb-5 wow fadeInUp" data-wow-delay="0.2s" style="max-width: 800px;">
                <h4 class="text-uppercase text-primary">Our Feature</h4>
                <h1 class="display-3 text-capitalize mb-3">A Smart, Transparent & Sustainable Water System</h1>
            </div>
            <div class="row g-4">
                <div class="col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.2s">
                    <div class="feature-item p-4">
                        <div class="feature-icon mb-3">
                            <i class="fas fa-tachometer-alt text-white fa-3x"></i>
                        </div>
                        <a href="#" class="h4 mb-3">Real-Time Monitoring</a>
                        <p class="mb-3">IoT sensors track water levels and usage live.</p>
                        <div class="collapse" id="feature1">
                            <p>Hydrolink’s sensor network gathers real-time water data to detect leaks, optimize refills
                                and prevent service interruptions in advance.</p>
                        </div>
                        <a class="btn text-secondary" data-bs-toggle="collapse" href="#feature1" role="button"
                            aria-expanded="false" aria-controls="feature1">Read More <i
                                class="fa fa-angle-right"></i></a>
                    </div>
                </div>

                <div class="col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.4s">
                    <div class="feature-item p-4">
                        <div class="feature-icon mb-3">
                            <i class="fas fa-lock text-white fa-3x"></i>
                        </div>
                        <a href="#" class="h4 mb-3">Blockchain Security</a>
                        <p class="mb-3">Water transactions are securely logged.</p>
                        <div class="collapse" id="feature2">
                            <p>Every transaction is stamped into a tamper-proof blockchain ledger, ensuring full
                                transparency and traceability for sponsors and users.</p>
                        </div>
                        <a class="btn text-secondary" data-bs-toggle="collapse" href="#feature2" role="button"
                            aria-expanded="false" aria-controls="feature2">Read More <i
                                class="fa fa-angle-right"></i></a>
                    </div>
                </div>

                <div class="col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.6s">
                    <div class="feature-item p-4">
                        <div class="feature-icon mb-3">
                            <i class="fas fa-qrcode text-white fa-3x"></i>
                        </div>
                        <a href="#" class="h4 mb-3">QR Code Access</a>
                        <p class="mb-3">Scan to access clean water and resources.</p>
                        <div class="collapse" id="feature3">
                            <p>Each user receives a unique QR code which provides secure, trackable access to water
                                points and educational material through the app.</p>
                        </div>
                        <a class="btn text-secondary" data-bs-toggle="collapse" href="#feature3" role="button"
                            aria-expanded="false" aria-controls="feature3">Read More <i
                                class="fa fa-angle-right"></i></a>
                    </div>
                </div>

                <div class="col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.8s">
                    <div class="feature-item p-4">
                        <div class="feature-icon mb-3">
                            <i class="fas fa-leaf text-white fa-3x"></i>
                        </div>
                        <a href="#" class="h4 mb-3">Eco-Friendly Solution</a>
                        <p class="mb-3">Minimizing single-use plastics.</p>
                        <div class="collapse" id="feature4">
                            <p>Hydrolink uses biodegradable containers and promotes sustainable refill cycles to lessen
                                environmental impact in local communities.</p>
                        </div>
                        <a class="btn text-secondary" data-bs-toggle="collapse" href="#feature4" role="button"
                            aria-expanded="false" aria-controls="feature4">Read More <i
                                class="fa fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- feature End -->


    <!-- About Start -->
    <div class="container-fluid about overflow-hidden py-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-xl-6 wow fadeInLeft" data-wow-delay="0.2s">
                    <div class="about-img rounded h-100">
                        <img src="img/about.jpg" class="img-fluid rounded h-100 w-100" style="object-fit: cover;"
                            alt="">
                        <div class="about-exp"><span>Developed by IT Students</span></div>
                    </div>
                </div>
                <div class="col-xl-6 wow fadeInRight" data-wow-delay="0.2s">
                    <div class="about-item">
                        <h4 class="text-primary text-uppercase">About Us</h4>
                        <h1 class="display-3 mb-3">Smart & Sustainable Water Distribution.</h1>
                        <p class="mb-4">Hydrolink utilizes IoT, blockchain, and QR technology to ensure transparent,
                            efficient, and equitable access to clean water. Empowering communities with real-time
                            monitoring and sustainable water management.
                        </p>
                        <div class="bg-light rounded p-4 mb-4">
                            <div class="row">
                                <div class="col-12">
                                    <div class="d-flex">
                                        <div class="pe-4">
                                            <div class="rounded-circle bg-primary d-flex align-items-center justify-content-center"
                                                style="width: 80px; height: 80px;"><i
                                                    class="fas fa-tint text-white fa-2x"></i></div>
                                        </div>
                                        <div class="">
                                            <a href="#" class="h4 d-inline-block mb-3">Empowered Communities</a>
                                            <p class="mb-0">Transparent and efficient water distribution ensures clean
                                                water access for all, leveraging innovative IoT, blockchain, and QR
                                                technology.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bg-light rounded p-4 mb-4">
                            <div class="row">
                                <div class="col-12">
                                    <div class="d-flex">
                                        <div class="pe-4">
                                            <div class="rounded-circle bg-primary d-flex align-items-center justify-content-center"
                                                style="width: 80px; height: 80px;"><i
                                                    class="fas fa-faucet text-white fa-2x"></i></div>
                                        </div>
                                        <div class="">
                                            <a href="#" class="h4 d-inline-block mb-3">Innovative Water Solutions</a>
                                            <p class="mb-0">Real-time monitoring, secure transactions, and sustainable
                                                water management create a smarter, more equitable water distribution
                                                system for communities in need.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->

    <!-- Fact Counter -->
    <div class="container-fluid counter py-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.2s">
                    <div class="counter-item">
                        <div class="counter-item-icon mx-auto">
                            <i class="fas fa-wifi fa-3x text-white"></i>
                        </div>
                        <h4 class="text-white my-4">IoT Sensors Deployed</h4>
                        <div class="counter-counting">
                            <span class="text-white fs-2 fw-bold" data-toggle="counter-up">4</span>
                            <span class="h1 fw-bold text-white">+</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.4s">
                    <div class="counter-item">
                        <div class="counter-item-icon mx-auto">
                            <i class="fas fa-qrcode fa-3x text-white"></i>
                        </div>
                        <h4 class="text-white my-4">QR Codes Generated</h4>
                        <div class="counter-counting">
                            <span class="text-white fs-2 fw-bold" data-toggle="counter-up">10</span>
                            <span class="h1 fw-bold text-white">+</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.6s">
                    <div class="counter-item">
                        <div class="counter-item-icon mx-auto">
                            <i class="fas fa-leaf fa-3x text-white"></i>
                        </div>
                        <h4 class="text-white my-4">Plastic Bottles Avoided</h4>
                        <div class="counter-counting">
                            <span class="text-white fs-2 fw-bold" data-toggle="counter-up">200</span>
                            <span class="h1 fw-bold text-white">+</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.8s">
                    <div class="counter-item">
                        <div class="counter-item-icon mx-auto">
                            <i class="fas fa-users fa-3x text-white"></i>
                        </div>
                        <h4 class="text-white my-4">Community Users Reached</h4>
                        <div class="counter-counting">
                            <span class="text-white fs-2 fw-bold" data-toggle="counter-up">50</span>
                            <span class="h1 fw-bold text-white">+</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Fact Counter -->



    <!-- Service Start -->
    <div class="container-fluid service bg-light overflow-hidden py-5">
        <div class="container py-5">
            <div class="text-center mx-auto pb-5 wow fadeInUp" data-wow-delay="0.2s" style="max-width: 800px;">
                <h4 class="text-uppercase text-primary">Our Service</h4>
                <h1 class="display-3 text-capitalize mb-3">Protect Your Family with Best Water</h1>
            </div>
            <div class="row gx-0 gy-4 align-items-center">
                <div class="col-lg-6 col-xl-4 wow fadeInLeft" data-wow-delay="0.2s">
                    <div class="service-item rounded p-4 mb-4">
                        <div class="row">
                            <div class="col-12">
                                <div class="d-flex">
                                    <div class="service-content text-end">
                                        <a href="#" class="h4 d-inline-block mb-3">QR-Based Water Access</a>
                                        <p class="mb-0">Easily locate clean water sources and verify real-time
                                            availability by scanning QR codes, ensuring equitable distribution and
                                            accessibility.</p>
                                    </div>

                                    <div class="ps-4">
                                        <div class="service-btn"><i
                                                class="fas fa-hand-holding-water text-white fa-2x"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="service-item rounded p-4 mb-4">
                        <div class="row">
                            <div class="col-12">
                                <div class="d-flex">
                                    <div class="service-content text-end">
                                        <a href="#" class="h4 d-inline-block mb-3">Sustainability Tracking</a>
                                        <p class="mb-0">Monitor water conservation impact with live data insights,
                                            encouraging responsible usage and supporting long-term sustainability goals.
                                        </p>
                                    </div>

                                    <div class="ps-4">
                                        <div class="service-btn"><i class="fas fa-dumpster-fire text-white fa-2x"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="service-item rounded p-4 mb-0">
                        <div class="row">
                            <div class="col-12">
                                <div class="d-flex">
                                    <div class="service-content text-end">
                                        <a href="#" class="h4 d-inline-block mb-3">Data-Driven Water Management</a>
                                        <p class="mb-0">Utilize QR-integrated analytics to optimize distribution,
                                            prevent shortages, and enhance efficiency in water resource management.</p>
                                    </div>
                                    <div class="ps-4">
                                        <div class="service-btn"><i class="fas fa-filter text-white fa-2x"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-xl-4 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bg-transparent">
                        <img src="img/waterdroplet.png" class="img-fluid w-100" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-xl-4 wow fadeInRight" data-wow-delay="0.2s">
                    <div class="service-item rounded p-4 mb-4">
                        <div class="row">
                            <div class="col-12">
                                <div class="d-flex">
                                    <div class="pe-4">
                                        <div class="service-btn"><i
                                                class="fas fa-assistive-listening-systems text-white fa-2x"></i></div>
                                    </div>
                                    <div class="service-content">
                                        <a href="#" class="h4 d-inline-block mb-3">Smart QR Code Access</a>
                                        <p class="mb-0">Scan to access real-time water quality data, conservation tips,
                                            and community engagement tools, ensuring informed and responsible water
                                            usage.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="service-item rounded p-4 mb-4">
                        <div class="row">
                            <div class="col-12">
                                <div class="d-flex">
                                    <div class="pe-4">
                                        <div class="service-btn"><i class="fas fa-recycle text-white fa-2x"></i></div>
                                    </div>
                                    <div class="service-content">
                                        <a href="#" class="h4 d-inline-block mb-3">Community Awareness</a>
                                        <p class="mb-0">Empowering users with instant water sustainability insights
                                            through QR-enabled resources, promoting education and responsible
                                            consumption.</p>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="service-item rounded p-4 mb-0">
                        <div class="row">
                            <div class="col-12">
                                <div class="d-flex">
                                    <div class="pe-4">
                                        <div class="service-btn"><i class="fas fa-project-diagram text-white fa-2x"></i>
                                        </div>
                                    </div>
                                    <div class="service-content">
                                        <a href="#" class="h4 d-inline-block mb-3">Blockchain-Backed Transparency</a>
                                        <p class="mb-0">Ensure secure, tamper-proof tracking of water sources, usage,
                                            and sponsorships by linking QR data to blockchain records.</p>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Service End -->


    <!-- Products Start -->
    <div class="container-fluid product py-5">
        <div class="container py-5">
            <div class="text-center mx-auto pb-5 wow fadeInUp" data-wow-delay="0.2s" style="max-width: 800px;">
                <h4 class="text-uppercase text-primary">Our Products</h4>
                <h1 class="display-3 text-capitalize mb-3">Safe & Refreshing Water Options</h1>
                <p class="text-muted">Choose the type of water that best suits your lifestyle. Hydrolink delivers
                    quality hydration, every time.</p>
            </div>
            <div class="row g-4 justify-content-center">

                <!-- Product 1 -->
                <div class="col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.2s">
                    <div class="product-item">
                        <img src="img/purified.jpg" class="img-fluid w-100 rounded-top" alt="Purified Water">
                        <div class="product-content bg-light text-center rounded-bottom p-4">
                            <a href="#" class="h4 d-inline-block mb-3">Purified Water</a>
                            <p>Crystal-clear and safe for daily drinking, perfect for your everyday hydration needs.</p>
                        </div>
                    </div>
                </div>

                <!-- Product 2 -->
                <div class="col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.4s">
                    <div class="product-item">
                        <img src="img/mineral.jpg" class="img-fluid w-100 rounded-top" alt="Mineral Water">
                        <div class="product-content bg-light text-center rounded-bottom p-4">
                            <a href="#" class="h4 d-inline-block mb-3">Mineral Water</a>
                            <p>Rich in essential minerals to keep your body energized and balanced naturally.</p>
                        </div>
                    </div>
                </div>

                <!-- Product 3 -->
                <div class="col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.6s">
                    <div class="product-item">
                        <img src="img/alkaline.jpg" class="img-fluid w-100 rounded-top" alt="Alkaline Water">
                        <div class="product-content bg-light text-center rounded-bottom p-4">
                            <a href="#" class="h4 d-inline-block mb-3">Alkaline Water</a>
                            <p>With a balanced pH, ideal for active lifestyles and promoting overall wellness.</p>
                        </div>
                    </div>
                </div>

                <!-- Product 4 -->
                <div class="col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.8s">
                    <div class="product-item">
                        <img src="img/distilled.jpg" class="img-fluid w-100 rounded-top" alt="Distilled Water">
                        <div class="product-content bg-light text-center rounded-bottom p-4">
                            <a href="#" class="h4 d-inline-block mb-3">Distilled Water</a>
                            <p>Ultra-pure water, perfect for medical use, appliances, and special requirements.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Products End -->



    <!-- Blog Start -->
    <div class="container-fluid blog py-5">
        <div class="container py-5">
            <div class="text-center mx-auto pb-5" style="max-width: 800px;">
                <h4 class="text-uppercase text-primary">Our Blog</h4>
                <h1 class="display-3 text-capitalize mb-3">Latest Blog & News</h1>
            </div>
            <div class="row g-4 justify-content-center">

                <?php if (!empty($blogs)): ?>
                    <?php foreach ($blogs as $index => $blog): ?>
                        <div class="col-lg-6 col-xl-4 d-flex">
                            <div class="blog-item wow fadeInUp flex-fill d-flex flex-column"
                                data-wow-delay="<?= 0.2 * ($index + 1) ?>s">

                                <!-- Image -->
                                <div class="blog-img">
                                    <img src="<?= htmlspecialchars($blog['ImagePath'] ?? 'img/default-blog.jpg') ?>"
                                        class="img-fluid rounded-top w-100" alt="<?= htmlspecialchars($blog['Title']) ?>">
                                    <div class="blog-date px-4 py-2">
                                        <i class="fa fa-calendar-alt me-1"></i>
                                        <?= date("M d, Y", strtotime($blog['CreatedAt'])) ?>
                                    </div>
                                </div>

                                <!-- Content -->
                                <div class="blog-content rounded-bottom p-4 d-flex flex-column flex-grow-1">
                                    <!-- Title collapses to full article -->
                                    <a class="h4 d-inline-block mb-3" data-bs-toggle="collapse"
                                        href="#blog<?= $blog['BlogID'] ?>" role="button" aria-expanded="false"
                                        aria-controls="blog<?= $blog['BlogID'] ?>">
                                        <?= htmlspecialchars($blog['Title']) ?>
                                    </a>

                                    <!-- Short excerpt -->
                                    <p class="flex-grow-1"><?= htmlspecialchars($blog['Excerpt']) ?></p>

                                    <!-- Read More toggle -->
                                    <a class="fw-bold text-secondary mt-auto" data-bs-toggle="collapse"
                                        href="#blog<?= $blog['BlogID'] ?>" role="button" aria-expanded="false"
                                        aria-controls="blog<?= $blog['BlogID'] ?>">
                                        Read More <i class="fa fa-angle-right"></i>
                                    </a>

                                    <!-- Full content -->
                                    <div class="collapse mt-3" id="blog<?= $blog['BlogID'] ?>">
                                        <div class="p-3 border rounded bg-light">
                                            <?= nl2br(htmlspecialchars($blog['Content'])) ?>
                                            <p class="text-muted mt-3 mb-0">
                                                <i class="fa fa-user me-1"></i>
                                                Posted by <?= htmlspecialchars($blog['Author']) ?>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                <?php else: ?>
                    <div class="col-12 text-center">
                        <p class="text-muted">No blog posts available yet. Check back soon!</p>
                    </div>
                <?php endif; ?>

            </div>
        </div>
    </div>
    <!-- Blog End -->


    <!-- Team Start -->
    <div class="container-fluid team pb-5">
        <div class="container pb-5">
            <div class="text-center mx-auto pb-5 wow fadeInUp" data-wow-delay="0.2s" style="max-width: 800px;">
                <h4 class="text-uppercase text-primary">Our Team</h4>
                <h1 class="display-3 text-capitalize mb-3">Meet the Developers Behind Hydrolink</h1>
            </div>
            <div class="row g-4 justify-content-center">
                <!-- Walglen -->
                <div class="col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.2s">
                    <div class="team-item p-4">
                        <div class="team-inner rounded">
                            <div class="team-img">
                                <img src="img/walglen.jpg" class="img-fluid rounded-top w-100" alt="Walglen S. Abela">
                                <div class="team-share">
                                    <a class="btn btn-secondary btn-md-square rounded-pill text-white mx-1" href="#"><i
                                            class="fas fa-share-alt"></i></a>
                                </div>
                                <div class="team-icon rounded-pill py-2 px-2">
                                    <a class="btn btn-secondary btn-sm-square rounded-pill mx-1"
                                        href="https://www.facebook.com/wsabela"><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-secondary btn-sm-square rounded-pill me-1"
                                        href="https://www.instagram.com/wal.geee/"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            <div class="bg-light rounded-bottom text-center py-4">
                                <h4 class="mb-3">Walglen S. Abela</h4>
                                <p class="mb-0">Full-Stack Developer / Systems Architect</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Lawrence -->
                <div class="col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.4s">
                    <div class="team-item p-4">
                        <div class="team-inner rounded">
                            <div class="team-img">
                                <img src="img/lawrence.jpg" class="img-fluid rounded-top w-100" alt="Lawrence L. Grita">
                                <div class="team-share">
                                    <a class="btn btn-secondary btn-md-square rounded-pill text-white mx-1" href="#"><i
                                            class="fas fa-share-alt"></i></a>
                                </div>
                                <div class="team-icon rounded-pill py-2 px-2">
                                    <a class="btn btn-secondary btn-sm-square rounded-pill mx-1"
                                        href="https://www.facebook.com/gritalawrencemichael01"><i
                                            class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-secondary btn-sm-square rounded-pill me-1"
                                        href="https://www.instagram.com/renztasaki/?hl=en"><i
                                            class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            <div class="bg-light rounded-bottom text-center py-4">
                                <h4 class="mb-3">Lawrence L. Grita</h4>
                                <p class="mb-0">Hardware Integrator / Embedded Systems</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Marc -->
                <div class="col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.6s">
                    <div class="team-item p-4">
                        <div class="team-inner rounded">
                            <div class="team-img">
                                <img src="img/marc.jpg" class="img-fluid rounded-top w-100" alt="Marc Jansen V. Santos">
                                <div class="team-share">
                                    <a class="btn btn-secondary btn-md-square rounded-pill text-white mx-1" href="#"><i
                                            class="fas fa-share-alt"></i></a>
                                </div>
                                <div class="team-icon rounded-pill py-2 px-2">
                                    <a class="btn btn-secondary btn-sm-square rounded-pill mx-1"
                                        href="https://www.facebook.com/marc.santos.184881/"><i
                                            class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-secondary btn-sm-square rounded-pill me-1"
                                        href="https://www.instagram.com/mar.cimoo/?hl=en"><i
                                            class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            <div class="bg-light rounded-bottom text-center py-4">
                                <h4 class="mb-3">Marc Jansen V. Santos</h4>
                                <p class="mb-0">UI/UX Designer / Front-End Developer</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Team End -->


    <!-- Testimonial Start -->
    <div class="container-fluid testimonial pb-5">
        <div class="container pb-5">
            <div class="text-center mx-auto pb-5 wow fadeInUp" data-wow-delay="0.2s" style="max-width: 800px;">
                <h4 class="text-uppercase text-primary">Testimonials</h4>
                <h1 class="display-3 text-capitalize mb-3">Our Clients’ Reviews</h1>
            </div>
            <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.3s">

                <!-- Testimonial 1 -->
                <div class="testimonial-item text-center p-4">
                    <p>“Hydrolink made it so much easier for me to track my water intake daily.
                        No more guesswork — I feel healthier and more energized!”</p>
                    <div class="d-flex justify-content-center mb-4">
                        <img src="img/maria.jpg" class="img-fluid border border-4 border-primary"
                            style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover;"
                            alt="Maria Santos">
                    </div>
                    <div class="d-block">
                        <h4 class="text-dark">Maria Santos</h4>
                        <p class="m-0 pb-3">Fitness Coach</p>
                        <div class="d-flex justify-content-center text-secondary">
                            <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                            <i class="fas fa-star"></i><i class="fas fa-star"></i>
                        </div>
                    </div>
                </div>

                <!-- Testimonial 2 -->
                <div class="testimonial-item text-center p-4">
                    <p>“Dati nakakalimutan kong uminom ng tubig sa trabaho.
                        Pero dahil sa Hydrolink refill stations, madali at mabilis na!”</p>
                    <div class="d-flex justify-content-center mb-4">
                        <img src="img/juan.jpg" class="img-fluid border border-4 border-primary"
                            style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover;"
                            alt="Juan Dela Cruz">
                    </div>
                    <div class="d-block">
                        <h4 class="text-dark">Juan Dela Cruz</h4>
                        <p class="m-0 pb-3">Office Worker</p>
                        <div class="d-flex justify-content-center text-secondary">
                            <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                            <i class="fas fa-star"></i><i class="fas fa-star"></i>
                        </div>
                    </div>
                </div>

                <!-- Testimonial 3 -->
                <div class="testimonial-item text-center p-4">
                    <p>“I really love the eco-points feature! Not only do I stay hydrated,
                        but I also feel I’m helping reduce plastic waste.”</p>
                    <div class="d-flex justify-content-center mb-4">
                        <img src="img/angela.jpg" class="img-fluid border border-4 border-primary"
                            style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover;"
                            alt="Angela Reyes">
                    </div>
                    <div class="d-block">
                        <h4 class="text-dark">Angela Reyes</h4>
                        <p class="m-0 pb-3">Environmental Advocate</p>
                        <div class="d-flex justify-content-center text-secondary">
                            <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                            <i class="fas fa-star"></i><i class="fas fa-star"></i>
                        </div>
                    </div>
                </div>

                <!-- Testimonial 4 -->
                <div class="testimonial-item text-center p-4">
                    <p>“Sulit na sulit! Safe, clean, at convenient uminom ng tubig kahit saan.
                        Hydrolink is a game-changer para sa aming pamilya.”</p>
                    <div class="d-flex justify-content-center mb-4">
                        <img src="img/mark.jpg" class="img-fluid border border-4 border-primary"
                            style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover;"
                            alt="Mark Villanueva">
                    </div>
                    <div class="d-block">
                        <h4 class="text-dark">Mark Villanueva</h4>
                        <p class="m-0 pb-3">Family Man</p>
                        <div class="d-flex justify-content-center text-secondary">
                            <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                            <i class="fas fa-star"></i><i class="fas fa-star"></i>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Testimonial End -->



    <!-- Footer Start -->
    <div class="container-fluid footer py-5 wow fadeIn" data-wow-delay="0.2s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="footer-item d-flex flex-column">
                        <div class="footer-item">
                            <h3 class="text-white mb-4"><i
                                    class="fas fa-hand-holding-water text-primary me-3"></i>Hydrolink</h3>
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
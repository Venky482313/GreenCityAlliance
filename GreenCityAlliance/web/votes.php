<?php
require_once("config.php");
if (isset($_POST['submit'])) {
	$consumer = $_POST['consumer'];
	$product = $_POST['product'];
	$vote = $_POST['vote'];
	$timestamp = $_POST['timestamp'];
	$conn->query("insert into `votes` (`ConsumerID`,`ProductID`,`Vote`,`CreatedAt`) values ('$consumer','$product','$vote','$timestamp') ");
	echo ("<script>alert('Saved Successfully');</script>");
	echo ("<script>window.location.href='thankYou.php';</script>");
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>Library management system</title>
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
	<link href="css/styles.css" rel="stylesheet" />
</head>

<body id="page-top">
	<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top"> Business </a>
			<button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu
				<i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="localcouncils.php">Local Councils</a>
					</li>
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="residingareas.php">Residing Areas</a>
					</li>
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="consumers.php">Consumers Details</a>
					</li>
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="businesscategories.php">Business Categories</a>
					</li>
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="greenbusinesses.php">Green Business</a>
					</li>
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="productsservices.php">Product Services</a>
					</li>
					<li class="nav-item mx-0 mx-lg-1">
						<a class="active nav-link py-3 px-0 px-lg-3 rounded" href="votes.php">Cast Votes</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<header class="masthead">
		<div class="container">
			<div class="row">
				<div class="col-md-7 border-left">
					<img src="assets/img/Company-cuate.png" class=" w-100 mt-10" />
				</div>
				<div class="col-md-5">
					<form action="#" class="row" id="contactForm" method="post" enctype="multipart/form-data">
						<h3 class="mt-5">Votes</h3>

						<label>Consumer Name</label>
						<select name="consumer" class="form-control mb-3" required>
							<?php
							$query = $conn->prepare("SELECT * FROM consumers");
							$query->execute();
							$results = $query->fetchAll();
							foreach ($results as $data) {
							?>
								<option value="<?php echo $data['ConsumerId']; ?>"><?php echo $data['Name']; ?></option>
							<?php
							}
							?>
						</select>
						<label>Product Name</label>
						<select name="product" class="form-control mb-3" required>
							<?php
							$query = $conn->prepare("SELECT * FROM productsservices");
							$query->execute();
							$results = $query->fetchAll();
							foreach ($results as $data) {
							?>
								<option value="<?php echo $data['ProductID']; ?>"><?php echo $data['ProductName']; ?></option>
							<?php
							}
							?>
						</select>
						<label>Vote (Yes/No)</label>
						<select name="vote" class="form-control mb-3" required>
							<option value="Yes">Yes</option>
							<option value="No">No</option>
						</select>
						<label>Timestamp</label>
						<input type="datetime-local" name="timestamp" class="form-control mb-3" required />
						<button class="btn btn-primary btn-md mt-3" type="submit" name="submit">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</header>
	<div class="copyright py-4 text-center text-white">
		<div class="container"><small>Copyright &copy; Your Website 2022</small></div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>

</html>
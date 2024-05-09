<!DOCTYPE html>
<?php
require_once("config.php");
?>

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
			<a class="navbar-brand" href="#page-top"> Admin Panel </a>
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
						<a class="active nav-link py-3 px-0 px-lg-3 rounded" href="residingareas.php">Residing Areas</a>
					</li>
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="consumers.php">Consumers Details</a>
					</li>
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="businesscategories.php"> Business Category </a>
					</li>
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="greenbusinesses.php">Green Business</a>
					</li>
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="productsservices.php">Product Services</a>
					</li>
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="votes.php">Cast Votes</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<header class="masthead ">
		<div class="container">
			<div class="table-wrap table-responsive">
				<table class="table table-striped table-bordered">
					<thead class="thead-bg2">
						<tr>
							<th style="width:4%;">S. No.</th>
							<th>Council Name</th>
							<th>Area Name</th>
							<!-- <th style="width:3%;">Edit</th> -->
							<!-- <th style="width:3%;">Delete</th> -->
						</tr>
					</thead>
					<tbody>
						<?php
						$query = $conn->prepare("SELECT * FROM localcouncils as a INNER JOIN residingareas as b ON a.CouncilId = b.LocalCouncilId");
						$query->execute();
						$results = $query->fetchAll();
						$i = 1;
						foreach ($results as $data) {
						?>
							<tr>
								<td class="align-center"> <?php echo $i; ?></td>
								<td> <?php echo $data['CouncilName']; ?></td>
								<td> <?php echo $data['AreaName']; ?></td>
								<!-- <td><a href="#"><i class="edit-icon fa fa-edit" title="Edit"></i></a></td> -->
								<!-- <td><a href="#"><i class="edit-icon fa fa-trash" title="Delete"></i></a></td> -->
							</tr>
						<?php
							$i++;
						}
						?>
					</tbody>
				</table>
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
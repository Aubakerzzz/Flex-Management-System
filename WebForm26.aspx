<%-- NAV BAR CODE  --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm26.aspx.cs" Inherits="WebApp01.WebForm26" %>

<!DOCTYPE html>
<html>
<head>
	<title>navbar</title>
	<style>
		:root {
			--navbar-width: 75px; /* set the default navbar width */
			--button-width: 90%; /* set the default button width */
		}
		
		.navbar {
			background-color: darkgray;
			color: #fff;
			height: 100vh;
			width: var(--navbar-width);
			position: fixed;
			top: 0;
			left: 0%;
			z-index: 1;
			animation: navbar-bg-color 10s infinite;
			transition: width 0.3s ease-in-out;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
		}

		.navbar:hover {
			width: 200px;
			--button-width: 80%; /* adjust the button width when navbar is hovered */
		}

		.navbar-header {
			padding: 20px;
		}

		.navbar-nav {
			list-style: none;
			padding: 0;
			margin: 0;
		}

		.navbar-nav li {
			padding: 10px 0;
		}
		
		.navbar-nav li a:hover {
			cursor: pointer;
		}

		.navbar-nav li a {
			color: gold;
			border-radius: 10px;
			text-decoration: none;
			padding: 10px;
			display: block;
			animation: navbar-button-bg-color 10s infinite;
			transition: background-color 0.3s ease-in-out;
			width: var(--button-width - 10); /* set the button width */
		}

		.navbar-nav li a:hover {
			background-color: #555;
			animation: none;
		}

		@keyframes navbar-bg-color {
			0% { background-color: lightblue; }
			10% { background-color: lightcoral; }
			20% { background-color: black; }
			30% { background-color: orange; }
			40% { background-color: rebeccapurple; }
			50% { background-color: lightblue; }
			60% { background-color: lightcoral; }
			70% { background-color: black; }
			80% { background-color: orange; }
			90% { background-color: rebeccapurple; }
			100% { background-color: lightblue; }
		}

		@keyframes navbar-button-bg-color {
			0% { background-color: white; }
			10% { background-color: lightblue; }
			20% { background-color: lightcoral; }
			30% { background-color: black; }
			40% { background-color: orange; }
			50% { background-color: rebeccapurple; }
			60% { background-color: white; }
			70% { background-color: lightblue; }
			80% { background-color: lightcoral; }
			90% { background-color: black; }
			100% { background-color: orange; }
		}
	</style>
</head>
<body>
	<div class="navbar">
		<div class="navbar-header">
		</div>
		<ul class="navbar-nav">
			<li><a href="#" style="background-color: white;">MARKS</a></li>
			<li><a href="#" style="background-color: white;">TRANS CRIPT</a></li>
			<li><a href="#" style="background-color: white;">CGPA GRAPH</a></li>
			<li><a href="#" style="background-color: white;">ATTEN DANCE</a></li>
		</ul>
	</div>
</body>
</html>

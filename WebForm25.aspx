<%--  REport Generating Page --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm25.aspx.cs" Inherits="WebApp01.WebForm25" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Generates Reports</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
                    <%-- -------------------------------------------- NAVIGATION CODE ---------------------------------- --%>
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
          margin: -10px 0 0 -15px; /* adjust the top and left margin as needed */
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
            padding: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
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
    <style>
        body {
            background-image: url("backgroundsignup2.jpg");
            background-size: cover;
            background-position: center;
            font-family: 'Times New Roman';
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .btn-primary {
            background-color: darkgoldenrod;
            border-color: mediumslateblue;
            color: beige;
            font-size: 16px;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.2s ease-in-out;
            width: 100%; /* Make the button width 100% of its container */
            text-align: center; /* Align the button text to the center */
        }

        .btn-primary:hover {
            background-color: black;
            color: dimgrey;
            animation: shadow-change 5s linear infinite !important
        }

        .btn-primary:focus {
            outline: none;
            box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.4);
        }

        @keyframes blink {
            0% {
                background-color: darkgoldenrod;
            }

            10% {
                background-color: black;
            }

            20% {
                background-color: darkslategrey;
            }

            30% {
                background-color: lightcoral;
            }

            40% {
                background-color: mediumaquamarine;
            }

            50% {
                background-color: darkgray;
            }

            60% {
                background-color: darkcyan;
            }

            70% {
                background-color: forestgreen;
            }

            80% {
                background-color: indianred;
            }

            90% {
                background-color: peru;
            }

            100% {
                background-color: darkgoldenrod;
            }
        }

        .btn-primary-blink {
            animation: blink 2s linear infinite !important;
        }

        .btn-primary-blink:hover {
            animation: none;
            background-color: black;
            color: dimgrey;
        }

        .btn-primary-blink:focus {
            outline: none;
            box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.4);
        }
        @keyframes shadow-change {
            0% {
                box-shadow: 0px 0px 8px 5px gold;
            }

            10% {
                box-shadow: 0px 0px 8px 5px coral;
            }

            20% {
                box-shadow: 0px 0px 8px 5px blueviolet;
            }

            30% {
                box-shadow: 0px 0px 8px 5px aqua;
            }

            40% {
                box-shadow: 0px 0px 8px 5px limegreen;
            }

            50% {
                box-shadow: 0px 0px 8px 5px teal;
            }

            60% {
                box-shadow: 0px 0px 8px 5px tomato;
            }

            70% {
                box-shadow: 0px 0px 8px 5px fuchsia;
            }

            80% {
                box-shadow: 0px 0px 8px 5px navy;
            }

            90% {
                box-shadow: 0px 0px 8px 5px yellowgreen;
            }

            100% {
                box-shadow: 0px 0px 8px 5px gold;
            }
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnExport" runat="server" Text="ATTENDANCE SHEET EXPORT TO PDF" OnClick="ExportToPDF" CssClass="btn btn-primary btn-primary-blink" />
        </div>
        <div>
            <asp:Button ID="Button1" runat="server" Text="EVALUATION SHEET EXPORT TO PDF" OnClick="ExportToPDF1" CssClass="btn btn-primary btn-primary-blink" />
        </div>
        <div>
            <asp:Button ID="Button2" runat="server" Text="GRADE SHEET EXPORT TO PDF" OnClick="ExportToPDF2" CssClass="btn btn-primary btn-primary-blink" />
        </div>
           <div>
            <asp:Button ID="Button4" runat="server" Text="FEEDBACK SHEET EXPORT TO PDF" OnClick="ExportToPDF3" CssClass="btn btn-primary btn-primary-blink" />
        </div>
           <div>
            <asp:Button ID="Button5" runat="server" Text="COUNT_GRADE SHEET EXPORT TO PDF" OnClick="ExportToPDF4" CssClass="btn btn-primary btn-primary-blink" />
        </div>
        <div>
            <asp:HyperLink ID="btnBack" runat="server" Text="Go Back" NavigateUrl="~/WebForm15.aspx" CssClass="btn btn-primary  btn-primary-blink" />

  </div>
</form>
                  <%-- NAV BAR LINKS  --%>
     <div class="navbar">
		<div class="navbar-header">
		</div>
		<ul class="navbar-nav">
			<li><a href="WebForm15.aspx" style="background-color: white;">Marks Distribution</a></li>
			<li><a href="WebForm15.aspx" style="background-color: white;">Manage Attendance</a></li>
			<li><a href="WebForm15.aspx" style="background-color: white;">Manage Evaluations</a></li>
			<li><a href="WebForm15.aspx" style="background-color: white;">Generate Grades</a></li>
            <li><a href="WebForm15.aspx" style="background-color: white;">Generate Reports</a></li>
             <li><a href="WebForm6.aspx" style="background-color: white;">Login</a></li>
             <li><a href="WebForm7.aspx" style="background-color: white;">Signup</a></li>
             <li><a href="MainPage.aspx" style="background-color: white;">Main</a></li>
		</ul>
	</div>
</body>
</html>
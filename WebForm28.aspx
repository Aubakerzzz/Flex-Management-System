<%-- ----------------FACULTY PROFILE HOME----------------- --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm28.aspx.cs" Inherits="WebApp01.WebForm28" %>



<!DOCTYPE html>
<html>
  <head>
    <title>Faculty Profile Home</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
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
			width: 140px;
			position: fixed;
			top: 0;
			left: 0%;
			z-index: 1;
			animation: navbar-bg-color 10s infinite;
			transition: width 0.3s ease-in-out;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            align-items: center;
            justify-content: center;
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
         font-family: 'Times New Roman'; 
       
         }
      h2 {
        margin-top: 0;
        transition: color 0.5s ease-in-out;
      }

      h2:hover {
        color: darkgoldenrod;
      }

      table {
        border-collapse: collapse;
        margin-bottom: 20px;
      }

      td, th {
        border: 1px solid #ddd;
        padding: 8px;
      }

      th {
        text-align: left;
        background-color: #f2f2f2;
      }

      .section-header {
        margin-top: 40px;
        margin-bottom: 20px;
      }

      .section-header h2 {
        font-size: 24px;
      }
      
      .horizontal-table {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        width: 100%;
      }
      
      .horizontal-table td, .horizontal-table th {
        width: 50%;
        white-space: nowrap;
      }
      
      @media only screen and (max-width: 600px) {
        .horizontal-table {
          flex-direction: column;
        }
        
        .horizontal-table td, .horizontal-table th {
          width: 100%;
        }
      }
      
      .center-container {
        display: flex;
        justify-content: center;
      }
      .container {
        color: black;
        width:50%;
        background-color: white;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        align-self: center;
        animation-name: colorchange;
        animation-duration: 5s;
        animation-iteration-count: infinite;
      }

      .right-align {
        margin-left: auto;
      }

      /* Animations */
      .animated {
        animation-name: slideIn;
        animation-duration: 1s;
        animation-fill-mode: forwards;
      }
      @keyframes blink {
          0% {
            color: blue;
          }
          50% {
            color: red;
          }
          100% {
            color: blue;
          }
        }

        .animated {
          animation-name: colorchange;
          animation-duration: 5s;
          animation-iteration-count: infinite;
        }

        .animated-blink {
          animation-name: blink;
          animation-duration: 1s;
          animation-iteration-count: infinite;
        }
        


      @keyframes colorchange {
        0% {
          background-color: darkgray;
        }
        25% {
          background-color: green;
        }
        50% {
          background-color: yellow;
        }
        75% {
          background-color: orange;
        }
        100% {
          background-color: lightcyan;
        }
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
  <div class="center-container">
    <div class="container">
      <h2 class="animated animated-blink">Faculty Profile Home</h2>
      <div class="section-header section-header-animated">
        <h2 class="animated animated-blink">University Information</h2>
        <table class="animated">
          <tbody>
            <tr>
              <td  class="animated animated-blink">ID:</td>
              <td>4545</td>
              <td  class="animated animated-blink">Campus:</td>
              <td>Islamabad</td>
              <td class="animated animated-blink">Status:</td>
              <td>Current</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="animated">
        <h2 class="animated animated-blink">Personal Information</h2>
        <table>
          <tbody>
            <tr>
              <td  class="animated animated-blink">Name:</td>
              <td><%=name %></td>
              <td  class="animated animated-blink">DOB:</td>
              <td><%=DOB %></td>
              <td  class="animated animated-blink">Blood Group:</td>
              <td>-</td>
            </tr>
            <tr>
              <td  class="animated animated-blink">Gender:</td>
              <td><%=gender %></td>
              <td  class="animated animated-blink">CNIC:</td>
              <td><%=CNIC %></td>
              <td  class="animated animated-blink">Nationality:</td>
              <td>Pakistani</td>
            </tr>
            <tr>
              <td  class="animated animated-blink">Email:</td>
              <td><%=email %></td>
              <td  class="animated animated-blink">Mobile No:</td>
              <td><%=phoneNum %></td>
              <td class="animated animated-blink"> Zip-Code</td>
              <td>213255</td>
             
            </tr>
          </tbody>
        </table>
      </div>
      <div class="animated">
        <h2  class="animated animated-blink">Contact Information</h2>
        <table>
          <tbody>
            <tr>
              <td class="animated animated-blink">Permanent:</td>
              <td></td>
              <td class="animated animated-blink" >Current:</td>
              <td></td>
            </tr>
            <tr>
              <td class="animated animated-blink">Address:</td>
              <td><%=address %></td>
              <td class="animated animated-blink">Address:</td>
              <td><%=address %></td>
            </tr>
            <tr>
              <td class="animated animated-blink">Home Phone:</td>
                <td>-</td>
              <td class="animated animated-blink">Home Phone:</td>
              <td>-</td>
            </tr>
            <tr>
              <td class="animated animated-blink">Postal Code:</td>
              <td></td>
              <td class="animated animated-blink">Postal Code:</td>
              <td></td>
            </tr>
            <tr>
              <td class="animated animated-blink">City:</td>
              <td>Islamabad</td>
              <td class="animated animated-blink">City:</td>
              <td>Islamabad</td>
            </tr>
            <tr>
              <td class="animated animated-blink">Country:</td>
              <td>Pakistan</td>
              <td class="animated animated-blink">Country:</td>
              <td>Pakistan</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    </div>
       <%-- NAV BAR LINKS  --%>
     <div class="navbar">
		<div class="navbar-header">
		</div>
		<ul class="navbar-nav">
			<li><a href="WebForm15.aspx?param1=<%=roll %>" style="background-color: white;">Marks Distribution</a></li>
			<li><a href="WebForm15.aspx?param1=<%=roll %>" style="background-color: white;">Manage Attendance</a></li>
			<li><a href="WebForm15.aspx?param1=<%=roll %>" style="background-color: white;">Manage Evaluations</a></li>
			<li><a href="WebForm15.aspx?param1=<%=roll %>" style="background-color: white;">Generate Grades</a></li>
            <li><a href="WebForm15.aspx?param1=<%=roll %>" style="background-color: white;">Generate Reports</a></li>
             <li><a href="WebForm6.aspx" style="background-color: white;">Login</a></li>
             <li><a href="WebForm7.aspx" style="background-color: white;">Signup</a></li>
             <li><a href="MainPage.aspx" style="background-color: white;">Main</a></li>
		</ul>
	</div>
  </body>
</html>
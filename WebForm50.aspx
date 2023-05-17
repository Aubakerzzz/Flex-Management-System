<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm50.aspx.cs" Inherits="WebApp01.WebForm50" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head runat="server">
      <title> Course Options</title>
      <!-- Bootstrap CSS -->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet"/>
      <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
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
       /* styling for buttons */
     .btn-primary {
     background-color: cadetblue;
     border-color: mediumpurple;
     transition: all 0.3s ease-in-out;
     padding: 15px;
     width: 500px; /* Change the value to increase or decrease button width */
     text-align: center;
     margin-top: 0%; /* Move the button down by 10% */
     margin: auto;
     display: block;
     }
     .btn-primary:hover {
     background-color: orange;
     border-color: royalblue;
      animation: shadow-change 5s linear infinite !important
     }
          /* styling for buttons */
     .btn-primary {
     background-color: cadetblue;
     border-color: mediumpurple;
     transition: all 0.3s ease-in-out;
     padding: 15px;
     width: 500px; /* Change the value to increase or decrease button width */
     text-align: center;
     margin-top: 0%; /* Move the button down by 10% */
     margin: auto;
     display: block;
     }
     .btn-primary:hover {
     background-color: orange;
     border-color: royalblue;
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
      <div class="container">
         <div class="row">
            <div class="col-md-12">
                <a href="WebForm51.aspx?param1=<%=roll %>" id="toggle-table1" class="btn btn-primary">Course Allocation</a>
            </div>
         </div>
               <div class="row">
            <div class="col-md-12">
                <a href="WebForm52.aspx" id="toggle-table8" class="btn btn-primary">Report Generation</a>
            </div>
                   </div>
         <div class="row">
            <div class="col-md-12">
                <a href="WebForm41.aspx?param1=<%=roll %>" id="toggle-table7" class="btn btn-primary">Go Back</a>
            </div>
         </div>
      </div>
  <!-- Bootstrap JS -->
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

      <script>
          function navigateToPage(page) {
              switch (page) {
                  case "allocation":
                      window.location.href = "WebForm51.aspx";
                      break;
                  case "back":
                      window.location.href = "WebForm52.aspx";
                      break;
                  default:
                      break;
              }
          }
          function voiceRecognition() {
              let recognition = new (
                  window.SpeechRecognition ||
                  window.webkitSpeechRecognition ||
                  window.mozSpeechRecognition ||
                  window.msSpeechRecognition
              )();
              recognition.lang = "en-US";
              recognition.interimResults = false;
              recognition.maxAlternatives = 1;
              // Listen for specific keywords to start recognition
              const startListening = () => {
                  console.log("Listening for keyword...");
                  recognition.start();
              };
              const keywords = ["allocation", "back",];
              recognition.onresult = function (event) {
                  let input = event.results[0][0].transcript.trim().toLowerCase();
                  console.log("Speech Input: " + input);
                  if (input.includes("allocation")) {
                      navigateToPage("allocation");
                  } else if (input.includes("back")) {
                      navigateToPage("back");
                  }
              };
              recognition.onspeechend = function () {
                  recognition.stop();
              };
              recognition.onerror = function (event) {
                  console.log("Error occurred in recognition: " + event.error);
              };
              // Start listening for keywords
              recognition.onaudiostart = function () {
                  console.log("Audio input started");
              };
              recognition.onaudioend = function () {
                  console.log("Audio input ended");
              };
              recognition.onend = function () {
                  console.log("Recognition ended");
                  // Restart listening for keywords
                  startListening();
              };
              startListening();
          }
          voiceRecognition();
      </script>
        <%-- --------------------------------NAVIGATION BAR-----------------------------  --%>
               <div class="navbar">
		<div class="navbar-header">
		</div>
		<ul class="navbar-nav">
			<li><a href="WebForm50.aspx" style="background-color: white;">Course Allocation</a></li>
            <li><a href="WebForm50.aspx" style="background-color: white;">Create Sections</a></li>
            <li><a href="WebForm50.aspx" style="background-color: white;">Report Generation</a></li>
            <li><a href="WebForm8.aspx" style="background-color: white;">Login</a></li>
            <li><a href="WebForm9.aspx" style="background-color: white;">Signup</a></li>
            <li><a href="MainPage.aspx" style="background-color: white;">Main</a></li>
		</ul>
	</div>
   </body>
</html>
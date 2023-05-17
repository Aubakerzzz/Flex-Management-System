<%-- STUDENT TRANSCRIPT PAGE --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm42.aspx.cs" Inherits="WebApp01.WebForm42" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head runat="server">
      <title>Student Marks</title>
      <!-- Bootstrap CSS -->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet"/>
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
         /* styling for table rows */
         tr:hover {
         background-color: goldenrod;
         transition: all 0.3s ease-in-out;
         }
         /* styling for table headers */
         th {
         background-color: black;
         color: black;
         }
         /* styling for table cells */
         td {
         background-color: burlywood;
         color: darkblue;
         transition: all 0.3s ease-in-out;
         }
         /* styling for alternate table rows */
         tbody tr:nth-child(even) {
         background-color: lightpink;
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
         .font-adjust td,
         .font-adjust th {
         font-size: calc(12px + (14 - 12) * ((100vw - 320px) / (1200 - 320))); /* change 12px and 14px to your desired minimum and maximum font sizes */
         }
         .btn-primary:hover {
         background-color: orange;
         border-color: royalblue;
         animation: shadow-change 5s linear infinite !important
         }
         table, th, td {
         border: 1px solid black;
         border-collapse: collapse;
         }
         th {
         background-color: gray;
         color: white;
         }
         td:nth-child(even) {
         background-color: lightgray;
         }
         td:nth-child(odd) {
         background-color: white;
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
               <button id="toggle-table1" class="btn btn-primary">SEMESTER-I</button>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <table id="usernames-table" class="table table-striped table-bordered font-adjust" style="display: none;">
                  <thead>
                     <tr>
                        <th>Code</th>
                        <th>Course Name</th>
                        <th>Section</th>
                        <th>CrdHrs</th>
                        <th>Grade</th>
                        <th>Type</th>
                     </tr>
                  </thead>
                  <tbody>
                     <% int rowCounter1 = 1; int disp = 1; %>
                     <% foreach (List<string> col in Data) { %>
                     <% if (rowCounter1 > 1) { %>
                     <tr>
                         <% if (Convert.ToInt32(col[4]) == 1) { %>
                        <td><%= disp %></td>
                        <td><%= col[0] %></td>
                        <td><%= col[1] %></td>
                        <td><%= col[2] %></td>
                        <td><%= col[3] %></td>
                        <td><%= col[5] %></td>
                        <td><%= col[6] %></td>
                         <%disp++; %>
                         <% } %>
                     </tr>
                     <% } %>
                     <% rowCounter1++; %>
                     <% } %>
                  </tbody>
               </table>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <button id="toggle-table2" class="btn btn-primary">SEMESTER-II</button>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <table id="usernames-table1" class="table table-striped table-bordered font-adjust" style="display: none;">
                  <thead>
                     <tr>
                        <th>Code</th>
                        <th>Course Name</th>
                        <th>Section</th>
                        <th>CrdHrs</th>
                        <th>Grade</th>
                        <th>Points</th>
                        <th>Type</th>
                        <th>Remarks</th>
                     </tr>
                  </thead>
                  <tbody>
                     <% rowCounter1 = 1; disp = 1; %>
                     <% foreach (List<string> col in Data) { %>
                     <% if (rowCounter1 > 1) { %>
                     <tr>
                         <% if (Convert.ToInt32(col[4]) == 2) { %>
                        <td><%= disp %></td>
                        <td><%= col[0] %></td>
                        <td><%= col[1] %></td>
                        <td><%= col[2] %></td>
                        <td><%= col[3] %></td>
                        <td><%= col[5] %></td>
                        <td><%= col[6] %></td>
                         <%disp++; %>
                         <% } %>
                     </tr>
                     <% } %>
                     <% rowCounter1++; %>
                     <% } %>
                     <tr>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <button id="toggle-table3" class="btn btn-primary">SEMESTER-III</button>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <table id="usernames-table2" class="table table-striped table-bordered font-adjust" style="display: none;">
                  <thead>
                     <tr>
                        <th>Code</th>
                        <th>Course Name</th>
                        <th>Section</th>
                        <th>CrdHrs</th>
                        <th>Grade</th>
                        <th>Points</th>
                        <th>Type</th>
                        <th>Remarks</th>
                     </tr>
                  </thead>
                  <tbody>
                     <% rowCounter1 = 1;  disp = 1; %>
                     <% foreach (List<string> col in Data) { %>
                     <% if (rowCounter1 > 1) { %>
                     <tr>
                         <% if (Convert.ToInt32(col[4]) == 3) { %>
                        <td><%= disp %></td>
                        <td><%= col[0] %></td>
                        <td><%= col[1] %></td>
                        <td><%= col[2] %></td>
                        <td><%= col[3] %></td>
                        <td><%= col[5] %></td>
                        <td><%= col[6] %></td>
                         <%disp++; %>
                         <% } %>
                     </tr>
                     <% } %>
                     <% rowCounter1++; %>
                     <% } %>
                  </tbody>
               </table>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <button id="toggle-table4" class="btn btn-primary">SEMESTER-IV</button>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <table id="usernames-table3" class="table table-striped table-bordered font-adjust" style="display: none;">
                  <thead>
                     <tr>
                        <th>Code</th>
                        <th>Course Name</th>
                        <th>Section</th>
                        <th>CrdHrs</th>
                        <th>Grade</th>
                        <th>Points</th>
                        <th>Type</th>
                        <th>Remarks</th>
                     </tr>
                  </thead>
                  <tbody>
                     <% rowCounter1 = 1; disp = 1; %>
                     <% foreach (List<string> col in Data) { %>
                     <% if (rowCounter1 > 1) { %>
                     <tr>
                         <% if (Convert.ToInt32(col[4]) == 4) { %>
                        <td><%= disp %></td>
                        <td><%= col[0] %></td>
                        <td><%= col[1] %></td>
                        <td><%= col[2] %></td>
                        <td><%= col[3] %></td>
                        <td><%= col[5] %></td>
                        <td><%= col[6] %></td>
                         <%disp++; %>
                         <% } %>
                     </tr>
                     <% } %>
                     <% rowCounter1++; %>
                     <% } %>
                  </tbody>
               </table>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <button id="toggle-table5" class="btn btn-primary">SEMESTER-V</button>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <table id="usernames-table4" class="table table-striped table-bordered font-adjust" style="display: none;">
                  <thead>
                     <tr>
                        <th>Code</th>
                        <th>Course Name</th>
                        <th>Section</th>
                        <th>CrdHrs</th>
                        <th>Grade</th>
                        <th>Points</th>
                        <th>Type</th>
                        <th>Remarks</th>
                     </tr>
                  </thead>
                  <tbody>
                     <% rowCounter1 = 1; disp = 1; %>
                     <% foreach (List<string> col in Data) { %>
                     <% if (rowCounter1 > 1) { %>
                     <tr>
                         <% if (Convert.ToInt32(col[4]) == 5) { %>
                        <td><%= disp %></td>
                        <td><%= col[0] %></td>
                        <td><%= col[1] %></td>
                        <td><%= col[2] %></td>
                        <td><%= col[3] %></td>
                        <td><%= col[5] %></td>
                        <td><%= col[6] %></td>
                         <%disp++; %>
                         <% } %>
                     </tr>
                     <% } %>
                     <% rowCounter1++; %>
                     <% } %>
                  </tbody>
               </table>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <button id="toggle-table6" class="btn btn-primary">SEMESTER-VI</button>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <table id="usernames-table5" class="table table-striped table-bordered font-adjust" style="display: none;">
                  <thead>
                     <tr>
                        <th>Code</th>
                        <th>Course Name</th>
                        <th>Section</th>
                        <th>CrdHrs</th>
                        <th>Grade</th>
                        <th>Points</th>
                        <th>Type</th>
                        <th>Remarks</th>
                     </tr>
                  </thead>
                  <tbody>
                     <% rowCounter1 = 1; disp = 1; %>
                     <% foreach (List<string> col in Data) { %>
                     <% if (rowCounter1 > 1) { %>
                     <tr>
                         <% if (Convert.ToInt32(col[4]) == 6) { %>
                        <td><%= disp %></td>
                        <td><%= col[0] %></td>
                        <td><%= col[1] %></td>
                        <td><%= col[2] %></td>
                        <td><%= col[3] %></td>
                        <td><%= col[5] %></td>
                        <td><%= col[6] %></td>
                         <%disp++; %>
                         <% } %>
                     </tr>
                     <% } %>
                     <% rowCounter1++; %>
                     <% } %>
                  </tbody>
               </table>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <button id="toggle-table7" class="btn btn-primary">SEMESTER-VII</button>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <table id="usernames-table6" class="table table-striped table-bordered font-adjust" style="display: none;">
                  <thead>
                     <tr>
                        <th>Code</th>
                        <th>Course Name</th>
                        <th>Section</th>
                        <th>CrdHrs</th>
                        <th>Grade</th>
                        <th>Points</th>
                        <th>Type</th>
                        <th>Remarks</th>
                     </tr>
                  </thead>
                  <tbody>
                     <% rowCounter1 = 1; disp = 1; %>
                     <% foreach (List<string> col in Data) { %>
                     <% if (rowCounter1 > 1) { %>
                     <tr>
                         <% if (Convert.ToInt32(col[4]) == 7) { %>
                        <td><%= disp %></td>
                        <td><%= col[0] %></td>
                        <td><%= col[1] %></td>
                        <td><%= col[2] %></td>
                        <td><%= col[3] %></td>
                        <td><%= col[5] %></td>
                        <td><%= col[6] %></td>
                         <%disp++; %>
                         <% } %>
                     </tr>
                     <% } %>
                     <% rowCounter1++; %>
                     <% } %>
                  </tbody>
               </table>
            </div>
         </div>

         <div class="row">
            <div class="col-md-12">
               <button id="toggle-table8" class="btn btn-primary">SEMESTER-VII</button>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <table id="usernames-table7" class="table table-striped table-bordered font-adjust" style="display: none;">
                  <thead>
                     <tr>
                        <th>Code</th>
                        <th>Course Name</th>
                        <th>Section</th>
                        <th>CrdHrs</th>
                        <th>Grade</th>
                        <th>Points</th>
                        <th>Type</th>
                        <th>Remarks</th>
                     </tr>
                  </thead>
                  <tbody>
                     <% rowCounter1 = 1; disp = 1; %>
                     <% foreach (List<string> col in Data) { %>
                     <% if (rowCounter1 > 1) { %>
                     <tr>
                         <% if (Convert.ToInt32(col[4]) == 8) { %>
                        <td><%= disp %></td>
                        <td><%= col[0] %></td>
                        <td><%= col[1] %></td>
                        <td><%= col[2] %></td>
                        <td><%= col[3] %></td>
                        <td><%= col[5] %></td>
                        <td><%= col[6] %></td>
                         <%disp++; %>
                         <% } %>
                     </tr>
                     <% } %>
                     <% rowCounter1++; %>
                     <% } %>
                  </tbody>
               </table>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <a href="WebForm18.aspx" class="btn btn-primary">Go Back</a>
            </div>
         </div>
      </div>
      <!-- Bootstrap JS -->
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <script>
         $(document).ready(function () {
             $("#toggle-table1").click(function () {
                 $("#usernames-table").toggle();
             });
             $("#toggle-table2").click(function () {
                 $("#usernames-table1").toggle();
             });
             $("#toggle-table3").click(function () {
                 $("#usernames-table2").toggle();
             });
             $("#toggle-table4").click(function () {
                 $("#usernames-table3").toggle();
             });
             $("#toggle-table5").click(function () {
                 $("#usernames-table4").toggle();
             });
             $("#toggle-table6").click(function () {
                 $("#usernames-table5").toggle();
             });
             $("#toggle-table7").click(function () {
                 $("#usernames-table6").toggle();
             });
             $("#toggle-table8").click(function () {
                 $("#usernames-table7").toggle();
             });
         });
      </script>
      <script>
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
              const keywords = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth","back"];
              recognition.onresult = function (event) {
                  let input = event.results[0][0].transcript.trim().toLowerCase();
                  console.log("Speech Input: " + input);
                  if (input.includes(keywords[0])) {
                      let button = document.getElementById("toggle-table1");
                      if (button) {
                          button.click();
                      }
                  }
                  else if (input.includes(keywords[1])) {
                      let button = document.getElementById("toggle-table2");
                      if (button) {
                          button.click();
                      }
                  }
                  else if (input.includes(keywords[2])) {
                      let button = document.getElementById("toggle-table3");
                      if (button) {
                          button.click();
                      }
                  }
                  else if (input.includes(keywords[3])) {
                      let button = document.getElementById("toggle-table4");
                      if (button) {
                          button.click();
                      }
                  }
                  else if (input.includes(keywords[4])) {
                      let button = document.getElementById("toggle-table5");
                      if (button) {
                          button.click();
                      }
                  }
                  else if (input.includes(keywords[5])) {
                      let button = document.getElementById("toggle-table6");
                      if (button) {
                          button.click();
                      }
                  }
                  else if (input.includes(keywords[6])) {
                      let button = document.getElementById("toggle-table7");
                      if (button) {
                          button.click();
                      }
                  }
                  else if (input.includes(keywords[7])) {
                      let button = document.getElementById("toggle-table8");
                      if (button) {
                          button.click();
                      }
                  }
                  else if (input.includes(keywords[8])) {
                      window.location.href = "WebForm18.aspx";
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
			<li><a href="WebForm18.aspx" style="background-color: white;">Course Registration</a></li>
			<li><a href="WebForm18.aspx" style="background-color: white;">Evaluation Marks</a></li>
			<li><a href="WebForm18.aspx" style="background-color: white;">CGPAs GRAPH</a></li>
			<li><a href="WebForm18.aspx" style="background-color: white;">Feedback Form</a></li>
			<li><a href="WebForm18.aspx" style="background-color: white;">ATTEN DANCE</a></li>
			<li><a href="WebForm18.aspx" style="background-color: white;">Transcript</a></li>
            <li><a href="WebForm1.aspx" style="background-color: white;">Login</a></li>
            <li><a href="WebForm2.aspx" style="background-color: white;">Signup</a></li>
            <li><a href="MainPage.aspx" style="background-color: white;">Main</a></li>
		</ul>
	</div>
   </body>
</html>
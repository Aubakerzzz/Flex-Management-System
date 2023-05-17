<%-- Teacher Evaluation Page Of Quizes--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm19.aspx.cs" Inherits="WebApp01.WebForm19" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head runat="server">
      <title>Attendance Records</title>
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
         .submit-container {
         display: flex;
         justify-content: center;
         margin-top: 10px;
         }
         .submit-button {
         background-color: dimgrey; 
         border: none;
         color: white;
         padding: 8px 14px;
         text-align: center;
         text-decoration: none;
         display: inline-block;
         font-size: 14px;
         cursor: pointer;
         border-radius: 3px;
         }
         .submit-button:hover {
         background-color: goldenrod;
         }
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
               <button id="toggle-table1" class="btn btn-primary">QUIZES</button>
               <button id="toggle-table2" class="btn btn-primary" style="display:none;">Quiz-I</button>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <form id="quiz-form" style="display:none;" action="WebForm1.aspx?">
                  <table id="usernames-table" class="table table-striped table-bordered font-adjust" style="width: 50%; margin: 0 auto;">
                     <thead>
                        <tr>
                           <th>Student No</th>
                           <th>Name</th>
                           <th>Quiz-I Marks</th>
                        </tr>
                     </thead>
                     <tbody>
                        <% int rowCounter1 = 1; %>
                        <% for (int i = 0; i < 15; i++) { %>
                         <%string[] col = Data[i]; %>
                        <% if (rowCounter1 > 1) { %>
                        <tr>
                           <td><%=col[0] %></td>
                           <td><%= col[1] %></td>
                           <td><input type="text" maxlength="2" name="Presence_<%=rowCounter1 - 1 %>" /></td>
                        </tr>
                        <% } %>
                        <% rowCounter1++; %>
                        <% } %>

                        <tr>
                            <td> </td>
                            <td>Enter Total Marks: </td>
                            <td><input type="text" maxlength="2" name="Totalmarks" /></td>
                        </tr>
                         
                     </tbody>

                  </table>
                  <div class="submit-container">
                      <input type="hidden" name="param1=" value="<%=roll %>" />
                      <input type="hidden" name="param2=" value="<%=Ccode %>" />
                      <input type="hidden" name="param3=" value="<%=secID %>" />
                      <input type="hidden" name="param4=" value="Quiz" />
                      <input type="hidden" name="param5=" value="1" />
                      <input type="hidden" name="param6=" value="<%=Data[0][2] %>" />

                      <% for (int i = 0; i < 15; i++) {  %>
                            <input type="hidden" name="roll_<%= i + 1 %>=" value="<%=Data[i][0] %>" />
                      <% } %>

                     <button type="submit" class="submit-button" >Submit</button>
                  </div>
               </form>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <button id="toggle-table3" class="btn btn-primary" style="display:none;">Quiz-II</button>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <form id="quiz-form1" style="display:none;" action="WebForm1.aspx?">
                  <table id="usernames-table1" class="table table-striped table-bordered font-adjust" style="width: 50%; margin: 0 auto;">
                     <thead>
                        <tr>
                           <th>Student No</th>
                           <th>Name</th>
                           <th>Quiz-II Marks</th>
                        </tr>
                     </thead>
                     <tbody>
                        <% int rowCounter2 = 1; %>
                        <% for (int i = 0; i < 15; i++) { %>
                         <%string[] col = Data[i]; %>
                        <% if (rowCounter2 > 1) { %>
                        <tr>
                           <td><%=col[0] %></td>
                           <td><input type="text" maxlength="1" name="Presence_<%=rowCounter2 - 1 %>" /></td>
                        </tr>
                        <% } %>
                        <% rowCounter2++; %>
                        <% } %>

                        <tr>
                            <td> </td>
                            <td>Enter Total Marks: </td>
                            <td><input type="text" maxlength="2" name="Totalmarks" /></td>
                        </tr>

                     </tbody>
                  </table>
                  <div class="submit-container">
                      <input type="hidden" name="param1=" value="<%=roll %>" />
                      <input type="hidden" name="param2=" value="<%=Ccode %>" />
                      <input type="hidden" name="param3=" value="<%=secID %>" />
                      <input type="hidden" name="param4=" value="Quiz" />
                      <input type="hidden" name="param5=" value="2" />
                      <input type="hidden" name="param6=" value="<%=Data[0][2] %>" />

                      <% for (int i = 0; i < 15; i++) {  %>
                            <input type="hidden" name="roll_<%= i + 1 %>=" value="<%=Data[i][0] %>" />
                      <% } %>

                     <button type="submit" class="submit-button" >Submit</button>
                  </div>
               </form>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <button id="toggle-table4" class="btn btn-primary" style="display:none;">Quiz-III</button>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <form id="quiz-form2" style="display:none;" action="WebForm1.aspx?">
                  <table id="usernames-table2" class="table table-striped table-bordered font-adjust" style="width: 50%; margin: 0 auto;">
                     <thead>
                        <tr>
                           <th>Student No</th>
                           <th>Name</th>
                           <th>Quiz-II Marks</th>
                        </tr>
                     </thead>
                     <tbody>
                        <% rowCounter2 = 1; %>
                       <% for (int i = 0; i < 15; i++) { %>
                         <%string[] col = Data[i]; %>
                        <% if (rowCounter2 > 1) { %>
                        <tr>
                           <td><%=col[0] %></td>
                           <td><input type="text" maxlength="1" name="Presence_<%=rowCounter2 - 1 %>" /></td>
                        </tr>
                        <% } %>
                        <% rowCounter2++; %>
                        <% } %>

                         <tr>
                            <td> </td>
                            <td>Enter Total Marks: </td>
                            <td><input type="text" maxlength="2" name="Totalmarks" /></td>
                        </tr>
                     </tbody>
                  </table>
                  <div class="submit-container">
                     <input type="hidden" name="param1=" value="<%=roll %>" />
                      <input type="hidden" name="param2=" value="<%=Ccode %>" />
                      <input type="hidden" name="param3=" value="<%=secID %>" />
                      <input type="hidden" name="param4=" value="Quiz" />
                      <input type="hidden" name="param5=" value="3" />
                      <input type="hidden" name="param6=" value="<%=Data[0][2] %>" />

                      <% for (int i = 0; i < 15; i++) {  %>
                            <input type="hidden" name="roll_<%= i + 1 %>=" value="<%=Data[i][0] %>" />
                      <% } %>

                     <button type="submit" class="submit-button" >Submit</button>
                  </div>
               </form>
               <div class="row">
                  <div class="col-md-12">
                     <a href="WebForm20.aspx?param1=<%=Ccode %>&param2=<%=secID %>&param3=<%=roll %>" class="btn btn-primary">Go Back</a>
                  </div>
               </div>
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
                 $("#toggle-table2").toggle();
                 $("#toggle-table3").toggle();
                 $("#toggle-table4").toggle();
                 $("#quiz-form").hide();
             });
         
             $("#toggle-table2").click(function () {
                 if ($("#quiz-form").is(":visible")) {
                     $("#usernames-table").hide();
                     $("#quiz-form").hide();
                 } else {
                     $("#usernames-table").show();
                     $("#quiz-form").show();
                 }
             });
             $("#toggle-table3").click(function () {
                 if ($("#quiz-form1").is(":visible")) {
                     $("#usernames-table1").hide();
                     $("#quiz-form1").hide();
                 } else {
                     $("#usernames-table1").show();
                     $("#quiz-form1").show();
                 }
             });
             $("#toggle-table4").click(function () {
                 if ($("#quiz-form2").is(":visible")) {
                     $("#usernames-table2").hide();
                     $("#quiz-form2").hide();
                 } else {
                     $("#usernames-table2").show();
                     $("#quiz-form2").show();
                 }
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
              const keywords = ["quizes", "back"];
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
                      window.location.href = "WebForm20.aspx";
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
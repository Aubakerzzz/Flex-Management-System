<%-- SET DISTRIBUTION WEIGHTAGES OF SPECIFIC SUBJECT --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm17.aspx.cs" Inherits="WebApp01.WebForm17" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head runat="server">
      <!-- Bootstrap CSS -->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet"/>
      <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
      <title>Course Evaluation</title>
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
			width: 112px;
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
         .container {
         margin-top: 50px;
         background-color: #f2f2f2;
         border-radius: 5px;
         padding: 20px;
         transition: background-color 0.5s ease-out;
         box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
         animation: slide-up 0.5s ease-out;
         animation-fill-mode: forwards;
         animation: colorChange 10s infinite;
         }
         @keyframes slide-up {
         0% { transform: translateY(50px); opacity: 0; }
         100% { transform: translateY(0); opacity: 1; }
         }
         @keyframes fade-in {
         0% { opacity: 0; }
         100% { opacity: 1; }
         }
         @keyframes colorChange {
         0% {
         background-color: lightcoral;
         }
         25% {
         background-color: #FFFF00;
         }
         50% {
         background-color: #00FF00;
         }
         75% {
         background-color: #00FFFF;
         }
         100% {
         background-color: dimgrey;
         }
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
         background-color: dodgerblue;
         }
         .container:hover {
         background-color: goldenrod;
         }
         table {
         border-collapse: collapse;
         width: 100%;
         }
         th, td {
         text-align: left;
         padding: 8px;
         border-bottom: 1px solid #ddd;
         }
         th {
         background-color: #4CAF50;
         color: white;
         }
         input[type=number] {
         width: 70px;
         padding: 5px;
         border: none;
         text-align: center;
         }
         button {
         margin-top: 20px;
         padding: 10px 20px;
         background-color: #4CAF50;
         border: none;
         color: white;
         font-size: 16px;
         border-radius: 5px;
         cursor: pointer;
         transition: background-color 0.5s ease-out;
         }
         button:hover {
         background-color: #2e8b57;
         }
         .alert {
         margin-top: 20px;
         padding: 20px;
         border-radius: 5px;
         font-size: 16px;
         }
         .alert-success {
         background-color: #dff0d8;
         color: #3c763d;
         border: 1px solid #d6e9c6;
         }
         .alert-danger {
         background-color: #f2dede;
         color: #a94442;
         border: 1px solid #ebccd1;
         }
      </style>
   </head>
   <body>
      <div class="container">
         <h1 style="color: darkcyan;">Course Evaluation</h1>
         <p>Course: CS<%=Ccode %> </p>
         <p>Section: <%=Section %></p>
         <p><strong>NOTE!</strong> To Remove Evaluation insert Zero</p>
         <p>Already saved press save to update</p>
         <table>
            <thead>
               <tr>
                  <th>Sr#</th>
                  <th>Evaluation Name</th>
                  <th>Weightage</th>
                  <th>Range</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td>1</td>
                  <td>Assignment</td>
                  <td><input type="number" min="0" max="100" placeholder="%" name="assignment" /></td>
                  <td>Range: 0 to 100</td>
               </tr>
               <tr>
                  <td>2</td>
                  <td>Quiz</td>
                  <td><input type="number" min="0" max="100" placeholder="%" name="quiz" /></td>
                  <td>Range: 0 to 100</td>
               </tr>
               <tr>
                  <td>3</td>
                  <td>Sessional-I</td>
                  <td><input type="number" min="0" max="100" placeholder="%" name="sessional1"/></td>
                  <td>Range: 0 to 100</td>
               </tr>
               <tr>
                  <td>4</td>
                  <td>Sessional-II</td>
                  <td><input type="number" min="0" max="100" placeholder="%" name="sessional2" /></td>
                  <td>Range: 0 to 100</td>
               </tr>
               <tr>
                  <td>5</td>
                  <td>Finals</td>
                  <td><input type="number" min="0" max="100" placeholder="%" name="final" /></td>
                  <td>Range: 0 to 100</td>
               </tr>
            </tbody>
         </table>
         <p id="error-message" style="color: red; display: none;">Total weightage cannot be less/more than 100.</p>
          <form runat="server">
         <div class="submit-container">
             <asp:Button runat="server" cssClass="submit-button" OnClick="submit_Click" text="Submit" />
         </div>  
          </form>
               <div class="row">
            <div class="col-md-12">
                <a href="WebForm16.aspx" id="toggle-table7" class="btn btn-primary">Go Back</a>
            </div>
         </div>
      </div>
         <script>
             function navigateToPage(page) {
                 switch (page) {
                     case "back":
                         window.location.href = "WebForm16.aspx";
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
                 const keywords = ["back"];
                 recognition.onresult = function (event) {
                     let input = event.results[0][0].transcript.trim().toLowerCase();
                     console.log("Speech Input: " + input);
                    if (input.includes("back")) {
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
      <script>
          const rangeInputs = document.querySelectorAll('input[type="number"]');
          const errorMessage = document.getElementById('error-message');

          rangeInputs.forEach(input => {
              input.addEventListener('input', () => {
                  if (input.value > 100) {
                      input.value = 100;
                  }
                  if (input.value < 0) {
                      input.value = 0;
                  }

                  let sum = 0;
                  rangeInputs.forEach(input => {
                      sum += parseInt(input.value || 0);
                  });

                  if (sum > 100 || sum < 100) {
                      errorMessage.style.display = 'block';
                      document.querySelector('.submit-button').disabled = true;
                  } else {
                      errorMessage.style.display = 'none';
                      document.querySelector('.submit-button').disabled = false;
                  }
              });
          });
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
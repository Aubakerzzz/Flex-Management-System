<%-- Teacher Feedback Form by Students --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="WebApp01.WebForm4" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Teachers Assessment Form</title>
      <!-- Bootstrap CSS -->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet"/>
      <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
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
		    width: 90px;
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
			/*--button-width: 1000%*/ /* adjust the button width when navbar is hovered */
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
      <script>
          $(function () {
              $("#datepicker").datepicker({
                  onSelect: function (dateText, inst) {
                      $("#datepicker").val(dateText);
                  }
              });

              $("#datepicker-icon").click(function () {
                  $("#datepicker").datepicker("show");
              });
          });
      </script>
      <style>
         body {
         background-image: url("backgroundsignup2.jpg");
         font-family: Times New Roman, serif;
         }
         label {
         font-size: 1em;
         margin-bottom: 0.5em;
         display: block;
         }
         input[type="text"] {
         font-size: 1.2em;
         padding: 0.5em;
         border: 1px solid #ccc;
         border-radius: 5px;
         background-color: darkgray;
         box-shadow: 0 0 5px #ccc;
         background-color: darkgray;
         }
         input[type="text"]:hover {
         border-color: #888;
         box-shadow: 0 0 5px #888;
         background-color : lightslategray
         }
         .center {
         text-align: center;
         }
         .my-button {
         background-color: black; /* Set the background color */
         color: white; /* Set the text color */
         padding: 12px 24px; /* Add some padding */
         text-align: center; /* Center the text */
         text-decoration: none; /* Remove the underline */
         display: inline-block; /* Set the display to inline-block */
         font-size: 16px; /* Set the font size */
         border-radius: 5px; /* Add some border radius */
         cursor: pointer; /* Change the cursor to a pointer */
         transition: background-color 0.3s ease; /* Add a transition effect */
         }
         .my-button:hover {
         background-color: dimgrey; /* Change the background color on hover */
         }
         #ui-datepicker-div {
         font-size: 1em;
         }
         .datepicker-icon {
         display: inline-block;
         width: 40px;
         height: 40px;
         margin-left: 10px;
         margin-bottom: -15px;
         background-image: url('calendar.ico');
         background-size: cover;
         cursor: pointer;
         }
         .container {
         max-width: 600px;
         margin: 0 auto;
         padding: 1em;
         background-color: darkgoldenrod;
         border-radius: 10px;
         }
      </style>
   </head>
   <body>
      <div class="container">
         <h1>Teachers Assessment Form</h1>
         <hr>
         <form id ="myForm" method ="post" action="WebForm54.aspx">
            <div style=" display:flex; flex-direction:column; align-items:center;">
               <label for="datepicker">Date:</label>
               <div style="display:flex; flex-direction: row; align-items:center">
                  <input style="width:210px" type="text" id="datepicker" name="date" placeholder="mm-dd-yyyy"required>
                  <span class="datepicker-icon" id="datepicker-icon"></span>
               </div>
               <label for="teacher_name">Teacher Name:</label>
               <label for="first_name">First Name:</label>
               <input type="text" id="first_name" name="first_name"placeholder="Enter Teachers First Name"required>
               <label for="last_name">Last Name:</label>
               <input type="text" id="last_name" name="last_name"placeholder="Enter Teachers Last Name"required>
               <label for="subject">Subject:</label>
               <input type="text" id="subject" name="subject" placeholder="Enter Course Code Of Subject"required>
               <label for="room_number">Room Number:</label>
               <input type="text" id="room_number" name="teach_ID"placeholder="Enter Teacher ID"required>

            </div>
            <div style="background-color: lightgray;margin-top : 10px; padding: 10px; margin-bottom: -5px;">
               <p><strong>Please fill out the form in evaluating your instructor for the semester. After completion, please press the submit button.</strong></p>
               <p><strong>For reference, the metrics are as follows:</strong></p>
               <ul>
                  <li>1 - Poor</li>
                  <li>2 - Below Average</li>
                  <li>3 - Average</li>
                  <li>4 - Good</li>
                  <li>5 - Excellent</li>
               </ul>
            </div>
            <div style="background-color: lightgray; margin-top: 10px; padding: 10px;">
               <p><strong>Appearance and Personal Presentation*</strong></p>
               <table style="width: 100%;">
                  <tr>
                     <td></td>
                     <td style="text-align: center; font-weight: bold;">1</td>
                     <td style="text-align: center; font-weight: bold;">2</td>
                     <td style="text-align: center; font-weight: bold;">3</td>
                     <td style="text-align: center; font-weight: bold;">4</td>
                     <td style="text-align: center; font-weight: bold;">5</td>
                  </tr>
                  <tr>
                     <td>Teacher attends class in a well presentable manner*</td>
                     <td style="text-align: center;"><input type="radio" name="appearance0" value="1"></td>
                     <td style="text-align: center;"><input type="radio" name="appearance0" value="2"></td>
                     <td style="text-align: center;"><input type="radio" name="appearance0" value="3"></td>
                     <td style="text-align: center;"><input type="radio" name="appearance0" value="4"></td>
                     <td style="text-align: center;"><input type="radio" name="appearance0" value="5"></td>
                  </tr>
                  <tr>
                     <td>Teacher shows enthusiasm when teaching in class*</td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm0" value="1"></td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm0" value="2"></td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm0" value="3"></td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm0" value="4"></td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm0" value="5"></td>
                  </tr>
                  <tr>
                     <td>Teacher is well articulated and shows full knowledge of the subject in teaching*</td>
                     <td style="text-align: center;"><input type="radio" name="initiative0" value="1"></td>
                     <td style="text-align: center;"><input type="radio" name="initiative0" value="2"></td>
                     <td style="text-align: center;"><input type="radio" name="initiative0" value="3"></td>
                     <td style="text-align: center;"><input type="radio" name="initiative0" value="4"></td>
                     <td style="text-align: center;"><input type="radio" name="initiative0" value="5"></td>
                  </tr>
                  <tr>
                     <td>Teacher speaks loud and clear enough to be heard by the whole class*</td>
                     <td style="text-align: center;"><input type="radio" name="knowledge0" value="1"></td>
                     <td style="text-align: center;"><input type="radio" name="knowledge0" value="2"></td>
                     <td style="text-align: center;"><input type="radio" name="knowledge0" value="3"></td>
                     <td style="text-align: center;"><input type="radio" name="knowledge0" value="4"></td>
                     <td style="text-align: center;"><input type="radio" name="knowledge0" value="5" /></td>
                  </tr>
               </table>
            </div>
            <div style="background-color: lightgray; margin-top: 10px; padding: 10px;">
               <p><strong>Professional Practices *</strong></p>
               <table style="width: 100%;">
                  <tr>
                     <td></td>
                     <td style="text-align: center; font-weight: bold;">1</td>
                     <td style="text-align: center; font-weight: bold;">2</td>
                     <td style="text-align: center; font-weight: bold;">3</td>
                     <td style="text-align: center; font-weight: bold;">4</td>
                     <td style="text-align: center; font-weight: bold;">5</td>
                  </tr>
                  <tr>
                     <td>Teacher shows professionalism in class*</td>
                     <td style="text-align: center;"><input type="radio" name="appearance1" value="1"></td>
                     <td style="text-align: center;"><input type="radio" name="appearance1" value="2"></td>
                     <td style="text-align: center;"><input type="radio" name="appearance1" value="3"></td>
                     <td style="text-align: center;"><input type="radio" name="appearance1" value="4"></td>
                     <td style="text-align: center;"><input type="radio" name="appearance1" value="5"></td>
                  </tr>
                  <tr>
                     <td>Teacher shows commitment to teaching the class*</td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm1" value="1"></td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm1" value="2"></td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm1" value="3"></td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm1" value="4"></td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm1" value="5"></td>
                  </tr>
                  <tr>
                     <td>Teacher encourages students to engage in class discussions and ask questions*</td>
                     <td style="text-align: center;"><input type="radio" name="initiative1" value="1"></td>
                     <td style="text-align: center;"><input type="radio" name="initiative1" value="2"></td>
                     <td style="text-align: center;"><input type="radio" name="initiative1" value="3"></td>
                     <td style="text-align: center;"><input type="radio" name="initiative1" value="4"></td>
                     <td style="text-align: center;"><input type="radio" name="initiative1" value="5"></td>
                  </tr>
                  <tr>
                     <td>Teacher handles criticisms and suggestions professionally*</td>
                     <td style="text-align: center;"><input type="radio" name="knowledge1" value="1"></td>
                     <td style="text-align: center;"><input type="radio" name="knowledge1" value="2"></td>
                     <td style="text-align: center;"><input type="radio" name="knowledge1" value="3"></td>
                     <td style="text-align: center;"><input type="radio" name="knowledge1" value="4"></td>
                     <td style="text-align: center;"><input type="radio" name="knowledge1" value="5" /></td>
                  </tr>
               </table>
            </div>
            <div style="background-color: lightgray; margin-top: 10px; padding: 10px;">
               <p><strong>Teaching Methods*</strong></p>
               <table style="width: 100%;">
                  <tr>
                     <td></td>
                     <td style="text-align: center; font-weight: bold;">1</td>
                     <td style="text-align: center; font-weight: bold;">2</td>
                     <td style="text-align: center; font-weight: bold;">3</td>
                     <td style="text-align: center; font-weight: bold;">4</td>
                     <td style="text-align: center; font-weight: bold;">5</td>
                  </tr>
                  <tr>
                     <td>Teacher shows well rounded knowledge over the subject matter*</td>
                     <td style="text-align: center;"><input type="radio" name="appearance2" value="1"></td>
                     <td style="text-align: center;"><input type="radio" name="appearance2" value="2"></td>
                     <td style="text-align: center;"><input type="radio" name="appearance2" value="3"></td>
                     <td style="text-align: center;"><input type="radio" name="appearance2" value="4"></td>
                     <td style="text-align: center;"><input type="radio" name="appearance2" value="5"></td>
                  </tr>
                  <tr>
                     <td>Teacher has organized the lesson conducive for easy understanding of students*</td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm2" value="1"></td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm2" value="2"></td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm2" value="3"></td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm2" value="4"></td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm2" value="5"></td>
                  </tr>
                  <tr>
                     <td>Teacher shows dynamism and enthusiasm*</td>
                     <td style="text-align: center;"><input type="radio" name="initiative2" value="1"></td>
                     <td style="text-align: center;"><input type="radio" name="initiative2" value="2"></td>
                     <td style="text-align: center;"><input type="radio" name="initiative2" value="3"></td>
                     <td style="text-align: center;"><input type="radio" name="initiative2" value="4"></td>
                     <td style="text-align: center;"><input type="radio" name="initiative2" value="5"></td>
                  </tr>
                  <tr>
                     <td>Teacher stimulates the critical thinking of students*</td>
                     <td style="text-align: center;"><input type="radio" name="knowledge2" value="1"></td>
                     <td style="text-align: center;"><input type="radio" name="knowledge2" value="2"></td>
                     <td style="text-align: center;"><input type="radio" name="knowledge2" value="3"></td>
                     <td style="text-align: center;"><input type="radio" name="knowledge2" value="4"></td>
                     <td style="text-align: center;"><input type="radio" name="knowledge2" value="5" /></td>
                  </tr>
               </table>
            </div>
            <div style="background-color: lightgray; margin-top: 10px; padding: 10px;">
               <p><strong>Disposition Towards Students*</strong></p>
               <table style="width: 100%;">
                  <tr>
                     <td></td>
                     <td style="text-align: center; font-weight: bold;">1</td>
                     <td style="text-align: center; font-weight: bold;">2</td>
                     <td style="text-align: center; font-weight: bold;">3</td>
                     <td style="text-align: center; font-weight: bold;">4</td>
                     <td style="text-align: center; font-weight: bold;">5</td>
                  </tr>
                  <tr>
                     <td>Teacher believes that students can learn from the class*</td>
                     <td style="text-align: center;"><input type="radio" name="appearance3" value="1"></td>
                     <td style="text-align: center;"><input type="radio" name="appearance3" value="2"></td>
                     <td style="text-align: center;"><input type="radio" name="appearance3" value="3"></td>
                     <td style="text-align: center;"><input type="radio" name="appearance3" value="4"></td>
                     <td style="text-align: center;"><input type="radio" name="appearance3" value="5"></td>
                  </tr>
                  <tr>
                     <td>Teacher shows equal respect to various cultural backgrounds, individuals, religion, and race*</td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm3" value="1"></td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm3" value="2"></td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm3" value="3"></td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm3" value="4"></td>
                     <td style="text-align: center;"><input type="radio" name="enthusiasm3" value="5"></td>
                  </tr>
                  <tr>
                     <td>Teacher finds the students strengths as basis for growth and weaknesses for opportunities for improvement*</td>
                     <td style="text-align: center;"><input type="radio" name="initiative3" value="1"></td>
                     <td style="text-align: center;"><input type="radio" name="initiative3" value="2"></td>
                     <td style="text-align: center;"><input type="radio" name="initiative3" value="3"></td>
                     <td style="text-align: center;"><input type="radio" name="initiative3" value="4"></td>
                     <td style="text-align: center;"><input type="radio" name="initiative3" value="5"></td>
                  </tr>
                  <tr>
                     <td>Teacher understands the weakness of a student and helps in the student's improvement*</td>
                     <td style="text-align: center;"><input type="radio" name="knowledge3" value="1"required></td>
                     <td style="text-align: center;"><input type="radio" name="knowledge3" value="2"required></td>
                     <td style="text-align: center;"><input type="radio" name="knowledge3" value="3"required></td>
                     <td style="text-align: center;"><input type="radio" name="knowledge3" value="4"required></td>
                     <td style="text-align: center;"><input type="radio" name="knowledge3" value="5"required></td>
                  </tr>
               </table>
            </div>
            <label for="comment">Comments:</label>
            <textarea id="comment" name="comment" rows="4" cols="50" placeholder="If you want to say something about your teacher write here..."></textarea>
            <div>---------------------------------------------------------------------------------------------------------</div>
            <div style="text-align: center;">

                 <input type="hidden" name="param1=" value="<%=roll %>" />
                 <button type="submit" class="my-button" id="submitForm" >Submit</button>

            </div>
         </form>
        <script>
            function submitForm() {
                const form = document.getElementById("myForm");
                const inputs = form.querySelectorAll("input[required]");
                for (let i = 0; i < inputs.length; i++) {
                    const input = inputs[i];
                    if (!input.value) {
                        input.scrollIntoView({ behavior: "smooth" });
                        input.focus();
                        const fieldName = input.getAttribute("name");
                        const message = `Please fill out ${fieldName} field.`;
                        const utterance = new SpeechSynthesisUtterance(message);
                        speechSynthesis.speak(utterance);
                        return;
                    }
                }
                form.submit();
                window.location.href = "WebForm18.aspx";
            }
            const submitLink = document.getElementById("submitForm");
            submitLink.addEventListener("click", (event) => {
                event.preventDefault();
                submitForm();

            });
        </script>
      </div>
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
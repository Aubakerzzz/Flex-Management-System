<%-- CGPA GRAPH PAGE --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CGPA Graph.aspx.cs" Inherits="WebApp01.WebForm13" %>

<!DOCTYPE html>
<html>
<head>
    <title>CGPA Bar Chart</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
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
			width: 135px;
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
            .chart-container {
              margin-top: 200px; /* change the value to adjust the margin */
              background-color: black;
              animation: fade-in 1s ease-in-out;
              transition: background-color 0.5s ease-in-out;
            }

            @keyframes fade-in {
              from {
                opacity: 0;
              }
              to {
                opacity: 1;
              }
            }

            .chart-container:hover {
              background-color: lightslategrey;
            }
          .red-bar {
            background-color: red;
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

    </style>
</head>
    <body>
    <div class="chart-container">
      <canvas id="chart"></canvas>
           <div></div>
      <div class="row">
        <div class="col-md-12">
          <a href="WebForm18.aspx" id="toggle-table5" class="btn btn-primary">Go Back</a>
        </div>
      </div>
       
    </div>

    <script>
        // Retrieve the CGPA values from the Data list
        var data = <%= new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(Data) %>;
        var cgpas = data.slice(1).map(function (row) {
            return parseFloat(row[0]);
        });

        // Generate the labels for the bar chart
        var labels = [];
        var colors = [];
        for (var i = 0; i < cgpas.length; i++) {
            labels.push('Semester ' + (i + 1));
            colors.push('hsl(' + (i * 360 / cgpas.length) + ', 100%, 50%)');
        }

        // Generate the data and colors for the bar chart
        var chartData = {
            labels: labels,
            datasets: [{
                label: 'SEMESTERS CGPA',
                backgroundColor: cgpas.map(function (cgpa) {
                    return cgpa < 3 ? 'rgba(255, 0, 0, 0.5)' : 'rgba(255, 205, 86, 1)';
                }),
                borderColor: cgpas.map(function (cgpa) {
                    return cgpa < 3 ? 'rgba(255, 0, 0, 1)' : 'rgba(255, 205, 86, 1)';
                }),
                borderWidth: 1,
                data: cgpas
            }]
        };

        // Generate the options for the bar chart
        var chartOptions = {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            },
            animation: {
                duration: 2000,
                easing: 'easeOutQuad'
            }
        };

        // Create the bar chart
        var ctx = document.getElementById('chart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: chartData,
            options: chartOptions
        });

        // Change the colors of the labels every 2 seconds
        var labelIndex = 0;
        setInterval(function () {
            for (var i = 0; i < labels.length; i++) {
                if (i == labelIndex) {
                    document.getElementById('label-' + i).style.color = colors[labelIndex];
                } else {
                    document.getElementById('label-' + i).style.color = '';
                }
            }
            labelIndex = (labelIndex + 1) % labels.length;
        }, 2000);

        // Add event listener to update chart on button click
        document.getElementById('update-chart-btn').addEventListener('click', function () {
            // Generate new random CGPA values
            var newCgpas = cgpas.map(function (cgpa) {
                return Math.floor(Math.random() * 5 + 1);
            });

            // Update data and colors for the bar chart
            myChart.data.datasets[0].borderColor = newCgpas.map(function (cgpa) {
                return cgpa < 3 ? 'rgba(255, 0, 0, 1)' : 'rgba(255, 205, 86, 1)';
            });
            myChart.data.datasets[0].data = newCgpas;

            // Update the chart with transition
            myChart.update({
                duration: 2000,
                easing: 'easeOutQuad'
            });
        });


    </script>
           <!-- Bootstrap JS -->
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
         <script>
             function navigateToPage(page) {
                 switch (page) {
                     case "back":
                         window.location.href = "Student Main Page.aspx?param1=<%=roll %>";
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
        <%-- --------------------------------NAVIGATION BAR-----------------------------  --%>
               <div class="navbar">
		<div class="navbar-header">
		</div>
		<ul class="navbar-nav">
			<li><a href="WebForm18.aspx?param1=<%=roll %>" style="background-color: white;">Course Registration</a></li>
			<li><a href="All Evaluations.aspx?param1=<%=roll %>" style="background-color: white;">Evaluation Marks</a></li>
			<li><a href="CGPA Graph.aspx?param1=<%=roll %>" style="background-color: white;">CGPAs GRAPH</a></li>
			<li><a href="WebForm18.aspx?param1=<%=roll %>" style="background-color: white;">Feedback Form</a></li>
			<li><a href="WebForm18.aspx?param1=<%=roll %>" style="background-color: white;">ATTEN DANCE</a></li>
			<li><a href="WebForm18.aspx?param1=<%=roll %>" style="background-color: white;">Transcript</a></li>
            <li><a href="WebForm1.aspx" style="background-color: white;">Login</a></li>
            <li><a href="WebForm2.aspx" style="background-color: white;">Signup</a></li>
            <li><a href="MainPage.aspx" style="background-color: white;">Main</a></li>
		</ul>
	</div>
</body>
</html>
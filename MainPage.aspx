 <%-- Main page --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="WebApp01.WebForm3" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head runat="server">
      <link rel="icon" type="image/x-icon" href="favicon.ico"/>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
      <title>Welcome to Fast Flex</title>
      <!-- Bootstrap CSS -->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet"/>
      <style>
         /* General Styles */
         * {
             box-sizing: border-box;
             margin: 0;
             padding: 0;
         }
         body {
             background-image: url("backgroundsignup2.jpg");
             background-size: cover;
             font-family:'Times New Roman';
             overflow: hidden;
         }
         /* Header Styles */
         header {
             position: fixed;
             top: 0;
             left: 0;
             width: 100%;
             padding: 1rem;
             display: flex;
             justify-content: space-between;
             align-items: center;
             z-index: 2;
             font-family:'Times New Roman';
         }
         .logo {
             color: #ffffff;
             font-size: 2rem;
             font-weight: bold;
             letter-spacing: 1px;
             text-transform: uppercase;
             animation: bounceInDown 1s ease-out;
         }
         .nav-links {
             list-style: none;
             display: flex;
             justify-content: center;
             align-items: center;
         }
         .nav-links li {
             margin: 0 1rem;
             position: relative;
             animation: fadeInRight 1s ease-out;
         }
         .nav-links li a {
             color: #ffffff;
             font-size: 1.2rem;
             text-decoration: none;
             padding: 0.5rem;
             transition: all 0.3s ease-in;
         }
         .nav-links li a:hover {
             background-color: rgba(255, 255, 255, 0.1);
             border-radius: 5px;
             color : aqua
         }
         /* Container Styles */
         #container {
             width: 90%;
             max-width: 800px;
             margin: 0 auto;
             background-color: black;
             padding: 20px;
             border-radius: 10px;
             box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
             text-align: center;
             position: absolute;
             top: 70%;
             left: 50%;
             transform: translate(-50%, -50%);
             animation: bounceInUp 1s ease-out;
             z-index: 1;
         }
         #container h1 {
             color: black;
             margin-bottom: 1rem;
             font-size: 2.5rem;
             letter-spacing: 2px;
             text-transform: uppercase;
             animation: fadeInLeft 1s ease-out;
         }
         #container p {
             color: black;
             font-size: 1.2rem;
             margin-bottom: 2rem;
             animation: fadeInRight 1s ease-out;
         }
         #container ul {
             list-style: none;
             padding: 0;
             margin: 0;
         }
         #container ul li {
             background-color: black;
             padding: 10px;
             border: 1px solid #ccc;
             margin-bottom: 10px;
             transition: background-color 0.3s ease-in-out;
             animation: shadow-change 5s linear infinite !important
         }
         #container ul li:hover {
             background-color: darkgray;

         }
         @media (min-width: 768px) {
            #container ul {
                display: flex;
                 flex-wrap: wrap;
            }
            #container ul li {
                width: calc(33.33% - 20px);
                margin-right: 20px;
            }
            #container ul li:nth-child(3n) {
                margin-right: 0;
            }
         }          
         #blink {
         font-size: 20px;
         font-weight: bold;
         font-family: 'Times New Roman';
         animation: blinker 1s linear infinite;
         }
         @keyframes blinker {
             0% {
             color: #FF0000;
             }
             10% {
             color: #FF4500;
             }
             20% {
             color: #FF8C00;
             }
             30% {
             color: #FFA500;
             }
             40% {
             color: #FFFF00;
             }
             50% {
             color: #ADFF2F;
             }
             60% {
             color: #00FF00;
             }
             70% {
             color: #00FFFF;
             }
             80% {
             color: #1E90FF;
             }
             90% {
             color: #8B00FF;
             }
             95% {
             color: #FF00FF;
             }
             100% {
             color: #FF1493;
             }
             50% {
             opacity: 0;
             }
         }
         html, body {
         height: 100%;
         margin: 0;
         padding: 0;
         color: white
         }
         body {
         display: flex;
         flex-direction: column;
         align-items: center;
         justify-content: center;
         }
         span {
         transition: color 0.5s ease;
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
         video {
			position: absolute;
			top: 5px;
			
		 } 
      </style>
   </head>
   <body>
	<video width="480" height="320" controls>
  		<source src="video.mp4" type="video/mp4"/>
  		Your browser does not support the video tag.
	</video>
      <form id="form1" runat="server">
         <div id="background-animation"></div>
         <p id="blink">Click <a href="http://isb.nu.edu.pk/Faculty/allfaculty/" onclick="speakMessage4()">here</a> to go to Fast Faculty.</p>
         <div id="container">
            <h1 id="colorful-text">Welcome to Fast Flex</h1>
            <p style="color: white;">Choose an Option</p>
            <ul>
               <li><a href="Student Login.aspx"  onclick="speakMessage3()">Academic Office</a></li>
               <li><a href="Student Login.aspx"  onclick="speakMessage2()">Faculty</a></li>
               <%--<li><a href="WebForm1.aspx"  onclick="speak('Welcome to Fast Student')">Students</a></li>--%>
               <li><a href="Student Login.aspx"onclick="speakMessage1()">Students</a></li>
            </ul>
         </div>
      </form>
      <script>
          let text = document.getElementById("colorful-text").textContent;
          let newText = "";
          for (let i = 0; i < text.length; i++) {
              newText += "<span>" + text.charAt(i) + "</span>";
          }
          document.getElementById("colorful-text").innerHTML = newText;
          let colors = ["red", "orange", "grey", "green", "#FFA500", "purple"];
          setInterval(function () {
              let spans = document.querySelectorAll("#colorful-text span");
              for (let i = 0; i < spans.length; i++) {
                  let randomIndex = Math.floor(Math.random() * colors.length);
                  spans[i].style.color = colors[randomIndex];
              }
          }, 500);
      </script>
      <script src="https://threejs.org/build/three.min.js"></script>
      <script src="https://threejs.org/examples/js/controls/OrbitControls.js"></script>
      <script src="background-animation.js"></script>
      <script>
          function navigateToPage(page) {
              switch (page) {
                  case "academic":
                      window.location.href = "Student Login.aspx";
                      break;
                  case "faculty":
                      window.location.href = "Student Login.aspx";
                      break;
                  case "students":
                      window.location.href = "Student Login.aspx";
                      break;
                  case "fast":
                      window.location.href = "http://isb.nu.edu.pk/Faculty/allfaculty/";
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
              const keywords = ["open students", "open faculty", "open academic office", "open fast faculty website"];
              recognition.onresult = function (event) {
                  let input = event.results[0][0].transcript.trim().toLowerCase();
                  console.log("Speech Input: " + input);
                  if (input.includes("academic office")) {
                      speakMessage3();
                      navigateToPage("academic");
                  } else if (input.includes("open faculty")) {
                      speakMessage2();
                      navigateToPage("faculty");
                  } else if (input.includes("students")) {
                      //speak("Welcome to Fast Students");
                      speakMessage1();
                      navigateToPage("students");
                  } else if (input.includes("open fast faculty website")) {
                      speakMessage4();
                      navigateToPage("fast");
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
          function getRandomMessage() {
              const messages = [
                  "Welcome to Signup page",
                  "Greetings, you have entered the Fast Student portal.",
                  "Welcome to the Fast Student online platform.",
                  "The Fast Student portal is pleased to have you.",
                  "Thank you for visiting the Fast Student portal.",
                  "You are now on the Fast Student portal, welcome!",
                  "The Fast Student website greets you.",
                  "We extend a warm welcome to you on the Fast Student portal.",
                  "Welcome to the online home of Fast Student.",
                  "You have arrived at the Fast Student portal, hello!",
                  "The Fast Student platform welcomes you aboard.",
                  "It's a pleasure to have you on the Fast Student portal.",
                  "Welcome to the digital world of Fast Student.",
                  "Fast Student portal, at your service!"
              ];
              return messages[Math.floor(Math.random() * messages.length)];
          }
          function speakMessage1() {
              const message = getRandomMessage();
              const synth = window.speechSynthesis;
              const utterThis = new SpeechSynthesisUtterance(message);
              synth.speak(utterThis);
          }
          function getRandomMessage1() {
              const messages = [
                  "Welcome to fast Faculty portal",
                  "Greetings, you have entered the Fast Faculty portal.",
                  "Welcome to the Fast Faculty online platform.",
                  "The Fast Faculty portal is pleased to have you.",
                  "Thank you for visiting the Fast Faculty portal.",
                  "You are now on the Fast Faculty portal, welcome!",
                  "The Fast Faculty website greets you.",
                  "We extend a warm welcome to you on the Fast Faculty portal.",
                  "Welcome to the online home of Fast Faculty.",
                  "You have arrived at the Fast Faculty portal, hello!",
                  "The Fast Faculty platform welcomes you aboard.",
                  "It's a pleasure to have you on the Fast Faculty portal.",
                  "Welcome to the digital world of Fast Faculty.",
                  "Fast Faculty portal, at your service!"
              ];
              return messages[Math.floor(Math.random() * messages.length)];
          }
          function speakMessage2() {
              const message = getRandomMessage1();
              const synth = window.speechSynthesis;
              const utterThis = new SpeechSynthesisUtterance(message);
              synth.speak(utterThis);
          }
          function getRandomMessage2() {
              const messages = [
                  "Welcome to Fast Academic Office Portal ",
                  "Greetings, and welcome to the Fast Academic Office Portal.",
                  "The Fast Academic Office Portal is pleased to have you.",
                  "The Fast Academic portal is pleased to have you.",
                  "Thank you for visiting the Fast Academic Office Portal.",
                  "Welcome to the online home of Fast Academic Office.",
                  "Fast Academic Office greets you on its portal.",
                  "It's a pleasure to have you on the Fast Academic Office Portal.",
                  "You are now on the Fast Academic Office digital platform, welcome!",
                  "Fast Academic Office Portal, at your service!",
                  "The digital world of Fast Academic Office welcomes you.",
                  "Welcome to the Fast Academic Office online platform.",
                  "Fast Academic Office Portal is delighted to welcome you.",
                  "We extend a warm welcome to you on the Fast Academic Office Portal."
              ];
              return messages[Math.floor(Math.random() * messages.length)];
          }
          function speakMessage3() {
              const message = getRandomMessage2();
              const synth = window.speechSynthesis;
              const utterThis = new SpeechSynthesisUtterance(message);
              synth.speak(utterThis);
          }
          function getRandomMessage3() {
              const messages = [
                  "Welcome to Fast Faculty Website ",
                  "Greetings, and welcome to the Fast Faculty Website.",
                  "You have arrived at the Fast Faculty Website.",
                  "The Fast Faculty Website is pleased to have you.",
                  "Thank you for visiting the Fast Faculty Website.",
                  "Welcome to the online home of Fast Faculty.",
                  "Fast Faculty greets you on its website.",
                  "It's a pleasure to have you on the Fast Faculty Website.",
                  "You are now on the Fast Faculty digital platform, welcome!",
                  "Fast Faculty Website, at your service!",
                  "Welcome to the Fast Faculty online platform.",
                  "The digital world of Fast Faculty welcomes you.",
                  "Fast Faculty Website is delighted to welcome you.",
                  "We extend a warm welcome to you on the Fast Faculty Website."
              ];
              return messages[Math.floor(Math.random() * messages.length)];
          }
          function speakMessage4() {
              const message = getRandomMessage3();
              const synth = window.speechSynthesis;
              const utterThis = new SpeechSynthesisUtterance(message);
              synth.speak(utterThis);
          }
      </script>
   </body>
</html>
<%-- Students SignUp Page --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApp01.LoginPage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head runat="server">
      <link rel="icon" type="image/x-icon" href="favicon.ico"/>
      <title>Flex | Student</title>
      <!-- Bootstrap CSS -->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet"/>
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
         background-color: lightpink;
         padding: 20px;
         border-radius: 10px;
         max-width: 400px;
         box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
         margin-top: 10%;
         animation: slide-up 0.5s ease-out;
         animation-fill-mode: forwards;
         animation: colorChange 10s infinite;
         }
         .container h1 {
         text-align: center;
         font-size: 24px;
         color: #333;
         margin-top: 0;
         }
         .form-group {
         margin-bottom: 10px;
         opacity: 0;
         animation: fade-in 0.5s ease-out forwards;
         animation-delay: 0.5s;
         }
         .form-group:hover {
         background-color: orange;
         transition: all 0.3s ease-in-out;
         }
         .form-group input[type=text]:hover, .form-group input[type=password]:hover {
         background-color: orange;
         transition: all 0.3s ease-in-out;
         }
         .form-group input[type=text]:focus, .form-group input[type=password]:focus {
         background-color: orange;
         transition: all 0.3s ease-in-out;
         }
         .form-group input[type=text], .form-group input[type=password] {
         border: groove;
         border-bottom: 1px solid #ccc;
         padding: 5px;
         width: 100%;
         }
         #btnLogin {
         background-color: #3498db;
         color: #fff;
         border: none;
         border-radius: 5px;
         padding: 10px;
         width: 100%;
         margin-top: 20px;
         transition: all 0.3s ease-in-out;
         animation: slide-up 0.5s ease-out forwards;
         animation-delay: 1s;
         }
         #btnLogin:hover {
         background-color: burlywood;
         transition: all 0.3s ease-in-out;
         }
         #error-message {
         color: red;
         font-weight: bold;
         display: none;
         margin-top: 10px;
         opacity: 0;
         animation: fade-in 0.5s ease-out forwards;
         animation-delay: 1.5s;
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
         background-color: lightsalmon;
         }
         75% {
         background-color: #00FFFF;
         }
         100% {
         background-color: dimgrey;
         }
         }
      </style>
   </head>
   <body>
      <div class="container">
         <h1>Signup Form</h1>
         <form id="form1" runat="server">
            <div class="form-group">
               <asp:Label ID="Label1" runat="server" Text="Username: "></asp:Label>
               <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
               <asp:Label ID="Label2" runat="server" Text="Password: "></asp:Label>
               <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div>
               <asp:Button ID="btnLogin" runat="server" Text="Signup" OnClick="btnLogin_Click" OnClientClick="return validateForm();" />
            </div>
            <div>
               <span class="error-message" id="error-message" style="display:none;"></span>
            </div>
            <div class="form-group" style="text-align: right;">
               <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/WebForm1.aspx"  onclick="speak('Welcome back to Students Login Form')" >Login</asp:HyperLink>
            </div>
         </form>
      </div>
      <script>
          function navigateToPage(page) {
              switch (page) {
                  case "login":
                      window.location.href = "WebForm1.aspx";
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
              const keywords = ["go back to login form"];
              recognition.onresult = function (event) {
                  let input = event.results[0][0].transcript.trim().toLowerCase();
                  console.log("Speech Input: " + input);
                  if (input.includes("login")) {
                      speak("Welcome back to Students login form");
                      navigateToPage("login");
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

          function speak(message) {
              const speechMessage = new SpeechSynthesisUtterance(message);
              window.speechSynthesis.speak(speechMessage);
          }
      </script>
   </body>
</html>
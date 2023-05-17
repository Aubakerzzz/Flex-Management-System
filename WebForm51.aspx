<%-- Course Allocation By Academic Officer --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm51.aspx.cs" Inherits="WebApp01.WebForm51" %>
<!DOCTYPE html>
<html>
   <head>
      <title>Course Registration</title>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet"/>
      <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
      <%-- -------------------------------------------- NAVIGATION CODE ---------------------------------- --%>
      <style>
         :root {
         --navbar-width: 80px; /* set the default navbar width */
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
         width: var(--button-width - 10); /* set the button width */
         animation: 
         shadow-change 5s linear infinite;
         transition: background-color 0.3s ease-in-out;
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
         #container {
         background-color: dimgrey;
         font-family: 'Times New Roman'; 
         width: 60%;
         margin: auto;
         padding: 2%;
         border-radius: 5px;
         animation: shadow-change 5s linear infinite !important;
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
         h1 {
         color: #fff;
         background: linear-gradient(to right, #ff0000, #ff7f00, #ffff00, #00ff00, #0000ff, #4b0082, #8b00ff);
         background-size: 1400% 1400%;
         animation: gradient 15s ease infinite;
         display: inline-block;
         padding: 10px 20px;
         border-radius: 10px;
         margin-bottom: 20px;
         animation: shadow-change 5s linear infinite !important;
         }
         /* Create gradient animation */
         @keyframes gradient {
         0% {
         background-position: 0% 50%;
         }
         50% {
         background-position: 100% 50%;
         }
         100% {
         background-position: 0% 50%;
         }
         }
         .checkbox {
         color: aquamarine;
         display: flex;
         align-items: center;
         margin-bottom: 10px;
         }
         .checkbox input[type="checkbox"] {
         margin-right: 10px;
         }
         .checkbox input[type="checkbox"]:hover {
         background-color: goldenrod;
         }
         .checkbox input[type="checkbox"]:checked {
         animation: blink 1s linear infinite;
         background-color: lightgreen;
         }
         @keyframes blink {
         50% {
         opacity: 0;
         }
         }
         input[type="text"],
         button[type="submit"] {
         background-color: #fff;
         border: none;
         padding: 10px;
         margin: 5px;
         border-radius: 5px;
         box-shadow: 0px 0px 5px 2px #B2B2B2;
         }
         button[type="submit"] {
         background-color: #007FFF;
         color: #fff;
         transition: background-color 0.5s ease;
         animation: shadow-change 5s linear infinite !important;
         }
         button[type="submit"]:hover {
         background-color: darkgoldenrod;
         cursor: pointer;
         }
         input[type="text"]:hover {
         background-color: lightcoral;
         }
         input[type="text"]:focus {
         background-color: #f9f9f9;
         outline: none;
         }
         #message {
         color: red;
         font-size: 18px;
         text-align: left;
         margin-top: 20px;
         }
         /* Style for the toggle buttons */
         button {
         background-color: #4CAF50;
         color: white;
         padding: 8px 20px;
         border: none;
         border-radius: 4px;
         cursor: pointer;
         margin-right: 10px;
         }
         button:hover {
         background-color: #3e8e41;
         }
         /* Style for the input fields */
         #inputFields input[type=text], #inputFields1 input[type=text] {
         width: 50%;
         padding: 12px 20px;
         margin: 8px 0;
         display: inline-block;
         border: 1px solid #ccc;
         border-radius: 4px;
         box-sizing: border-box;
         }
         #inputFields button[type=submit], #inputFields1 button[type=submit] {
         background-color: #4CAF50;
         color: white;
         padding: 8px 20px;
         border: none;
         border-radius: 4px;
         cursor: pointer;
         }
         #inputFields button[type=submit]:hover, #inputFields1 button[type=submit]:hover {
         background-color: #3e8e41;
         }
      </style>
   </head>
   <body>
      <div id="container">
         <h1>Course Allocation</h1>
         <form onsubmit="return validateForm()" action="WebForm56.aspx">

             <% int counter = 0; %>
             <% foreach (string[] col in Data) {  %>
                <div class="checkbox">
                   <label for="checkbox_<%=counter %>"><%= col[0] %> - <%= col[1] %></label>
                </div>
                <% counter++; %>
             <% } %>

            <!-- Add toggle buttons for insert and delete -->
            <div>
               <button type="button" onclick="toggleInsert()">Insert</button>
               <button type="button" onclick="toggleDelete()">Delete</button>
            </div>
            <!-- Add input fields for insert/delete actions -->
            <div id="inputFields">
               <input type="text" id="courseId" placeholder="Insert Course ID">
               <input type="text" id="courseName" placeholder="Insert Course Name">
               <div>
                   <input type="hidden" name="check" value="1" />
                  <button type ="submit" id ="id1"> Done</button>
               </div>
            </div>
            <div id="inputFields1">
               <input type="text" id="courseId1" placeholder="Delete Course ID">
                <input type="hidden" name="check" value="2" />
               <button type ="submit" id ="id2"> Done</button>
            </div>
             <input type="hidden" name="check" value="3" />
            <button type="submit" id="allocationButton">Allocation</button>
         </form>
      </div>
      <script>
          // Hide the input fields initially
          document.getElementById("inputFields").style.display = "none";
          document.getElementById("inputFields1").style.display = "none";
          // Toggle the input fields for insert action
          function toggleInsert() {
              var inputFields = document.getElementById("inputFields");
              var insertButton = document.getElementById("insertButton");
              if (inputFields.style.display === "none") {
                  inputFields.style.display = "block";
                  insertButton.disabled = false;
              } else {
                  inputFields.style.display = "none";
                  insertButton.disabled = true;
              }
          }
          // Toggle the input fields for delete action
          function toggleDelete() {
              var inputFields = document.getElementById("inputFields1");
              var deleteButton = document.getElementById("deleteButton");
              if (inputFields.style.display === "none") {
                  inputFields.style.display = "block";
                  deleteButton.disabled = false;
              } else {
                  inputFields.style.display = "none";
                  deleteButton.disabled = true;
              }
          }
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
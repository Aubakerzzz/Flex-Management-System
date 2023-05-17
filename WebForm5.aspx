<%-- Student Marks Page --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="WebApp01.WebForm5" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head runat="server">
      <title>Course Marks</title>
      <!-- Bootstrap CSS -->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet"/>
      <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
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
      </style>
   </head>
   <body>
      <div class="container">
         <div class="row">
            <div class="col-md-12">
                 <button id="toggle-table1" class="btn btn-primary">Assignment Marks</button>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <table id="usernames-table" class="table table-striped table-bordered font-adjust" style="display: none;">
                  <thead>
                     <tr>
                        <th>Quiz#</th>
                        <th>Total Marks</th>
                        <th>Obtained Marks</th>
                     </tr>
                  </thead>
                  <tbody>
                     <% int rowCounter1 = 1; %>
                     <% foreach (string[] col in Data) { %>
                     <% if (rowCounter1 > 1) { %>
                     <tr>
                        <td><%= rowCounter1 - 1 %></td>
                        <td><%= col[0] %></td>
                        <td><%= col[1] %></td>
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
           <button id="toggle-table2" class="btn btn-primary">Quizes Marks</button>
        </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <table id="student-table" class="table table-striped table-bordered" style="display: none;">
                  <thead>
                     <tr>
                        <th>Quiz#</th>
                        <th>Total Marks</th>
                        <th>Obtained Marks</th>
                     </tr>
                  </thead>
                  <tbody>
                     <% int rowCounter = 1; %>
                     <% foreach (string[] col in Usernames) { %>
                     <% if (rowCounter > 1) { %>
                     <tr>
                        <td><%= rowCounter - 1 %></td>
                        <td><%= col[0] %></td>
                        <td><%= col[1] %></td>
                     </tr>
                     <% } %>
                     <% rowCounter++; %>
                     <% } %>
                  </tbody>
               </table>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <button id="toggle-table3" class="btn btn-primary">Sessional-I Marks</button>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <table id="Sessional-table" class="table table-striped table-bordered" style="display: none;">
                  <thead>
                     <tr>
                        <th>Sessional#</th>
                        <th>Total Marks</th>
                        <th>Obtained Marks</th>
                     </tr>
                  </thead>
                  <tbody>
                     <% int rowCounter2 = 1; %>
                     <% foreach (string[] col in Usernames1.Skip(1)) { %>
                     <% if (rowCounter > 1) { %>
                     <tr>
                        <td><%= rowCounter2 %></td>
                        <td><%= col[0] %></td>
                        <td><%= col[1] %></td>
                     </tr>
                     <% } %>
                     <% rowCounter2++; %>
                     <% } %>
                  </tbody>
               </table>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <button id="toggle-table4" class="btn btn-primary">Sessional-II Marks</button>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <table id="Sessional2-table" class="table table-striped table-bordered" style="display: none;">
                  <thead>
                     <tr>
                        <th>Sessional#</th>
                        <th>Total Marks</th>
                        <th>Obtained Marks</th>
                     </tr>
                  </thead>
                  <tbody>
                     <% int rowCounter3 = 1; %>
                     <% foreach (string[] col in Usernames2.Skip(1)) { %>
                     <% if (rowCounter3 > 1) { %>
                     <tr>
                        <td><%= rowCounter3 %></td>
                        <td><%= col[0] %></td>
                        <td><%= col[1] %></td>
                     </tr>
                     <% } %>
                     <% rowCounter3++; %>
                     <% } %>
                  </tbody>
               </table>
            </div>
         </div>
            <div class="col-md-12">
                 <button id="toggle-table5" class="btn btn-primary">Final Marks</button>
            </div>
         <div class="row">
            <div class="col-md-12">
               <table id="Final-table" class="table table-striped table-bordered font-adjust" style="display: none;">
                  <thead>
                     <tr>
                        <th>Quiz#</th>
                        <th>Total Marks</th>
                        <th>Obtained Marks</th>
                     </tr>
                  </thead>
                  <tbody>
                     <% int rowCounter5 = 1; %>
                     <% foreach (string[] col in Usernames3) { %>
                     <% if (rowCounter5 > 1) { %>
                     <tr>
                        <td><%= rowCounter5 - 1 %></td>
                        <td><%= col[0] %></td>
                        <td><%= col[1] %></td>
                     </tr>
                     <% } %>
                     <% rowCounter5++; %>
                     <% } %>
                  </tbody>
               </table>
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
                  $("#student-table").toggle();
              });
              $("#toggle-table3").click(function () {
                  $("#Sessional-table").toggle();
              });
              $("#toggle-table4").click(function () {
                  $("#Sessional2-table").toggle();
              });
              $("#toggle-table5").click(function () {
                  $("#Final-table").toggle();
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
                const keywords = ["assignment","quiz","sessionalone", "sessionaltwo", "final"];
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
   </body>
</html>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.ResultSet" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagementsystem?characterEncoding=latin1&useConfigs=maxPerformance", "root", "");
    PreparedStatement preparedStatement = null;
    ResultSet rs = null;
    String sql = "";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <script src="jquery-3.4.1.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Alata&display=swap" rel="stylesheet">
    <title>CRACK</title>
</head>
<body style="display: flex;
min-height: 100vh;
flex-direction: column;
font-family: 'Alata', sans-serif;">
    
    <div class="navbar-fixed">
      <nav>
        <div class="nav-wrapper">
          <a href="#!" class="brand-logo">Logo</a>
          <ul class="right hide-on-med-and-down">
            <li><a href="HomePage.jsp">Home</a></li>
            <li>
                <%
                  String prn = "";
                  Cookie[] cookies = request.getCookies();

                  if (cookies != null) 
                  {
                     for (Cookie cookie : cookies)
                     { 
                         if (cookie.getName().equals("Prn")) 
                         {
                            prn= cookie.getValue();
                            out.println(prn);

                         }
                     }
                   
                   }
                %>
                
            </li>
            <li><a href="logout">Logout</a></li>
          </ul>
        </div>
      </nav>
    </div>
            
   <h6> Enroll Subject</h6> 
   <a href="">
   <%
       sql = "select course_name from course where course_id in(select course_id from course_student);" ;
       preparedStatement = conn.prepareStatement(sql);
       rs = preparedStatement.executeQuery();
       while(rs.next()) {
            out.println(rs.getString(1));
//            out.println(rs.getString(2));
//            out.println(rs.getString(3));
            

        }
   %>
   </a>
   <h6>Unenroll Subject</h6>
   <%
       sql = "select course_name from course where course_id not in(select course_id from course_student);";
       preparedStatement = conn.prepareStatement(sql);
       rs = preparedStatement.executeQuery();
       while(rs.next()) {
            out.println(rs.getString(1));
//            out.println(rs.getString(2));
//            out.println(rs.getString(3));q
        }
   %>
   
   <label onclick="EnrollConfirm()">Java</label>

<script>
function EnrollConfirm() {
  alert("Do You Really Want to Enroll For this Course!");
}
</script>
   

  
<
</body>
</html>
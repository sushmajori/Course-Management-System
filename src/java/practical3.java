import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;

public class practical3 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String prn = request.getParameter("prn");
        String pass = request.getParameter("pass");
//        out.println(prn);
//        out.println(pass);
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagementsystem?characterEncoding=latin1&useConfigs=maxPerformance", "root", "");
            PreparedStatement pst = conn.prepareStatement("select student_id,password from student where student_id=? and password=?");
            pst.setString(1, prn);
            pst.setString(2, pass);
            ResultSet rs = pst.executeQuery();
//            out.println(pst);
            
//            ResultSet rs = stmt.executeQuery(pst); 
            if(rs.next()) 
            {
//                
//               Creating cookies
                Cookie ck = new Cookie("Prn",prn);
                response.addCookie(ck);
                response.sendRedirect("HomePage.jsp?result=success");
            }  
                
                //out.println(rs.getInt(1));
            
            else
            {   
                      out.println("InCorrect login credentials");
                      response.sendRedirect("index.html");
            }
            
            conn.close();
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
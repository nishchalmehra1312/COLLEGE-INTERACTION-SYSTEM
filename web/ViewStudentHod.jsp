    <%@page import="dto.ManagerDto"%>
<%@page import="dao.ManagersDao"%>
<%@page import="dao.GetCountInfo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Iterator"%>
<%@page import="dto.StudentDto"%>
<%@page import="dto.StudentDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.StudentDao"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <style>
    body {
    background: #67B26F;  /* fallback for old browsers */
    background: -webkit-linear-gradient(to right, #4ca2cd, #67B26F);  /* Chrome 10-25, Safari 5.1-6 */
    background: linear-gradient(to right, #4ca2cd, #67B26F); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    padding: 0;
    margin: 0;
    font-family: 'Lato', sans-serif;
    color: #000;
}      
.student-profile .card {
    border-radius: 10px;
}
.student-profile .card .card-header .profile_img {
    width: 150px;
    height: 150px;
    object-fit: cover;
    margin: 10px auto;
    border: 10px solid #ccc;
    border-radius: 50%;
}
.student-profile .card h3 {
    font-size: 20px;
    font-weight: 700;
}
.student-profile .card p {
    font-size: 16px;
    color: #000;
}
.student-profile .table th,
.student-profile .table td {
    font-size: 14px;
    padding: 5px 10px;
    color: #000;
}

      </style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Area | Dashboard</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
  </head>
  <body>
<%
    String unique_key = (String)session.getAttribute("unique_key");
    
         System.out.println(unique_key);
    
    if( unique_key==null || !unique_key.equals("hod"))
    {
        session.invalidate();
        response.sendRedirect("login.jsp");
    }
    
    String id = (String)session.getAttribute("id");

%>
  
    
<%@ include file="headerHod.jsp" %>

           
          </div>            


                          
      
          <div class="col-md-9">
            <!-- Website Overview -->
            <div class="panel panel-default">
              <div class="panel-heading main-color-bg">
                <h3 class="panel-title">Users</h3>
              </div>
              <div class="panel-body">
                <div class="row">
                      <div class="col-md-12">
                          <input class="form-control" type="text" placeholder="Filter Users...">
                      </div>
                </div>
                <br>
                <table class="table table-striped table-hover">
                      <tr>
                          
                        <th>Enrollment</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Date of birth</th>
                        <th></th>
                      </tr>
                      <%
                          StudentDao sHod=new StudentDao();
                          List<StudentDto> listHod = sHod.getAllStudentData();
                          Iterator<StudentDto> itrHod=listHod.iterator();
                          while(itrHod.hasNext())
                          {
                            StudentDto studentHod = new StudentDto();
                            studentHod=itrHod.next();
                          
                      %>
                      <tr>
                          <td><%= studentHod.getEnrollment_number() %></td>
                        <td><%= studentHod.getStudent_name() %></td>
                        <td><%= studentHod.getEmail() %></td>
                        <td><%= studentHod.getDob() %></td>
                        <td>
                            <form method="post" action="IndividualStudentGetData">
                                
                                <button class="btn btn-default"  >Edit</button> 
                                
                                <input type="text" name="enrollment" hidden value="<%= studentHod.getEnrollment_number() %>">
                                <a class="btn btn-danger"  href="DeleteData?uid=<%= studentHod.getEnrollment_number() %>&cat=student ">Delete</a>
                                <form method="post" action="ViewDatas">
                                <a class="btn btn-danger"  href="ViewDatas?uid=<%= studentHod.getEnrollment_number() %>&cat=student ">view Info</a>
                            </form>
                        </td>
                      </tr>
                     <%
                     }
                     %>
                    </table>
              </div>
              </div>

          </div>
        </div>
      </div>
    </section>

    <footer id="footer">
      <p>Copyright AdminStrap, &copy; 2017</p>
    </footer>
          
    
<%@ include file="footerHod.jsp" %>

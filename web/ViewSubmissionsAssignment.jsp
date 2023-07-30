<%@page import="dao.ResponseAssignmentDao"%>
<%@page import="dao.ResponseAssignmentDao"%>
<%@page import="dto.AssignmentResponseDto"%>
<%@page import="dto.AssignmentDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.AssignmentDao"%>
<%@page import="dto.StudentDto"%>
<%@page import="dto.StudentDto"%>
<%@page import="dto.StudentDto"%>
<%@page import="dao.StudentDao"%>
<%@page import="dto.ComplaintDto"%>
<%@page import="dao.ComplaintDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="dao.ManagersDao"%>
<%@page import="dto.ManagerDto"%>
<%@page import="dao.IndividualManagerDao"%>
<%@page import="dao.GetCountInfo"%>
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
    if(session==null)
    {
        response.sendRedirect("login.jsp");
    }
    String id=(String) session.getAttribute("id");
    String category = (String)session.getAttribute("category");
    IndividualManagerDao iStudent = new IndividualManagerDao();
    ManagerDto manager = new ManagerDto();
    manager = iStudent.getIndividualManagerData(id,category);
    //session.setAttribute("manager_id", id);
   
    
%>
    <%@ include file="headerFaculty.jsp" %>
   

           
          </div>
         <div class="col-md-9">
            <!-- Website Overview -->
            <div class="panel panel-default">
              <div class="panel-heading main-color-bg">
                <h3 class="panel-title">All Submissions</h3>
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
                          
                        <th>Submitted By</th>
                        <th>Description</th>
                        <th>Submission Date</th>
                        
                        <th></th>
                      </tr>
                      <%
                          int a=(int)session.getAttribute("assignmentId");
                          int assesmentId=a;
                         ResponseAssignmentDao a2=new ResponseAssignmentDao();
                          List<AssignmentResponseDto> lResp = a2.getAllResponses(assesmentId);
                          Iterator<AssignmentResponseDto> itrSelf=lResp.iterator();
                          while(itrSelf.hasNext())
                          {
                            AssignmentResponseDto assesmentSelf = new AssignmentResponseDto();
                            assesmentSelf=itrSelf.next();
                          
                      %>
                      <tr>
                         
                          <td><%= assesmentSelf.getStudentId() %></td>
                        <td><%= assesmentSelf.getDesccription() %></td>
                        <td><%= assesmentSelf.getSubmissionDate() %></td>
                        
                        
                      </tr>
                     <%
                     }
                     %>
                    </table>
                
              </div>
              </div>
        </div>
    
      </div>
 
    </section>

    <footer id="footer">
      <p>Copyright AdminStrap, &copy; 2017</p>
    </footer>
    <%@ include file="footerFaculty.jsp" %>
   
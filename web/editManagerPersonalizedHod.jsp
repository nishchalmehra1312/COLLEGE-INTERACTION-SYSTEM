<%@page import="dto.StudentDto"%>
<%@page import="dao.StudentDao"%>
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
    String uniqueKey = (String)session.getAttribute("unique_key");
    IndividualManagerDao iStudent = new IndividualManagerDao();
    ManagerDto manager = new ManagerDto();
    manager = iStudent.getIndividualManagerData(id,category);
    //session.setAttribute("manager_id", id);
   System.out.println("HOD UNIQUE KEY = "+uniqueKey);
    
%>
   
    
<%@ include file="headerHod.jsp" %>


           
          </div>
          <div class="col-md-10">
            
            <div class="panel panel-default">
              <div class="panel-heading main-color-bg">
                <h3 class="panel-title">Website Overview</h3>
              </div>
                 
<div class="panel-body">
                  <div class="student-profile py-4">
  <div class="container">
    <div class="row">
      <div class="col-lg-2">
        <div class="card shadow-sm">
          <div class="card- header bg-transparent text-center"><h3><%= manager.getName() %></h3></div>
          <div class="card-body">
            <p class="mb-0" name="manager_id"><strong class="pr-1">Hod ID:</strong><%= manager.getManager_id() %></p>
            <p class="mb-0" name="category"><strong class="pr-1">Branch:</strong><%= manager.getBranch() %></p>
            <p class="mb-0"><strong class="pr-1">Email :</strong><%= manager.getEmail() %></p>
          </div>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent border-0">
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>General Information</h3>
          </div>
          <div class="card-body pt-0">
              <form method="post" action="UpdateManagerData">
            <table class="table table-bordered">
               <tr>
                <th width="30%">Manager Id</th>
                <td width="2%">:</td>
                <td><%= manager.getManager_id() %></td>
              </tr>
                <tr>
                <th width="30%">Full Name</th>
                <td width="2%">:</td>
                <td><input type="text" name="name" value="<%= manager.getName() %>" /></td>
              </tr>
              <tr>
                <th width="30%">Email</th>
                <td width="2%">:</td>
                <td><input type="text" name="email" value="<%= manager.getEmail()%>" /></td>
              </tr>
              <tr>
                <th width="30%">Date Of Birth</th>
                <td width="2%">:</td>
                <td><input type="text" name="dob" value="<%= manager.getDob()%>" /></td>
              </tr>
              <tr>
                <th width="30%">Gender</th>
                <td width="2%">:</td>
                <td><input type="text" name="gender" value="<%= manager.getGender()%>" /></td>
              </tr>
              <tr>
                <th width="30%">Mobile</th>
                <td width="2%">:</td>
                <td><input type="text" name="mobile" value="<%= manager.getMobile()%>" /></td>
              </tr>
              <tr>
                <th width="30%">Address</th>
                <td width="2%">:</td>
                <td><input type="text" name="address" value="<%= manager.getAddress() %>" /></td>
              </tr>
                <tr>
                <th width="30%">Qualification/th>
                <td width="2%">:</td>
                <td><input type="text" name="qualification" value="<%= manager.getQualification()%>" /></td>
              </tr>
                <tr>
                <th width="30%">Experience</th>
                <td width="2%">:</td>
                <td><input type="text" name="experience" value="<%= manager.getExperience() %>" /></td>
              </tr>
                <tr>
                <th width="30%">Subjects</th>
                <td width="2%">:</td>
                <td><input type="text" name="subjects" value="<%= manager.getSubjects() %>" /></td>
              </tr>
                <tr>
                <th width="30%">Aadhar</th>
                <td width="2%">:</td>
                <td><input type="text" name="aadhar" value="<%= manager.getAadhar()%>" /></td>
              </tr>
                <tr>
                <th width="30%">Specialization</th>
                <td width="2%">:</td>
                <td><input type="text" name="specialization" value="<%= manager.getSpecialization()%>" /></td>
              </tr>
                <tr>
                <th width="30%">Joining Year</th>
                <td width="2%">:</td>
                <td><input type="text" name="joining_year" value="<%= manager.getJoining_year()%>" /></td>
              </tr>
              
            </table>
              <button class="btn btn-default">Update</button>
              </form>
        </div>
         <div style="height: 26px"></div>
        <div class="card shadow-sm">
         
          <div class="card-body pt-0">
             
              </form>
              
              <a type="button" data-toggle="modal" data-target="#changePassword">Change Password</a>
             
          </div>
        </div>
            
              </div>
      </div>
    </div>
  </div>
</div>  
</div>
                 
              </div>

          </div>
        </div>
      </div>
 
    
<%@ include file="footerHod.jsp" %>

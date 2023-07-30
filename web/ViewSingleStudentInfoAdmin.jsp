    <%@page import="dao.IndividualStudentDao"%>
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
    
    if( unique_key==null || !unique_key.equals("admin"))
    {
        session.invalidate();
        response.sendRedirect("login.jsp");
    }
    

String enrollment =(String)session.getAttribute("enrollment");
System.out.println("single"+    enrollment);
IndividualStudentDao iStudent = new IndividualStudentDao();
StudentDto student = new StudentDto();
student = iStudent.getIndividualStudentData(enrollment);


%>
<nav class="navbar navbar-default">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">AdminStrap</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="homeAdmin.jsp">Dashboard</a></li>
            <li><a href="student.jsp">Student</a></li>
            <li><a href="faculty.jsp">Faculty</a></li>
            <li><a href="hod.jsp">Hod</a></li>
            <li><a href="admin.jsp">Admin</a></li>
            <li><a href="admin.jsp">Complaints</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Welcome, Brad</a></li>
            <li><a href="logout.jsp">Logout</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <header id="header">
      <div class="container">
        <div class="row">
          <div class="col-md-10">
            <h1><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Dashboard <small>Manage Your Site</small></h1>
          </div>
          <div class="col-md-2">
            <div class="dropdown create">
              <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Create Content
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a type="button" data-toggle="modal" data-target="#addStudent">Add Student</a></li>
                <li><a type="button" data-toggle="modal" data-target="#addManager">Add Faculty</a></li>
                <li><a type="button" data-toggle="modal" data-target="#addManager">Add Hod</a></li>
                <li><a type="button" data-toggle="modal" data-target="#addManager">Add Admin</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </header>

    <section id="breadcrumb">
      <div class="container">
        <ol class="breadcrumb">
          <li class="active">Dashboard</li>
        </ol>
      </div>
    </section>

    <section id="main">
      <div class="container">
        <div class="row">
          <div class="col-md-2">
            <div class="list-group">
              <a href="homeAdmin.jsp" class="list-group-item active main-color-bg">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Dashboard
              </a>
              <%
                  GetCountInfo count = new GetCountInfo();
              %>
              <a href="ViewStudentFaculty.jsp" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Students List <span class="badge"><%= count.getStudentCount() %></span></a>
              <a href="AssignmentPageOfFaculty.jsp" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Assignments <span class="badge"><%= count.getFacultyCount() %></span></a>
              <a href="ComplainPageOfFaculty.jsp" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Complaints <span class="badge"><%= count.getHodCount() %></span></a>
              <a href="NoticePageOfFaculty.jsp" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Notices <span class="badge"><%= count.getAdminCount() %></span></a>
            </div>

           
          </div>          


                  <div class="col-md-10">
            
            <div class="panel panel-default">
              <div class="panel-heading main-color-bg">
                <h3 class="panel-title">Website Overview</h3>
              </div>
                 <form method="post" action="IdManData">
<div class="panel-body">
                  <div class="student-profile py-4">
  <div class="container">
    <div class="row">
      <div class="col-lg-2">
        <div class="card shadow-sm">
          <div class="card- header bg-transparent text-center"><h3><%= student.getStudent_name() %></h3></div>
          <div class="card-body">
            <p class="mb-0" name="manager_id"><strong class="pr-1">Enrollment:</strong><%= student.getEnrollment_number() %></p>
            <p class="mb-0" name="category"><strong class="pr-1">Branch:</strong><%= student.getBranch() %></p>
            <p class="mb-0"><strong class="pr-1">Email :</strong><%= student.getEmail() %></p>
          </div>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent border-0">
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>General Information</h3>
          </div>
          <div class="card-body pt-0">
             
            <table class="table table-bordered">
               <tr>
                <th width="30%">Enrollment Number</th>
                <td width="2%">:</td>
                <td><%= student.getEnrollment_number() %></td>
              </tr>
                <tr>
                <th width="30%">Full Name</th>
                <td width="2%">:</td>
                <td><%= student.getStudent_name() %></td>
              </tr>
              <tr>
                <th width="30%">Date Of Birth</th>
                <td width="2%">:</td>
                <td><%= student.getDob() %></td>
              </tr>
              <tr>
                <th width="30%">Gender</th>
                <td width="2%">:</td>
                <td><%= student.getGender() %></td>
              </tr>
              <tr>
                <th width="30%">Mobile</th>
                <td width="2%">:</td>
                <td><%= student.getMobile() %></td>
              </tr>
              <tr>
                <th width="30%">Address</th>
                <td width="2%">:</td>
                <td><%= student.getAddress() %></td>
              </tr>
                <tr>
                <th width="30%">Course</th>
                <td width="2%">:</td>
                <td><%= student.getCourse() %></td>
              </tr>
                <tr>
                <th width="30%">Branch</th>
                <td width="2%">:</td>
                <td><%= student.getBranch() %></td>
              </tr>
                <tr>
                <th width="30%">Aadhar</th>
                <td width="2%">:</td>
                <td><%= student.getAadhar() %></td>
              </tr>
                <tr>
                <th width="30%">Adminssion Year</th>
                <td width="2%">:</td>
                <td><%= student.getAdmission_year() %></td>
              </tr>
                <tr>
                <th width="30%">Blood Group</th>
                <td width="2%">:</td>
                <td><%= student.getBlood_group() %></td>
              </tr>
                
            </table>
          
        </div>
         <div style="height: 26px"></div>
        <div class="card shadow-sm">
         
         
              </form>
               <div class="card-body pt-0">
            
              <form method="post" action="IndividualStudentGetData">
                                
                                <button class="btn btn-default"  >Edit</button> 
                                
                                <input type="text" name="enrollment" hidden value="<%= student.getEnrollment_number() %>">
                                <a class="btn btn-danger"  href="DeleteData?uid=<%= student.getEnrollment_number() %>&cat=student ">Delete</a>
                                
                                  <a href="student.jsp" >Back</a>
                            </form>
            
             
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
 
    </section>

    <footer id="footer">
      <p>Copyright AdminStrap, &copy; 2017</p>
    </footer>

    <!-- Modals -->

<!-- Change Pass-->

 
    <div class="modal fade" id="changePassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form method="post" action="ChangePassword">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Change Password</h4>
      </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Old Password</label>
          <input type="password" name="opass" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      
           
      <div class="modal-body">
        <div class="form-group">
            <label>New Password</label>
          <input type="password" name="npass" class="form-control" placeholder="Page Title">
        </div>
     </div>
           
      <div class="modal-body">
        <div class="form-group">
          <label>Retype New Password</label>
          <input type="password" name="rnpass" class="form-control" placeholder="Page Title">
        </div>
     </div>
           
         
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Change</button>
      </div>
    </form>
    </div>
  </div>
</div>


   <!-- Modals -->
      <!-- Add Complaint -->
    <div class="modal fade" id="addComplaint" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form method="post" action="addComplaint">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Complaint</h4>
      </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Category</label>
          <select name="category">
              <option value="technical">Technical Issue</option>
              <option value="academics">Academics</option>
              <option value="other">Other</option>
          </select>
        </div>
     </div>
     <div class="modal-body">
        <div class="form-group">
          <label>Complain to</label>
          <select name="complain to ">
              <option value="hod">Hod</option>
              <option value="admin">Admin</option>
              
          </select>
        </div>
     </div>
          
          <div class="modal-body">
        <div class="form-group">
          <label>Specefic</label>
          <select name="specefic">
              <option value="hod">Hod</option>
              <option value="admin">Admin</option>
              
          </select>
        </div>
     </div>
    <div class="modal-body">
      <label>Description</label>
        <div class="form-group">
         
          <textarea  name="complaint_description" rows="4" cols="50"></textarea>
        </div>
     </div>
    
          
    
           
         
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Generate Complaint</button>
      </div>
    </form>
    </div>
  </div>
</div>
      <!-- Add Manager -->
    <div class="modal fade" id="addManager" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form method="post" action="InsertManagerData">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Faculty Info</h4>
      </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Manager id</label>
          <input type="text" name="manager_id" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Manager Name</label>
          <input type="text" name="manager_name" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Date Of Birth</label>
          <input type="text" name="dob" class="form-control" placeholder="Page Title">
        </div>
     </div> 
          
      <div class="modal-body">
        <div class="form-group">
          <label>Email Id</label>
          <input type="email" name="email" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Password</label>
          <input type="Password" name="password" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
            <label>Mobile</label>
          <input type="password" name="mobile" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Address</label>
          <input type="text" name="address" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
           <div class="modal-body">
        <div class="form-group">
          <label>qualification</label>
          <input type="text" name="qualification" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Experience</label>
          <input type="text" name="experience" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Category</label>
          <select name="category" >
              <option value="faculty">Faculty</option>
              <option value="hod">Hod</option>
              <option value="admin">Admin</option>
          </select>
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Branch</label>
          <input type="text" name="branch" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Subjects</label>
          <input type="text" name="subjects" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
    
      <div class="modal-body">
        <div class="form-group">
          <label>Aadhar</label>
          <input type="text" name="aadhar" class="form-control" placeholder="Page Title">
        </div>
     </div>
              
      <div class="modal-body">
        <div class="form-group">
          <label>Specialization</label>
          <input type="text" name="specialization" class="form-control" placeholder="Page Title">
        </div>
     </div>
          

      <div class="modal-body">
        <div class="form-group">
          <label>Gender</label>
          <select  name="gender"  >
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="other">Others</option>
          </select>
           
        </div>
     </div>
           
      <div class="modal-body">
        <div class="form-group">
          <label>Joining Year</label>
          <input type="text" name="joining  _year" class="form-control" placeholder="Page Title">
        </div>
     </div>
           
     
           
         
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Add Faculty</button>
      </div>
    </form>
    </div>
  </div>
</div>

    
  <script>
     CKEDITOR.replace( 'editor1' );
 </script>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>

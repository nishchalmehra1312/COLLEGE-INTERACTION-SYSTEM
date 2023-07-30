<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.NoticeDao"%>
<%@page import="java.util.Random"%>
<%@page import="dao.GetCountInfo"%>
<!DOCTYPE html>
<html lang="en">
  <head>
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
   
%>
    <footer id="footer">
      <p>Copyright AdminStrap, &copy; 2017</p>
    </footer>

    <!-- Modals -->

   <!-- Modals -->
      <!-- Add Student -->
    <div class="modal fade" id="addStudent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form method="post" action="InsertStudentData">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Student Info</h4>
      </div>
      <%
          int maxNumber=8189621;
          Random rand = new Random();
          int enrollment=rand.nextInt(maxNumber);
          String enrollmentNum=String.valueOf(enrollment);
          session.setAttribute("enrollmentOfStudent", enrollmentNum);
      %>    
      <div class="modal-body">
        <div class="form-group">
            <label>Enrollment Number</label><q>Self Generated</q>
          <span style="color:red;"><%= enrollmentNum %></span>
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Student Name</label>
          <input type="text" name="student_name" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
   
          
      <div class="modal-body">
        <div class="form-group">
          <label>F Name</label>
          <input type="text" name="fname" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>email</label>
          <input type="email" name="email" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
            <label>Password</label>
          <input type="password" name="password" class="form-control" placeholder="Page Title">
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
          <label>Date of birth</label>
          <input type="text" name="dob" class="form-control" placeholder="Page Title">
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Course</label>
          <input type="text" name="course" class="form-control" placeholder="Page Title">
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
          <label>Contact</label>
          <input type="text" name="mobile" class="form-control" placeholder="Page Title">
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
          <label>Admission Year</label>
          <input type="text" name="admission_year" class="form-control" placeholder="Page Title">
        </div>
     </div>
           
      <div class="modal-body">
        <div class="form-group">
          <label>Blood Group</label>
          <input type="text" name="blood_group" class="form-control" placeholder="Page Title">
        </div>
     </div>
           
         
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Add Student</button>
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
          <input type="text" name="mobile" class="form-control" placeholder="Page Title">
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
          <input type="text" name="joining_year" class="form-control" placeholder="Page Title">
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

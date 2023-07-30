<%@page import="dto.ResponseComplaintDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.IndividualResponseComplaintDao"%>
<%@page import="dto.ComplaintDto"%>
<%@page import="dao.IndividualComplaintDao"%>
<%@page import="dao.GetCountInfo"%>
<%@page import="dto.ManagerDto"%>
<%@page import="dao.ManagersDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Iterator"%>
<%@page import="dto.StudentDto"%>
<%@page import="dto.StudentDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.StudentDao"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Area | Users</title>
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
    
String id=(String)session.getAttribute("id");
int complaintId=(int)session.getAttribute("complaintId");

IndividualComplaintDao comp = new IndividualComplaintDao();
ComplaintDto complaint=new ComplaintDto();
        
complaint =comp.getIndividualComplaintData(complaintId);

%>
   
<%@ include file="headerAdmin.jsp" %>
    <section id="breadcrumb">
      <div class="container">
        <ol class="breadcrumb">
          <li><a href="homeAdmin.jsp">Dashboard</a></li>
          <li class="active">Users</li>
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
              <a href="student.jsp" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Student <span class="badge"><%= count.getStudentCount() %></span></a>
              <a href="faculty.jsp" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Faculty <span class="badge"><%= count.getFacultyCount() %></span></a>
              <a href="hod.jsp" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Hod <span class="badge"><%= count.getHodCount() %></span></a>
              <a href="admin.jsp" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Admin <span class="badge"><%= count.getAdminCount() %></span></a>
            </div>

           
  
           
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
      
      <div class="col-lg-6">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent border-0">
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Response</h3>
          </div>
          <div class="card-body pt-0">
              <form method="post" action="ReplyComplaint">
            <table class="table table-bordered">
               <tr>
                <th width="30%">Complaint Id</th>
                <td width="2%">:</td>
                <td><%= complaint.getComplaintId() %></td>
              </tr>
                <tr>
                <th width="30%">Description</th>
                <td width="2%">:</td>
                <td><%= complaint.getDescription() %></td>
              </tr>
              <tr>
                <th width="30%">Issued Date</th>
                <td width="2%">:</td>
                <td><%= complaint.getIssuedDate() %></td>
              </tr>
              <tr>
                <th width="30%">Complaint By</th>
                <td width="2%">:</td>
                <td><%= complaint.getIssuerId() %></td>
              </tr>
              <tr>
                <th width="30%">Reply</th>
                <td width="2%">:</td>
                <td><textarea rows="3" cols="45" name="reply"></textarea></td>
              </tr>
              <button class="btn btn-danger">Submit</button>
                
            </table>
              </form>
        </div>
         <div style="height: 26px"></div>
        <div class="card shadow-sm">
         
          <div class="card-body pt-0">
                <a href="adminComplaints.jsp" >Back</a>
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
   <!--replies SEction -->           
              
     <div class="row">
         <div class="col-md-2"></div>
              <div class="col-md-10">
            
            <div class="panel panel-default">
              <div class="panel-heading main-color-bg">
                <h3 class="panel-title">Replies</h3>
              </div>
                 
<div class="panel-body">
                  <div class="student-profile py-4">
  <div class="container">
    <div class="row">
      
      <div class="col-lg-6">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent border-0">
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Reply Of the complaint Given By You</h3>
          </div>
          <div class="card-body pt-0">
              <form method="post" action="ReplyComplaint">
            <table class="table table-bordered">
               <tr>
                <th width="30%">Response Id</th>
                <th width="30%">Description</th>
                <th width="40%">Response Date</th>
              </tr>
              <%
                IndividualResponseComplaintDao responses = new IndividualResponseComplaintDao();
                List<ResponseComplaintDto> l1 = new ArrayList<ResponseComplaintDto>();
                l1=responses.getResponse(complaint.getComplaintId());
                Iterator<ResponseComplaintDto> i1 = l1.iterator();
                while(i1.hasNext())
                {
                    ResponseComplaintDto response1=new ResponseComplaintDto(); 
                    response1=i1.next();
                %>
                <tr>
                
               <td><%= response1.getResponseId()%></td>
                <td><%= response1.getReply()%></td>
                <td><%= response1.getReplyDate()%></td>
              </tr>
              <% } %>
              
              
                
            </table>
              </form>
        </div>
         <div style="height: 26px"></div>
        <div class="card shadow-sm">
         
          <div class="card-body pt-0">
                <a href="adminComplaints.jsp" >Back</a>
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
      <!-- reply end -->        
  </div>
</div>  
</div>
                 
              </div>

          </div>
        </div>
   
   <!--section end -->
      </div>
 
    </section>

    <footer id="footer">
      <p>Copyright AdminStrap, &copy; 2017</p>
    </footer>

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
          
      <div class="modal-body">
        <div class="form-group">
          <label>Enrollment Number</label>
          <input type="text" name="enrollment_number" class="form-control" placeholder="Page Title">
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
          <label>Enrollment Number</label>
          <input type="text" class="form-control" placeholder="Page Title">
        </div>
     </div> 
          
      <div class="modal-body">
        <div class="form-group">
          <label>Enrollment Number</label>
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

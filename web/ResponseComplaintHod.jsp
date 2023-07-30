<%@page import="dto.ResponseComplaintDto"%>
<%@page import="dto.ResponseComplaintDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.IndividualResponseComplaintDao"%>
<%@page import="dto.ComplaintDto"%>
<%@page import="dao.IndividualComplaintDao"%>
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
  
<%
    String unique_key = (String)session.getAttribute("unique_key");
    System.out.println("Response Complaint = "+unique_key);
         System.out.println(unique_key);
    
    if( unique_key==null || !unique_key.equals("hod"))
    {
        session.invalidate();
        response.sendRedirect("login.jsp");
    }
    
String id = (String)session.getAttribute("id");
int complaintId=(int)session.getAttribute("complaintId");

IndividualComplaintDao comp = new IndividualComplaintDao();
ComplaintDto complaint=new ComplaintDto();
        
complaint =comp.getIndividualComplaintData(complaintId);

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
                <a href="ComplainPageOfHod.jsp" >Back</a>
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
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Reply Of the complaint</h3>
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
                <a href="ComplainPageOfHod.jsp" >Back</a>
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
            <label>Complain to :</label><br>
           <label>Hod's</label>
          <select name="hodId">
              <option value="null">None</option>
              <%
                      
                          ManagersDao s1=new ManagersDao();
                          List<ManagerDto> listHod = s1.getAllManagerData("hod");
                          Iterator<ManagerDto> itr=listHod.iterator();
                          while(itr.hasNext())
                          {
                            ManagerDto managers = new ManagerDto();
                            managers=itr.next();
                          
                      %>

              
                      <option value="<%= managers.getManager_id() %>"><%= managers.getName() %></option>
              <% }
              %>
          </select>
           <label>Admin</label>
          <select name="adminId">
              <option value="nurll">None</option>
               <%
                      
                          ManagersDao s2=new ManagersDao();
                          List<ManagerDto> l2 = s1.getAllManagerData("admin");
                          Iterator<ManagerDto> itr1=l2.iterator();
                          while(itr1.hasNext())
                          {
                            ManagerDto managers2 = new ManagerDto();
                            managers2=itr1.next();
                          
                      %>

              
                      <option value="<%= managers2.getManager_id() %>"><%= managers2.getName() %></option>
              <% }
              %>
              
          </select>
        </div>
     </div>
          
          <div class="modal-body">
        <div class="form-group">
          
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

      <!-- Add Assignment -->
    <div class="modal fade" id="addAssignment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form method="post" action="InsertAssignment">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Assignments</h4>
      </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Student List</label>
          <select  name="assignedTo">
              <option value="1" >All</option>
              <%
                   StudentDao s=new StudentDao();
                          List<StudentDto> l = s.getAllStudentData();
                          Iterator<StudentDto> it=l.iterator();
                          while(it.hasNext())
                          {
                            StudentDto student = new StudentDto();
                            student=it.next();
              %>
              <option value="<%= student.getEnrollment_number() %>"><%= student.getStudent_name() %></option>
          <%
              }
          %>
          </select>
           
        </div>
     </div>
           
      <div class="modal-body">
          
          <label>Description</label>
        <div class="form-group">
          <textarea name="description" rows="4" cols="40"></textarea>
        </div>
     </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Due Date</label>
          <input type="date" name="dueDate"/>
        </div>
     </div>
           
     
           
         
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Post Assignment</button>
      </div>
    </form>
    </div>
  </div>
</div>
    
              <!-- Add Notices -->
    <div class="modal fade" id="addNotice" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form method="post" action="InsertNotice">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Notice</h4>
      </div>
          
      <div class="modal-body">
        <div class="form-group">
          <label>Student List</label>
          <select  name="issuedTo">
              <option value="ALL" >All</option>
              <%
                   it=l.iterator(); 
                          while(it.hasNext())
                          {
                            StudentDto student = new StudentDto();
                            student=it.next();
              %>
              <option value="<%= student.getEnrollment_number() %>"><%= student.getStudent_name() %></option>
          <%
              }
          %>
          </select>
           
        </div>
     </div>
           
      <div class="modal-body">
          
          <label>Description</label>
        <div class="form-group">
          <textarea name="description" rows="4" cols="40"></textarea>
        </div>
     </div>
          
      
           
     
           
         
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Post Notice</button>
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

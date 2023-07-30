
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
                          List<ManagerDto> l3 = s1.getAllManagerData("hod");
                          Iterator<ManagerDto> itrManager=l3.iterator();
                          while(itrManager.hasNext())
                          {
                            ManagerDto managers = new ManagerDto();
                            managers=itrManager.next();
                          
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

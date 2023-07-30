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
  <body>
<%
     String unique_key = (String)session.getAttribute("unique_key");
    
         System.out.println(unique_key);
    
    if( unique_key==null || !unique_key.equals("hod"))
    {
        session.invalidate();
        response.sendRedirect("login.jsp");
    }
    
String id =(String)session.getAttribute("id");
int complaintId=(int)session.getAttribute("complaintId");

IndividualComplaintDao comp = new IndividualComplaintDao();
ComplaintDto complaint=new ComplaintDto();
        
complaint =comp.getIndividualComplaintData(complaintId);

%>
    
    
<%@ include file="headerHod.jsp" %>

           
          </div>            


             
      
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
                List<ResponseComplaintDto> listHod = new ArrayList<ResponseComplaintDto>();
                listHod=responses.getResponse(complaint.getComplaintId());
                Iterator<ResponseComplaintDto> i1 = listHod.iterator();
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
                <a href="ComplainPageOfFaculty.jsp" >Back</a>
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

    
<%@ include file="footerHod.jsp" %>

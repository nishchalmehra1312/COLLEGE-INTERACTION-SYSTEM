
<nav class="navbar navbar-default">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><%= (String)session.getAttribute("id") %></a>
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
              <li><a href="#">Welcome, <%= (String)session.getAttribute("id") %></a></li>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>Shopping List App</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i><i> Show / Hide</i></a>
      </li>
    </ul>

    
    
  </nav>
  <!-- /.navbar -->

    <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Product Logo -->
    <a href="main-page" class="brand-link">
      <img src="dist/img/photo.png" alt="My List" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">My List</span>
    </a>

    <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          
          <li class="nav-item">
                <br><br>
                <a href="main-page" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Item list</p>
                </a>
                
                <br>
          </li>
              <li class="nav-item">
                <a href="item-form" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Add Item</p>
                </a>
              </li>
            </ul>
      
      </nav>
      <!-- /.sidebar-menu -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 style="text-align: right;">Shopping list</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              
              <!-- /.card-header -->
              <!-- /.card-body -->
             
            </div>
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">You should buy:</h3>
                <div class="card-tools">
                
                <a href="item-form" class="btn btn-warning"> <i
					class="fas fa-plus-square"></i> Add new Item
				</a>
                  
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered">
                  <thead>                  
                    <tr>
                      <th style="text-align: center;">ID</th>
                      <th style="text-align: center;">Name</th>
                      <th style="text-align: center;">Done</th>
                      <th style="text-align: center;">Update or Delete</th>
                      
                    </tr>
                  </thead>
                  <tbody>
                  
                  <c:forEach var="item" items="${itemList}">
                  
                   <tr style="text-align: center;">
                      <td>${item.id}</td>
                      
                      	<c:if test="${!item.done}">
                      
                      <td><strong>${item.name}</strong></td>
                     
                        </c:if>
                        
                        <c:if test="${item.done}">
                      
                      <td style="text-decoration: line-through; text-align: center;">${item.name}</td>
                     
                        </c:if>
                        
                        
                      <td style="text-align: center;">
                     	
                        	<c:if test="${item.done}">
                        		<i class="fas fa-check"></i>
                        		
                        	</c:if>
                    	
                          	<c:if test="${!item.done}">
			       				<i class="fas fa-times"></i>
                            	
                   			</c:if>
                     
                      </td>
                      
                      <td class="text-center">
						
						<div class="btn-group">
						
						<a href="item-update-form?id=${item.id}" class="btn btn-info">
                            <i class="fas fa-edit"></i>
                          </a>
						</div>
						<div class="btn-group">
						
							<button type="button" class="btn btn-info"
								data-toggle="modal"
								data-target="#delete-modal-${item.id}">
								<i class="fas fa-trash"></i>
							</button>
						</div>
					</td>
				</tr>
	
	
				<div class="modal fade" id="delete-modal-${item.id}">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">Delete Item</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p>Are you sure you want to delete this item from your list?</p>
								<strong></strong>
							</div>
							<div class="modal-footer justify-content-between">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancel</button>
								<a href="item-delete?id=${item.id}"
									class="btn btn-danger">Delete</a>
	
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
                      
                   
                  </c:forEach>
                  
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                
              </div>
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
      <p>Created By: <a href="http://www.emirtotic.com" target="_blank"> Emir Totic</a>.</p>
    </div>
    <!-- Default to the left -->
    Java Spring Boot Application.
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
</body>
</html>

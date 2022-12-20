<%@page import="java.util.List"%>

<%@page import="Beans.User" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">
            
            <div class="container-fluid">
                <%@include file="components/message.jsp" %>
                
            </div>
            
            
            <div class="row mt-3">
                <!--users column-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px; max-height: 50px" class="img-fluid rounded-circle" src="img/add-friend.png" alt="">
                            </div>
                            <h1>123</h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                    
                </div>
                <!--categories column-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center ">
                            <div class="container">
                                <img style="max-width: 100px; max-height: 50px" class="rounded-circle" src="img/list.png" alt="">
                            </div>
                            <h1>Welcome</h1> 
                            <h1 class="text-uppercase text-muted">BookShop</h1>
                        </div>
                    </div>
                </div>
                <!--products column-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px; max-height: 50px" class="rounded-circle" src="img/products.png" alt="">
                            </div>
                            <h1>5556</h1>
                            <h1 class="text-uppercase text-muted">Books</h1>
                        </div>
                    </div>
                </div>     
            </div>
            
            <!--second row-->
            <div class="row mt-3">
                <!--column 1-->
                <div class="col-md-6">
                     <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px; max-height: 50px" class="rounded-circle" src="img/categories.png" alt="">
                            </div>
                            <p class="mt-2">Click here to add book</p>
                            <h1 class="text-uppercase text-muted">Add Books</h1>
                        </div>
                    </div>
                </div>
                
                <!--column 2-->
                <div class="col-md-6">
                     <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px;max-height: 50px" class="rounded-circle" src="img/plus.png" alt="">
                            </div>
                            <p class="mt-2">Click here to update book</p>
                            <h1 class="text-uppercase text-muted">Update Books</h1>
                        </div>
                    </div>
                </div>
                
            </div>
            
        </div>
        
        <!--add category model-->
 

        <!-- Modal -->
    <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header custom-bg text-white">
            <h5 class="modal-title" id="exampleModalLabel">Fill Book details</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            
              <form action="BookOperationServlet" method="post" enctype = "multipart/form-data">
                  
                  <input type="hidden" name="operation" value="addBook">
                  
                  <div class="form-group">
                      <input type="text" class="form-control" name="isbn" placeholder="Enter ISBN" />
                  </div> 
                  <div class="form-group">
                      <input type="text" class="form-control" name="title" placeholder="Enter Title" />
                  </div> 
                  <div class="form-group">
                      <input type="text" class="form-control" name="author" placeholder="Enter Author" />
                  </div> 
                  <div class="form-group">
                      <input type="text" class="form-control" name="genre" placeholder="Enter Genre"  />
                  </div> 
                  <div class="form-group">
                      <input type="number" class="form-control" name="price" placeholder="Enter Price"  />
                  </div> 
                  <div class="form-group">
                      <input type="number" class="form-control" name="copies" placeholder="Enter No of Copies"  />
                  </div> 
                    <!--Book file-->
                                  <div class="form-group">
                                      <label for="bPic">Select Picture of Book</label>
                                      <br>
                                      <input type="file" name="bPic" id="bPic" />
                                </div> 
                  
                  
                  
                  
                  <div class="container text-center">
                      <button class="btn btn-outline-success">Add Book</button>
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  </div>
                  
              </form>
              
              
          </div>
          
        </div>
      </div>
    </div>
        
        
        
        
        <!--ennd category model-->
        
<!--        update model-->
                

                <!-- Modal -->
                <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Update Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
               <form action="BookOperationServlet" method="post" enctype = "multipart/form-data">
                  
                  <input type="hidden" name="operation" value="updateBook">
                  
                  <div class="form-group">
                      <input type="number" class="form-control" name="bookId" placeholder="Enter Book Id"  />
                  </div> 
                  <div class="form-group">
                      <input type="text" class="form-control" name="isbn" placeholder="Enter ISBN"  />
                  </div> 
                  <div class="form-group">
                      <input type="text" class="form-control" name="title" placeholder="Enter Title"  />
                  </div> 
                  <div class="form-group">
                      <input type="text" class="form-control" name="author" placeholder="Enter Author"  />
                  </div> 
                  <div class="form-group">
                      <input type="text" class="form-control" name="genre" placeholder="Enter Genre"  />
                  </div> 
                  <div class="form-group">
                      <input type="number" class="form-control" name="price" placeholder="Enter Price"  />
                  </div> 
                  <div class="form-group">
                      <input type="number" class="form-control" name="copies" placeholder="Enter No of Copies"  />
                  </div> 
                    <!--Book file-->
                                  <div class="form-group">
                                      <label for="bPic">Select Picture of Book</label>
                                      <br>
                                      <input type="file" name="bPic" id="bPic"  />
                                </div> 
                  
                  
                  
                  
                  <div class="container text-center">
                      <button class="btn btn-outline-success">Update Book</button>
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  </div>
                  
              </form>
                          
                          
                          
                      </div>
                     
                    </div>
                  </div>
                </div>

        
<!--            end product model-->
<br>   
<br>
<div class="d-flex justify-content-center">
      <div class="p-2 bd-highlight">
                <form action="login.jsp" class="form-inline my-2 my-lg-0">
                         <button name="submit" type="submit" class="btn btn-primary custom-bg">Logout</button>
                </form>  
       </div>
</div>


    </body>
</html>

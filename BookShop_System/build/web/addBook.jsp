
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
            
            
      
 

        <!-- Modal -->
<div class="container-fluid">
                   
                <div class="row mt-5"> 
                   <div class="col-md-4 offset-md-4">
                       <div class="card">
                           <%@include file="components/message.jsp" %>
                           <div class="card-body px-5">

                                <h3 class="text-center my-3">Add Book</h3>
                                <form action="AddBook" method="post" enctype = "multipart/form-data">
                  
                                    

                                    <div class="form-group">
                                        <input type="text" class="form-control" name="isbn" placeholder="Enter ISBN" required />
                                    </div> 
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="title" placeholder="Enter Title" required />
                                    </div> 
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="author" placeholder="Enter Author" required />
                                    </div> 
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="genre" placeholder="Enter Genre" required />
                                    </div> 
                                    <div class="form-group">
                                        <input type="number" class="form-control" name="price" placeholder="Enter Price" required />
                                    </div> 
                                    <div class="form-group">
                                        <input type="number" class="form-control" name="copies" placeholder="Enter No of Copies" required />
                                    </div> 
                                      <!--Book file-->
                                                   

                                  <div class="form-group">
                                      <label for="Pic">Select Picture of Book</label>
                                      <br>
                                      <input type="file" name="Pic" id="Pic" />
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
        </div>
        <!--ennd model-->
        

<br>   
<br>
<div class="d-flex justify-content-center">
      <div class="p-2 bd-highlight">
                <form action="admin.jsp" class="form-inline my-2 my-lg-0">
                         <button name="submit" type="submit" class="btn btn-primary custom-bg">Back</button>
                </form>  
       </div>
</div>


    </body>
</html>

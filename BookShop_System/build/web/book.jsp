<%-- 
    Document   : book
    Created on : Nov 26, 2022, 1:55:26 PM
    Author     : 
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Database.DatabaseManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
       <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
        
                <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">        


        <!--javascript-->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       
       </head>
    <body>

<br>

<div class="container">
    
        <%@include file="components/message.jsp" %>

 <div class="d-flex flex-row bd-highlight mb-3">
            <div class="p-2 bd-highlight">
                <form action="SearchServlet" method="Post">
                    <input type="text" name="search" placeholder="Search">
                    <button type="submit">Search</button>
                </form>
            </div>
     
            <div class="p-2 bd-highlight">
                <form action="history.jsp" class="form-inline my-2 my-lg-0">
                         <button name="submit" type="submit" class="btn btn-primary custom-bg">History</button>
                </form>   

            </div>
            <div class="p-2 bd-highlight">
                <form action="login.jsp" class="form-inline my-2 my-lg-0">
                         <button name="submit" type="submit" class="btn btn-primary custom-bg">Logout</button>
                </form>  
            </div>

  </div>
 
    
  </div>

 


<br>



<div class="container">
  <div class="row">
    <div class="col-12">
		<table class="table table-image">
		  <thead>
		    <tr>
		      <th scope="col">ID</th>
                      <th scope="col">ISBN</th>
		      <th scope="col">Title</th>
		      <th scope="col">Author</th>
                      <th scope="col">Genre</th>
                      <th scope="col">Price</th>
		      <th scope="col">Copies</th>
		      <th scope="col">Image</th>
                      <th scope="col">Purchase</th>
                      
                      
		    </tr>
		  </thead>
		  <tbody>
                   <%
                       int bookId;
                       try{
                            Connection con=DatabaseManager.getConnection();
                            Statement st=con.createStatement();
                            ResultSet rs=st.executeQuery("select * from books ");
                            while(rs.next())
                            { 
                            bookId=rs.getInt(1);
                   %>   
		    <tr>
		      <th scope="row"><%=rs.getInt(1)%></th>
		      <td><%=rs.getString(2)%></td>
		      <td><%=rs.getString(3)%></td>
		      <td><%=rs.getString(4)%></td>
                      <td><%=rs.getString(5)%></td>
		      <td><%=rs.getString(6)%></td>
                      <td><%=rs.getString(7)%></td>
                      <td class="w-25">
			      <img src="img/<%=rs.getString(8)%>" class="img-fluid img-thumbnail"  width="100" height="100" alt="Pic Not Found"></td>
     
            <td><form action="purchaseServlet" method="post">
                
                    <input type="hidden" name="bookId" value="<%=bookId%>">

                 
		<input type="submit" value="Purchase"></td>
                       
                 </tr>
           	<% 		
              
                    
                    
                    
                    }

            }catch(Exception e)
            {
            System.out.println(e);	
            }
            %> 
		  </tbody>
		</table>   
    </div>
  </div>
</div>

  
                  
                  

    </body>
</html>

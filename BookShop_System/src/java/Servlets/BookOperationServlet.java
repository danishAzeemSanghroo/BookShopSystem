/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Beans.Book;
import Beans.User;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author 
 */

@MultipartConfig
public class BookOperationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String op = request.getParameter("operation");
            //out.println(op);
            
               if(op.equals("addBook"))
               {
              
                   //fetching book data 
                String isbn=request.getParameter("isbn");
                String title=request.getParameter("title");
                String author=request.getParameter("author");
                String genre=request.getParameter("genre");
                int price=Integer.parseInt(request.getParameter("price"));
                int copies=Integer.parseInt(request.getParameter("copies"));
                Part part = request.getPart("bPic");
               
              // out.println(isbn+":"+title+":"+author+":"+genre+":"+price+":"+copies+":"+part.getSubmittedFileName());
               
               //creating user object to store data
              Book bookBean = new Book();
            
                bookBean.setIsbn(isbn);
                bookBean.setTitle(title);
                bookBean.setAuthor(author);
                bookBean.setGenre(genre);
                bookBean.setPrice(price);
                bookBean.setCopies(copies);
                bookBean.setCoverImage(part.getSubmittedFileName());
            
               int row = Database.DatabaseManager.addBook(bookBean);
                    if(row>0)
                    {
                        //pic upload , find out the path to upload photo
                        String path = request.getRealPath("img") +  File.separator + part.getSubmittedFileName();
                        System.out.println(path);

                        FileOutputStream fos = new FileOutputStream(path);

                        InputStream is = part.getInputStream();

                        //reading data
                        byte []data = new byte[is.available()];
                        is.read();

                        //writing the data
                        fos.write(data);

                        fos.close();
                        is.close();
                        
                        
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("message","Book Added Successfully");
                        response.sendRedirect("admin.jsp");
                        return;
                    }
               }

               else if(op.equals("updateBook"))
               {
                         //fetching book data 
                int bookId=Integer.parseInt(request.getParameter("bookId"));   
                String isbn=request.getParameter("isbn");
                String title=request.getParameter("title");
                String author=request.getParameter("author");
                String genre=request.getParameter("genre");
                int price=Integer.parseInt(request.getParameter("price"));
                int copies=Integer.parseInt(request.getParameter("copies"));
                Part part = request.getPart("bPic");
               
              // out.println(isbn+":"+title+":"+author+":"+genre+":"+price+":"+copies+":"+part.getSubmittedFileName());
               
               //creating user object to store data
              Book bookBean = new Book();
              
                bookBean.setBookId(bookId);
                bookBean.setIsbn(isbn);
                bookBean.setTitle(title);
                bookBean.setAuthor(author);
                bookBean.setGenre(genre);
                bookBean.setPrice(price);
                bookBean.setCopies(copies);
                bookBean.setCoverImage(part.getSubmittedFileName());
            
               int row = Database.DatabaseManager.updateBook(bookBean);
                    if(row>0)
                    {
                        //pic upload , find out the path to upload photo
                        String path = request.getRealPath("img") +  File.separator + part.getSubmittedFileName();
                        System.out.println(path);

                        FileOutputStream fos = new FileOutputStream(path);

                        InputStream is = part.getInputStream();

                        //reading data
                        byte []data = new byte[is.available()];
                        is.read();

                        //writing the data
                        fos.write(data);

                        fos.close();
                        is.close();
                        
                        
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("message","Book Updated Successfully");
                        response.sendRedirect("admin.jsp");
                        return;
                   }       
               }            
               
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(BookOperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(BookOperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
     public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

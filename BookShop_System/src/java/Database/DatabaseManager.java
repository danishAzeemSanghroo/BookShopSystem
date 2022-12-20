
package Database;




import Beans.Book;
import Beans.History;
import Beans.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

public class DatabaseManager {

    
    // private static String fac_id;

   

    public static Connection getConnection() throws Exception {  
         Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookShopSystem","root","root");
        System.out.println("Connection Successful " + con);
        return con;
    }
  	public static int addRegister(User userBean)throws Exception{
		String query="INSERT into user (userName,userEmail,userPassword,userAge,userPhone,userAddress,userBalance) values ('"+userBean.getUserName()+"','"+userBean.getUserEmail()+"','"+userBean.getUserPassword()+"','"+userBean.getUserAge()+"','"+userBean.getUserPhone()+"','"+userBean.getUserAddress()+"','"+userBean.getUserBalance()+"') ";
		System.out.println(query);
		
		Statement st=null;
		try{
			st=getConnection().createStatement();
			int rows=st.executeUpdate(query);
			return rows;
		}finally{
			if (st!=null)
			st.close();
		}
	} 

	public static int addBook(Book bookBean)throws Exception{
		String query="INSERT into books (isbn,title,author,genre,price,copies,coverImage) values ('"+bookBean.getIsbn()+"','"+bookBean.getTitle()+"','"+bookBean.getAuthor()+"','"+bookBean.getGenre()+"',"+bookBean.getPrice()+","+bookBean.getCopies()+",'"+bookBean.getCoverImage()+"') ";
		System.out.println(query);
		
		Statement st=null;
		try{
			st=getConnection().createStatement();
			int rows=st.executeUpdate(query);
			return rows;
		}finally{
			if (st!=null)
			st.close();
		}
	}         
        
	public static int addHistory(History bean)throws Exception{
		String query="INSERT into history (bookId,title,author) values ("+bean.getBookId()+",'"+bean.getTitle()+"','"+bean.getAuthor()+"') ";
		System.out.println(query);
		
		Statement st=null;
		try{
			st=getConnection().createStatement();
			int rows=st.executeUpdate(query);
			return rows;
		}finally{
			if (st!=null)
			st.close();
		}
	}         
        
        
    public static User getUser(String userEmail) throws Exception {
 		String query="select * from user where userEmail='"+userEmail+"' ";
                System.out.println(query);
		Statement st=null;
		ResultSet result=null;
                User bean=null;
		try{
			st=getConnection().createStatement();
			result=st.executeQuery(query);
			
			while(result.next()){
				bean=new User();	
				bean.setUserId(result.getInt("userId") );
				bean.setUserName(result.getString("userName") );
				bean.setUserPassword(result.getString("userPassword") );
                                bean.setUserEmail(result.getString("userEmail"));
				bean.setUserAge(result.getInt("userAge"));
                                bean.setUserPhone(result.getString("userPhone"));
                                bean.setUserAddress(result.getString("userAddress"));
                                bean.setUserBalance(result.getInt("userBalance"));
				
			}
			return bean;
		}finally{
			if(result!=null)result.close();
			if(st!=null)st.close();
		} 
    } 
    
	public static int updateBook(Book book)throws Exception{
            
            String query="UPDATE books set isbn='"+book.getIsbn()+"', title='"+book.getTitle()+"' , author ='"+book.getAuthor()+"'  , genre='"+book.getGenre()+"' , price="+book.getPrice()+", copies="+book.getCopies()+", coverImage='"+book.getCoverImage()+"'  where bookId="+book.getBookId();
		System.out.println(query);
		
		Statement st=null;
		try{
			st=getConnection().createStatement();
			int rows=st.executeUpdate(query);
			return rows;
		}finally{
			if (st!=null)
			st.close();
		}
	}       

    public static Book getBook(String search) throws Exception {
 
 		String query="select * from books where title='"+search+"' ";
                System.out.println(query);
		Statement st=null;
		ResultSet result=null;
                Book bean=null;
		try{
			st=getConnection().createStatement();
			result=st.executeQuery(query);
			
			while(result.next()){
				bean=new Book();
                                //isbn,title,author,genre,price,copies,coverImage
				bean.setBookId(result.getInt("bookId") );
				bean.setIsbn(result.getString("isbn") );
				bean.setTitle(result.getString("title") );
                                bean.setAuthor(result.getString("author"));
				bean.setGenre(result.getString("genre"));
                                bean.setPrice(result.getInt("price"));
                                bean.setCopies(result.getInt("copies"));
                                bean.setCoverImage(result.getString("coverImage"));
				
			}
			return bean;
		}finally{
			if(result!=null)result.close();
			if(st!=null)st.close();
		} 
    
    
    
    }

}

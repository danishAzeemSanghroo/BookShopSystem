/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Beans;

/**
 *
 * @author 
 */
public class History {
    
    int bookId;
    int historyId;
    String title;
    String author;

    public History() {
    }

    public History(int bookId, int historyId, String title, String author) {
        this.bookId = bookId;
        this.historyId = historyId;
        this.title = title;
        this.author = author;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getHistoryId() {
        return historyId;
    }

    public void setHistoryId(int historyId) {
        this.historyId = historyId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Override
    public String toString() {
        return "History{" + "bookId=" + bookId + ", historyId=" + historyId + ", title=" + title + ", author=" + author + '}';
    }
    
    
    
}

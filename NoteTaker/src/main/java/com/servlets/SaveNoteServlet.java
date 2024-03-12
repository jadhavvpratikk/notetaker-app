package com.servlets;

import com.entities.Note;
import com.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;


public class SaveNoteServlet extends HttpServlet
{
    private static final long serialVersionUID=1L;
    public SaveNoteServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            System.out.println("Servlet doPost method invoked");
            //title content fetch
            String title = req.getParameter("title");
            String content = req.getParameter("content");

            Note note = new Note(title,content,new Date());

            //  System.out.println(note.getId() + " : " + note.getContent());
            Session session = FactoryProvider.getfactory().openSession();
            Transaction tc = session.beginTransaction();
            session.persist(note);
            tc.commit();
            session.close();

            resp.setContentType("text/html");
            PrintWriter out = resp.getWriter();
            out.println("<h1 style='text-align:center;'> Note is added successfully. </h1>");
            out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View all notes</a></h1>");


        }catch(Exception e){
            e.printStackTrace();
        }
    }
}

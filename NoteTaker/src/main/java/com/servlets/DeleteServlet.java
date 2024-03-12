package com.servlets;

import com.entities.Note;
import com.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.io.IOException;

public class DeleteServlet extends HttpServlet {

    private static final long serialVersionUID=1L;

    public DeleteServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int noteId = Integer.parseInt(req.getParameter("note_id").trim());
            Session s = FactoryProvider.getfactory().openSession();
            Transaction tc = s.beginTransaction();
            Note note = (Note)s.get(Note.class,noteId);
            s.remove(note);
            tc.commit();
            s.close();
            resp.sendRedirect("all_notes.jsp");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}

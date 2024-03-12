<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.entities.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Add Notes </title>
    <%@include file = "all_js_css.jsp" %>
</head>
<body>
    <div class="container">
    <%@include file="navbar.jsp" %>
    <h1> Edit your note </h1>
    <br>

    <%
    int noteId = Integer.parseInt(request.getParameter("note_id").trim());
    Session s = FactoryProvider.getfactory().openSession();
    Note note = (Note)s.get(Note.class,noteId);
    %>

        <form action="UpdateServlet" method="post">
           <input value="<%= note.getId() %>" name="noteId" type="hidden"/>
             <div class="mb-3">
                 <label for="title" class="form-label">Note title</label>
                 <input
                 required name="title"
                 type="text"
                 class="form-control"
                 id="title"
                 aria-describedby="emailHelp"
                 placeholder="Enter title here"
                 value="<%= note.getTitle() %>"
                 />
             </div>
             <div class="mb-3">
                  <label for="content" class="form-label">Note Content</label>
                  <textarea
                  required name="content"
                  id="content"
                  class="form-control"
                  placeholder="Enter your content here"
                  style="height:300px;"><%= note.getContent() %></textarea>
             </div>
             <div class="container text-center">
                   <button type="submit" class="btn btn-success">Save your note</button>
             </div>

        </form>


    </div>
</body>
</html>
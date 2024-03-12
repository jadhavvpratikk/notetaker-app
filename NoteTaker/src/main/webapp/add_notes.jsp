<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Add Notes </title>
    <%@include file="all_js_css.jsp" %>
</head>
<body>
    <div class="container">
            <%@include file="navbar.jsp" %>
            <br>
            <h1>Please fill your Note details</h1>
            <br>
            <!-- this is add note form -->
            <form action="SaveNoteServlet" method="post">
              <div class="mb-3">
                <label for="title" class="form-label">Note title</label>
                <input required name="title" type="text" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter title here"/>
              </div>
              <div class="mb-3">
                <label for="content" class="form-label">Note Content</label>
                <textarea required name="content" id="content" class="form-control" placeholder="Enter your content here" style="height:300px;"></textarea>
              </div>
              <div class="container text-center">
              <button type="submit" class="btn btn-primary">Add</button>
              </div>
            </form>


        </div>

</body>
</html>

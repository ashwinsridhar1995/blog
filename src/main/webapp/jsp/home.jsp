<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>The Final Blog</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/thecss.css" rel="stylesheet"> 
        <link href='https://fonts.googleapis.com/css?family=Bungee' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Cabin' rel='stylesheet'>
    </head>
    <body>
        <div class="container">
            <h1>The Final Blog</h1>
            <hr/>

            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/home">The Final Blog</a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/home">Home</a>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown"
                               href="${pageContext.request.contextPath}/home">
                                User <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/post">
                                        Create Post
                                    </a></li>
                                <li><a href="${pageContext.request.contextPath}/displayCategorysPage">
                                        Category
                                    </a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown"
                               href="${pageContext.request.contextPath}/admin">
                                Admin <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/admin">
                                        Admin
                                    </a></li>
                                <li><a href="${pageContext.request.contextPath}/post">
                                        Create Post
                                    </a></li>
                                <li><a href="${pageContext.request.contextPath}/displayCategorysPage">
                                        Category
                                    </a></li>
                                <li><a href="${pageContext.request.contextPath}/approvePosts">
                                        Approve Post</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span>Login</a>
                        </li>
                    </ul>
                </div>
            </nav>

            <sec:authorize access="isAuthenticated()">
                <form class="form-inline" 
                      method="POST" 
                      action="${pageContext.request.contextPath}/logout">
                    <input type="hidden" 
                           name="${_csrf.parameterName}" 
                           value="${_csrf.token}"/>
                    <label for="submit">
                        Hello : ${pageContext.request.userPrincipal.name}&nbsp;&nbsp;&nbsp;|
                    </label>
                    <button class="btn btn-link" 
                            id="submit" 
                            type="submit">Logout</button>
                </form>
            </sec:authorize>

            <div class="row">

                <!-- SHOWING ALL POSTS -->
                <div class="col-md-8">
                    <div class="card" style="width: 100%;">
                        <h2>All Posts</h2>
                        <hr/>
                        <c:forEach var="currentPost" items="${postList}">
                            <c:if test="${currentPost.state == 1}">
<<<<<<< HEAD
                            <div class="card-body">
                                <h3><c:out value="${currentPost.title}"/></h3>
                                <b><p>Date: <c:out value="${currentPost.date}"/></p></b>
                                <b><p>Category: <c:out value="${currentPost.category.name}"/></p></b>
                                <p readonly class="card-text" style="width: 50%; height: 50%">
                                    ${currentPost.content}
                                </p>
                                <c:forEach var="currentTag" items="${currentPost.tags}">
                                    <a href="displayTagPosts?id=${currentTag.id}" class="badge badge-pill badge-light">${currentTag.name} </a>
                                </c:forEach>
                                <td>
                                    <a href="editPost?id=${editPost.id}">
                                       Edit
                                    </a>
                                </td>
                            </div>
                            <hr/>
=======
                                <div class="card-body">
                                    <h3><c:out value="${currentPost.title}"/></h3>
                                    <b><p>Date: <c:out value="${currentPost.date}"/></p></b>
                                    <b><p>Category: <c:out value="${currentPost.category.name}"/></p></b>
                                    <p readonly class="card-text" style="width: 50%; height: 50%">
                                        ${currentPost.content}
                                    </p>
                                    <c:forEach var="currentTag" items="${currentPost.tags}">
                                        <a href="displayTagPosts?id=${currentTag.id}" class="badge badge-pill badge-light">${currentTag.name} </a>
                                    </c:forEach>

                                    <p>
                                        <a href="editPost?id=${currentPost.id}" class="btn btn-warning">
                                            Edit
                                        </a>
                                        <a href="deletePost?id=${currentPost.id}" class="btn btn-danger">
                                            Delete
                                        </a>
                                    </p>
                                </div>
                                <hr/>
>>>>>>> f1307b0889244cf773fe7ac621e62a2580adf7a9
                            </c:if>
                        </c:forEach>
                    </div>
                </div>

                <!-- SHOWING ALL CATEGORIES -->
                <div class="col-md-4">
                    <h2>Categories</h2>
                    <hr/>
                    <c:forEach var="currentCat" items="${catList}">
                        <h3>
                            <a href="displayCatPosts?id=${currentCat.id}">
                                <c:out value="${currentCat.name}"/></a>
                        </h3>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>


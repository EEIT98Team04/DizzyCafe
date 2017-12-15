<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>dizzy</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hongwen/css/head.css" />
    <script src="js/search.js"></script>
</head>
<body style="background-color: #fff1cc;">
    <div class="title_field">
        <jsp:include page="/HTML/Navbar.jsp" />
    </div>
    <div class="container">
        <h2>歡迎光臨咖啡論壇</h2>
        <!--<p>Contextual classes can be used to color table rows or table cells. The classes that can be used are: .active, .success, .info, .warning, and .danger.</p>-->
        <table class="table">
            <thead>
                <tr class="danger">
                    <th>留言板</th>
                    <th>人氣</th>
                </tr>
            </thead>
            <tbody>
                <tr class="success">
                    <td><a href="${pageContext.request.contextPath}/hongwen/document.jsp">咖啡品種產地版</a></td>
                    <td>76543</td>
                </tr>
                <tr class="success">
                    <td><a href="${pageContext.request.contextPath}/hongwen/document.jsp">咖啡烘焙版</a></td>
                    <td>6543</td>
                </tr>
                <tr class="success">
                    <td><a href="${pageContext.request.contextPath}/hongwen/document.jsp">咖啡沖泡方式版</a></td>
                    <td>7654</td>
                </tr>
                <tr class="success">
                    <td><a href="${pageContext.request.contextPath}/hongwen/document.jsp">咖啡烘培器具版</a></td>
                    <td>87654</td>
                </tr>
                <tr class="success">
                    <td><a href="${pageContext.request.contextPath}/hongwen/document.jsp">咖啡沖泡器具版</a></td>
                    <td>87654</td>
                </tr>
                <tr class="success">
                    <td><a href="${pageContext.request.contextPath}/hongwen/document.jsp">咖啡閒聊版</a></td>
                    <td>65432</td>
                </tr>
            </tbody>
        </table>
    </div>
                    <!--<c:forEach var="array" items="${select}">
                        <c:url value="/pages/product.jsp" var="path" scope="page">
                            <c:param name="id" value="${array[0]}" />
                            <c:param name="name" value="${array[1]}" />
                        </c:url>
                        <tr>
                            <td><a href="${path}">${array[0]}</a></td>
                            <td>${array[1]}</td>
                        </tr>
                    </c:forEach>-->                
   </body>
</html>

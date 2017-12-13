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
        title
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
                    <td><a href="document.html">咖啡品種產地版</a></td>
                    <td>76543</td>
                </tr>
                <tr class="success">
                    <td><a href="document.html">咖啡烘焙版</a></td>
                    <td>6543</td>
                </tr>
                <tr class="success">
                    <td><a href="document.html">咖啡沖泡方式版</a></td>
                    <td>7654</td>
                </tr>
                <tr class="success">
                    <td><a href="document.html">咖啡烘培器具版</a></td>
                    <td>87654</td>
                </tr>
                <tr class="success">
                    <td><a href="document.html">咖啡沖泡器具版</a></td>
                    <td>87654</td>
                </tr>
                <tr class="success">
                    <td><a href="document.html">咖啡閒聊版</a></td>
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
    <!--<script type="text/javascript">
        $(function(){
            console.log("Get into js");

            $('a').on('submit',function(){
                // console.log('submit');
                event.preventDefault();
                var that = $(this),
                            url='',
                            method='',
                            data={};

                that.find('[name]').each(function(index,value){
                    // console.log(value);
                    var that = $(this),
                                name=that.attr('name'),
                                value=that.val();

                    data[name] = value;
                });

                var tt = JSON.stringify(data);
                console.log(tt);

                $.ajax({
                    url:url,
                    type:method,
                    data:data,
                    success:function(response){
                        console.log("ajax response")
                    }
                })


                return false;
            })
        });
    </script>-->
</body>
</html>

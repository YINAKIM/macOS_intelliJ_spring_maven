<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kim-yina
  Date: 2021/05/02
  Time: 8:57 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>exUpload</title>
</head>

<body>

<%--한번에 여러 파일업로드 --%>
<form action='exUploadPost' method='post' enctype='multipart/form-data'>

    <div>
        <input type='file' name='files'>
    </div>
    <div>
        <input type='file' name='files'>
    </div>
    <div>
        <input type='file' name='files'>
    </div>
    <div>
        <input type='file' name='files'>
    </div>
    <div>
        <input type='file' name='files'>
    </div>
    <div>
        <input type="button" type="submit" src="/sample/exex">
    </div>
    <div>
        <input type='submit'>
    </div>

</form>

</body>

</html>
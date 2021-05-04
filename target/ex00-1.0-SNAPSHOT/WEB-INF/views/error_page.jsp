<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kim-yina
  Date: 2021/05/03
  Time: 11:20 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>예외처리 페이지</h2>
<h4><c:out value="${exception.getMessage()}"/></h4>

<ul>
    <c:forEach items="${exception.getStackTrace()}" var="stack">
    <li><c:out value="${stack}"/></li>
    </c:forEach>


<%--
    @GetMapping("/ex04")
    public String ex04(SampleDTO dto,@ModelAttribute("page") int page)에 대해

    [1] 예외상황 없는 요청
    데이터타입에 맞는 요청 보냄 => /sample/ex04?name=이나&age=10&page=9

    [2] 예외상황 만듦
    데이터타입에 부적절한 요청 보냄 => /sample/ex04?name=이나&age=스무살&page=9
    int형 age에 "스무살"이라고 문자열 전송


    *** 에러나는거 확인 ***
    CommonExceptionAdvice 에서 SampleDTO의 property에 대해 유효성 체크하고 에러메세지보냄

    ERROR: org.zerock.exception.CommonExceptionAdvice - Exception..............org.springframework.validation.BeanPropertyBindingResult: 1 errors
    Field error in object 'sampleDTO' on field 'age': rejected value [스무살];
    codes [typeMismatch.sampleDTO.age,typeMismatch.age,typeMismatch.int,typeMismatch];
            arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [sampleDTO.age,age]; arguments []; default message [age]]; default message [Failed to convert property value of type 'java.lang.String' to required type 'int' for property 'age'; nested exception is java.lang.NumberFormatException: For input string: "스무살"]
    ERROR: org.zerock.exception.CommonExceptionAdvice - {exception=org.springframework.validation.BindException:
            org.springframework.validation.BeanPropertyBindingResult: 1 errors
            Field error in object 'sampleDTO' on field 'age': rejected value [스무살];

    codes [typeMismatch.sampleDTO.age,typeMismatch.age,typeMismatch.int,typeMismatch];
            arguments [org.springframework.context.support.DefaultMessageSourceResolvable:
    codes [sampleDTO.age,age]; arguments []; default message [age]];
            default message [Failed to convert property value of type 'java.lang.String' to required type 'int' for property 'age';
            nested exception is java.lang.NumberFormatException: For input string: "스무살"]}


    ****** 잘못된 요청에 예외페이지로 오는 경로 확인 ******
    /ex04?~~요청
    > SampleController
    > ex04 핸들러
    > BeanValidationException 발생 (BeanPropertyBindingResult : rejected value [~~])
    > springframework.context.support.DefaultMessageSourceResolvable 에서 에러상황 인지 : typeMismatch
    > @ControllerAdvice 붙은 CommonExceptionAdvice
    > @ExceptionHandler 붙은 except(Exception ex, Model model) 핸들러
    > Exception.class : 모든 Exception에 대해 model에 "exception"이름으로 담아  리턴력"error_page"
    > error_page.jsp 로 매핑
    > ${exception.getMessage()} / ${exception.getStackTrace()} : jstl로 exception의 get~()실행된 내용 출력

    --%>
</ul>
</body>
</html>

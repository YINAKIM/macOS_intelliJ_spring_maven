<%--
  Created by IntelliJ IDEA.
  User: kim-yina
  Date: 2021/05/04
  Time: 10:43 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>custom404</title>
</head>
<body>
<%--브라우저에서 존재하지 않는 페이지를 요청하면 이 페이지가 뜨도록 - custom404--%>
<h1>해당 URL은 존재하지 않습니다!</h1>


<%--
    ▶︎ 스프링에서 에러처리 페이지를 custom할 때 jsp파일위치는
      InternalViewResolver에 property로 설정한 루트경로에 맞춰서 위치시킨다.

      --> 뷰페이지에 커스텀 에러페이지를 보여주려면 해당 뷰페이지로 mapping해야하고,
          그러려면 다른 뷰페이지 매핑하듯이 InternalViewResolver에 지정한
          경로(preffix)와 확장자(suffix)에 맞춰야
          스프링이 mapping해줄 수 있기 때문

    ▶ 매핑순서
    [1] 구동시 첫번째로 스캔되는 web.xml 에서 에러상황에 대해 어떻게 할지 설정
       <init-param><!--404 에러처리-->
            <param-name>throwExceptionIfNoHandlerFound</param-name>
            <param-value>true</param-value>
        </init-param>

        => 스프링이 이거 보고 에러나면 핸들러가 없을 경우에는
           @ExceptionHandler(스프링에서 예외처리하는 어노테이션)를 찾아야되는구나 하고인지함

    [2] 스프링MVC로 들어오는 모든 요청을 처리하는 dispatcher-servlet.xml에서
         1. 예외처리 컴포넌트를 스캔하도록 베이스패키지 지정 :   <context:component-scan base-package="org.zerock.exception"/>
         2. InternalResourceViewResolver를 Bean으로 등록하면서 (스프링의 관리대상)
            <beans:property> 로 지정한 경로(preffix)와 확장자(suffix)를 보고

         3. throwExceptionIfNoHandlerFound 상황임을 인지
         4. @ExceptionHandler 찾음
            4-1. 내부서버에러면(500에러) 그냥 @ExceptionHandler만으로 처리
            4-2. 매핑 에러면 (404, PageNotFound) @ExceptionHandler + @ResponseStatus(HttpStatus어떤상태값인지.상수로지정)
         5. 각각 예외처리 핸들러에 지정된 예외처리 작업 진행 후
         6. 각각 예외처리 핸들러에 지정된 뷰이름으로 "뷰페이지" 찾아서
         7. 스프링MVC로 들어오는 모든 요청을 처리하는 dispatcher-servlet.xml에서 지정한 경로로 가서 "뷰페이지"찾음
         8-1. 거기 해당 커스텀"뷰페이지"가 있으면 ? 그걸로 mapping해줌
         8-2. 만약 갔는데 해당 커스텀"뷰페이지"가 없다면 ? *서버에 내장된 에러페이지 (브라우저 기본 에러페이지로 보이는) 를 보여줌

         * 서버에 내장된 에러페이지 : 서버에 WEB_INF/jsp 폴더 안에
            apache-tomcat-9.0.45/webapps/host-manager/WEB-INF/jsp/404.jsp

--%>

</body>
</html>

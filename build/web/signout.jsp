<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%

    if (session != null) {
        session.invalidate();
    }
    response.sendRedirect("index.jsp");
%>

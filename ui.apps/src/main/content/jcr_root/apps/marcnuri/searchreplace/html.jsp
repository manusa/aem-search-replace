<%@ page import="com.day.cq.search.QueryBuilder" %>
<%@ page import="javax.jcr.Session" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.day.cq.search.PredicateGroup" %>
<%@ page import="com.day.cq.search.Query" %>
<%@ page import="com.day.cq.search.result.SearchResult" %>
<%@page session="false"%>
<%
%><%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling" %><%
%><%@taglib prefix="ui" uri="http://www.adobe.com/taglibs/granite/ui/1.0" %><%
%><%@taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %><%
%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%
%><%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%
%><%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%
%><sling:defineObjects /><%
    SearchResult searchResult = null;
    final String path = request.getParameter("path");
    final String property = request.getParameter("property");
    final String propertyOperation = request.getParameter("property_operation");
    final Session session = resourceResolver.adaptTo(Session.class);
    final QueryBuilder queryBuilder = resourceResolver.adaptTo(QueryBuilder.class);
    if (path != null && !path.isEmpty()) {
        final Map<String, String> predicates = new HashMap<>();
        predicates.put("path", path);
        predicates.put("p.limit", "-1");
        final Query query = queryBuilder.createQuery(PredicateGroup.create(predicates), session);
        query.setStart(0);
        query.setHitsPerPage(999L);

        searchResult = query.getResult();
    } else {
        searchResult = null;
    }
    request.setAttribute("searchResult", searchResult);
%>
<html>
    <head>
        <ui:includeClientLib css="marcnuri.searchreplace.base" />
        <title>MN - Search and Replace</title>
    </head>
    <body>
        <%@include file="form.jsp"%>
        <c:if test="${searchResult != null}" >
            ${searchResult.totalMatches}
            <ul>
                <c:forEach items="${searchResult.resources}" var="node">
                    <li>${node.path}</li>
                </c:forEach>
            </ul>
        </c:if>
        <ui:includeClientLib js="marcnuri.searchreplace.base" />
    </body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Perform</title>
    <style>
        body {
            font-family: "Times New Roman", Serif
        }
        table {
            margin: 0 auto;
            border: 1px solid black;
            border-collapse: separate;
            padding: 1.2em;
            max-width: 34em;
        }
        th {
            font-weight: bold;
            text-align: left;
        }
        td, th {
            border: 1px solid black;
            padding: 1.31em;
        }
        #submit {
            display: block;
            margin: 0 auto;
            padding: 0 2.4em;
            font-size: 0.9em;
        }
        .warning {
            text-align: center;
            color: red;
        }
    </style>
</head>
<body>
<c:forEach items="${warnings}" var="warning">
    <p class="warning"><c:out value = "${warning}"/></p>
</c:forEach>
<hr/>
<table>
    <tr>
        <th>First Number</th>
        <th>Second Number</th>
        <c:if test = "${operations.doSum}">
            <th>Sum</th>
        </c:if>
        <c:if test = "${operations.doDifference}">
            <th>Difference</th>
        </c:if>
        <c:if test = "${operations.doProduct}">
            <th>Product</th>
        </c:if>
    </tr>
    <tr>
        <td><c:out value="${values.x}"/></td>
        <td><c:out value="${values.y}"/></td>
        <c:if test = "${operations.doSum}">
            <td><c:out value="${values.s}"/></td>
        </c:if>
        <c:if test = "${operations.doDifference}">
            <td><c:out value="${values.d}"/></td>
        </c:if>
        <c:if test = "${operations.doProduct}">
            <td><c:out value="${values.p}"/></td>
        </c:if>
    </tr>
</table>
<hr/>
    <form action="./">
        <input hidden type="number" name="x" value="${values.x}"/>
        <input hidden type="number" name="y" value="${values.y}"/>
        <input hidden type="checkbox" name="o" value="s" <c:if test="${operations.doSum}">checked="checked"</c:if>/>
        <input hidden type="checkbox" name="o" value="d" <c:if test="${operations.doDifference}">checked="checked"</c:if>/>
        <input hidden type="checkbox" name="o" value="p" <c:if test="${operations.doProduct}">checked="checked"</c:if>/>
        <input id="submit" type="submit" value="Return to Home Page">
    </form>
<hr/>
</body>
</html>
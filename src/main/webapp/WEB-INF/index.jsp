<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Operations</title>
    <style>
        body {
            font-family: "Times New Roman", Serif
        }
        table {
            margin: 1.1em auto 1.35em auto;
            border: 1px solid black;
            border-collapse: separate;
            padding: 0.65em;
        }
        td {
            border: 1px solid black;
            padding: 10px;
        }
        #submit {
            width: 100%;
        }
        #checkbox-list {
            padding: 0;
            margin: 0;
            list-style: none;
            float: left;
        }
        .input-number {
            width: 11.4em;
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
<form action="perform">
    <table>
        <tr>
            <td>First Number</td>
            <td>
                <input class="input-number" type="number" name="x" value="${values.x}" required/>
            </td>
        </tr>
        <tr>
            <td>Second Number</td>
            <td>
                <input class="input-number" type="number" name="y" value="${values.y}" required/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
              <ul id="checkbox-list">
                <li><input type="checkbox" name="o" value="s" <c:if test="${operations.doSum}">checked="checked"</c:if>/> Sum</li>
                <li><input type="checkbox" name="o" value="d" <c:if test="${operations.doDifference}">checked="checked"</c:if>/> Difference</li>
                <li><input type="checkbox" name="o" value="p" <c:if test="${operations.doProduct}">checked="checked"</c:if>/> Product</li>
              </ul>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="submit" type="submit" value="Perform Selected Operations"/>
            </td>
        </tr>
    </table>
</form>
<hr/>
</body>
</html>
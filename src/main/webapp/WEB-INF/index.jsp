<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=0.6">
    <title>Operations</title>
    <style>
        body {
            font-family: "Times New Roman", Serif;
            font-size: 100%;
        }
        table {
            margin: 1.1em auto 1.35em auto;
            border: 0.063em solid black;
            border-collapse: separate;
            padding: 0.65em;
        }
        td {
            border: 0.063em solid black;
            padding: 0.625em;
        }
        input {
            font-size: 0.834em;
        }
        input[type="checkbox"] {
            height: 1em;
            width: 1em;
        }
        hr {
            border-width: 0.063em;
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
        #warnings {
            padding: 0;
            margin: 0;
            list-style: none;
            text-align: center;
            color: red;
        }
    </style>
</head>
<body>
<ul id="warnings">
    <c:forEach items="${warnings}" var="warning">
        <li><c:out value = "${warning}"/></li>
    </c:forEach>
</ul>
<hr/>
<form onsubmit="validateForm(event);" action="./perform" accept-charset="UTF-8">
    <table>
        <tr>
            <td><label for="x">First Number</label></td>
            <td>
                <input class="input-number" type="number" name="x" id="x" value="${values.x}" required/>
            </td>
        </tr>
        <tr>
            <td><label for="y">Second Number</label></td>
            <td>
                <input class="input-number" type="number" name="y" id="y" value="${values.y}" required/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
              <ul id="checkbox-list">
                <li><input type="checkbox" name="o" value="s" id="s" <c:if test="${operations.doSum}">checked="checked"</c:if>/> <label for="s">Sum</label></li>
                <li><input type="checkbox" name="o" value="d" id="d" <c:if test="${operations.doDifference}">checked="checked"</c:if>/> <label for="d">Difference</label></li>
                <li><input type="checkbox" name="o" value="p" id="p" <c:if test="${operations.doProduct}">checked="checked"</c:if>/> <label for="p">Product</label></li>
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
<script>
    function validateForm(event) {
        var checkboxWarning = document.getElementById("checkbox-warning");
        if (document.contains(checkboxWarning)) {
            checkboxWarning.remove();
        }

        var checkboxes = document.querySelectorAll("input[type=\"checkbox\"]");
        var checkedOne = Array.prototype.slice.call(checkboxes).some(x => x.checked);
        if (!checkedOne) {
            event.preventDefault()
            var listItem = document.createElement("li");
            var listItemText = document.createTextNode("Please select at least one checkbox.");
            listItem.appendChild(listItemText);
            listItem.setAttribute("id", "checkbox-warning");
            document.getElementById("warnings").appendChild(listItem);
        }
    }
</script>
</body>
</html>
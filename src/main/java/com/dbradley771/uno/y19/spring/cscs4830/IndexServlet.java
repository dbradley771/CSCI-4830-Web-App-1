package com.dbradley771.uno.y19.spring.cscs4830;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@WebServlet(urlPatterns = "/")
public class IndexServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
			ServletException,
			IOException {
		Map<String, Long> values = new HashMap<>();
		Map<String, Boolean> operations = new HashMap<>();
		List<String> warnings = new ArrayList<>();

		final String xString = request.getParameter("x");
		if(xString != null && !xString.trim().isEmpty()) {
			try {
				values.put("x", Long.valueOf(xString));
			} catch(NumberFormatException e) {
				warnings.add("Please enter a valid first number.");
			}
		}

		final String yString = request.getParameter("y");
		if(yString != null && !yString.trim().isEmpty()) {
			try {
				values.put("y", Long.valueOf(yString));
			} catch(NumberFormatException e) {
				warnings.add("Please enter a valid second number.");
			}
		}

		final String[] operationRequest = request.getParameterValues("o");
		if(operationRequest != null) {
			if(Arrays.asList(operationRequest).contains("s")) {
				operations.put("doSum", true);
			}

			if(Arrays.asList(operationRequest).contains("d")) {
				operations.put("doDifference", true);
			}

			if(Arrays.asList(operationRequest).contains("p")) {
				operations.put("doProduct", true);
			}
		}

		request.setAttribute("values", values);
		request.setAttribute("operations", operations);
		request.setAttribute("warnings", warnings);
		request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
	}
}
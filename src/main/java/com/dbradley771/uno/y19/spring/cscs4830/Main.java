package com.dbradley771.uno.y19.spring.cscs4830;

import org.apache.catalina.LifecycleException;
import org.apache.catalina.WebResourceRoot;
import org.apache.catalina.core.StandardContext;
import org.apache.catalina.startup.Tomcat;
import org.apache.catalina.webresources.DirResourceSet;
import org.apache.catalina.webresources.StandardRoot;

import java.io.File;

public final class Main {
	private Main() {
	}

	public static void main(String[] args) throws LifecycleException {
		final String defaultPort = "8080";
		final String contextPath = "/";
		final String webappDirLocation = "src/main/webapp/";
		final String buildPath = "target/classes";
		final String webAppMount = "/WEB-INF/classes";

		final Tomcat tomcat = new Tomcat();

		//The port that we should run on can be set into an environment variable
		//Look for that variable and use the default port if it isn't there.
		String webPort = System.getProperty("PORT", defaultPort);
		tomcat.setPort(Integer.valueOf(webPort));

		final StandardContext
				context =
				(StandardContext) tomcat.addWebapp(contextPath, new File(webappDirLocation).getAbsolutePath());

		// Declare an alternative location for your webAppMount dir
		// Servlet 3.0 annotation will work
		final File additionalWebInfClasses = new File(buildPath);
		final WebResourceRoot resources = new StandardRoot(context);
		resources.addPreResources(new DirResourceSet(resources,
				webAppMount,
				additionalWebInfClasses.getAbsolutePath(),
				contextPath));
		context.setResources(resources);

		tomcat.start();
		tomcat.getServer().await();
	}
}

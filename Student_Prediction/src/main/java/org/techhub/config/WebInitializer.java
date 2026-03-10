package org.techhub.config;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRegistration;

public class WebInitializer implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
		context.register(WebMVCConfig.class);
		DispatcherServlet ds = new DispatcherServlet(context);

		ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", ds);
		servlet.addMapping("/");
		servlet.setLoadOnStartup(1);

		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
		ctx.register(DBConfig.class);
	}

}

package edu.spps.config;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRegistration;

public class WebInitializer implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {

		AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
		rootContext.register(DBConfig.class);

		servletContext.addListener(new ContextLoaderListener(rootContext));

		AnnotationConfigWebApplicationContext servletContextConfig = new AnnotationConfigWebApplicationContext();
		servletContextConfig.register(WebMVCConfig.class);

		DispatcherServlet dispatcherServlet = new DispatcherServlet(servletContextConfig);

		ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispatcherServlet);

		servlet.setLoadOnStartup(1);
		servlet.addMapping("/");
	}
}
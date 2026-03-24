package edu.spps.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.servlet.util.matcher.MvcRequestMatcher;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http, HandlerMappingIntrospector introspector)
			throws Exception {

		MvcRequestMatcher.Builder mvc = new MvcRequestMatcher.Builder(introspector);

		http.csrf(csrf -> csrf.disable()).headers(headers -> headers.frameOptions(frame -> frame.disable()))
				.authorizeHttpRequests(auth -> auth
						.requestMatchers(mvc.pattern("/"), mvc.pattern("/LandingPage"), mvc.pattern("/login"),
								mvc.pattern("/resources/**"), mvc.pattern("/CSS/**"), mvc.pattern("/JS/**"),
								mvc.pattern("/images/**"), mvc.pattern("/videos/**"), mvc.pattern("/WEB-INF/**"))
						.permitAll().requestMatchers(mvc.pattern("/admin/**")).hasRole("ADMIN")
						.requestMatchers(mvc.pattern("/teacher/**")).hasRole("TEACHER")
						.requestMatchers(mvc.pattern("/student/**")).hasRole("STUDENT").anyRequest().authenticated())
				.formLogin(form -> form.loginPage("/login").loginProcessingUrl("/login")
						.defaultSuccessUrl("/dashboard", true).failureHandler((request, response, exception) -> {
							request.getSession().setAttribute("loginError", "Invalid Username or Password");
							response.sendRedirect(request.getContextPath() + "/");
						}))
				.logout(logout -> logout.logoutSuccessUrl("/?logout=true"));

		return http.build();
	}
}
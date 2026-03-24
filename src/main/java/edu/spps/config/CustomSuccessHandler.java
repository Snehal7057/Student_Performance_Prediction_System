package edu.spps.config;

import java.io.IOException;
import java.util.Collection;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CustomSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		Collection<? extends GrantedAuthority> roles = authentication.getAuthorities();

		for (GrantedAuthority role : roles) {
			String contextPath = request.getContextPath();

			if (role.getAuthority().equals("ROLE_ADMIN")) {
				response.sendRedirect(contextPath + "/admin/dashboard");
				return;
			}

			else if (role.getAuthority().equals("ROLE_TEACHER")) {
				response.sendRedirect(contextPath + "/teacher/dashboard");
				return;
			}

			else if (role.getAuthority().equals("ROLE_STUDENT")) {
				response.sendRedirect(contextPath + "/student/dashboard");
				return;
			}
		}

		response.sendRedirect("/login?error");
	}
}
package com.lzcb.bigitem.Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lzcb.bigitem.Entity.Tuser;

/**
 * Servlet Filter implementation class LogonFilter
 */
@WebFilter("/JSP/*")
public class LogonFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LogonFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpSession session = httpRequest.getSession();
		Tuser user = (Tuser)session.getAttribute("user");
		if(user==null){
			//httpRequest.setAttribute("msg", "未登录或登录过期！");
			httpRequest.getRequestDispatcher("/index.jsp").forward(request, response);
			//((HttpServletResponse)response).sendRedirect("/Bigitem/index.jsp");
		}else
			chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

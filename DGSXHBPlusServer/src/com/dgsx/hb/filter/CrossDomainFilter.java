package com.dgsx.hb.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class CrossDomainFilter
 */
@WebFilter("*.do")
public class CrossDomainFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CrossDomainFilter() {
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
		// TODO Auto-generated method stub
		HttpServletResponse res = (HttpServletResponse) response;  
		  
		// 这里最好不要写通配符，如果允许多个域请求数据的话，可以直接用逗号隔开："http://www.baidu.com,http://google.com"  
		  
		res.setHeader("Access-Control-Allow-Origin", "*");  
		  
		res.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");  
		  
		res.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization, Accept,X-Requested-With");  
		  
		//res.setHeader("Access-Control-Allow-Credentials","false"); 
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

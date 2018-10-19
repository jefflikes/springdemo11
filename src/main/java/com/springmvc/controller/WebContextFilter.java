package com.springmvc.controller;


import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by jeff on 2018/5/10.
 */

public class WebContextFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletResponse httpResponse=(HttpServletResponse)  servletResponse;
        httpResponse.setHeader("Access-Control-Allow-Origin","*");
        httpResponse.setHeader("Access-Control-Allow-Headers","Authentication");
        filterChain.doFilter(servletRequest,httpResponse);
    }

    @Override
    public void destroy() {

    }
}


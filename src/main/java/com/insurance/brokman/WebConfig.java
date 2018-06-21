package com.insurance.brokman;

import org.eclipse.birt.report.filter.ViewerFilter;
import org.eclipse.birt.report.listener.ViewerHttpSessionListener;
import org.eclipse.birt.report.listener.ViewerServletContextListener;
import org.eclipse.birt.report.servlet.BirtEngineServlet;
import org.eclipse.birt.report.servlet.ViewerServlet;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionListener;
import java.util.ArrayList;


@Configuration
public class WebConfig  extends SpringBootServletInitializer implements WebMvcConfigurer{


   /* @Override
    public void onStartup(ServletContext servletContext) {
        WebApplicationContext rootAppContext = createRootApplicationContext(servletContext);
        if (rootAppContext != null) {
            servletContext.addListener(new ViewerServletContextListener());

            servletContext.addListener(new ViewerHttpSessionListener());

        } else {

        }
    }*/

        @Bean
    public ViewResolver getViewResolver(){
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/jsp/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer){
        configurer.enable();
    }

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addFormatter(new DateFormatter("yyyy-MM-dd"));
    }

    @Bean
    public ServletRegistrationBean birtViewerServletRegistrationBean(){
        ServletRegistrationBean result = new ServletRegistrationBean(
                new ViewerServlet(), "/frameset","/run");  // Comma separated url paths.
        result.setName("ViewerServlet");
        result.setOrder(1);
        return result;

    }

    @Bean
    public ServletRegistrationBean birtEngineServletRegistrationBean(){
        ServletRegistrationBean result = new ServletRegistrationBean(
                new BirtEngineServlet(), "/preview","/download","/parameter","/document","/output","/extract");
        // Comma separated url paths.
        result.setName("EngineServlet");
        result.setOrder(2);
        return result;

    }

    @Bean
    public FilterRegistrationBean viewerFilterRegistration(){
        FilterRegistrationBean result = new FilterRegistrationBean(new ViewerFilter());
        result.setName("ViewerFilter");
        ArrayList<ServletRegistrationBean> a=new ArrayList<ServletRegistrationBean>();
        a.add(this.birtEngineServletRegistrationBean());
        a.add(this.birtViewerServletRegistrationBean());

        result.setServletRegistrationBeans(a);
        result.setOrder(1);
        return result;
    }

    @Bean
    public ServletListenerRegistrationBean<ServletContextListener> viewerServletContextListener() {

        ServletListenerRegistrationBean<ServletContextListener> result =  new ServletListenerRegistrationBean<>();
        result.setListener(new ViewerServletContextListener());

      //  result.setOrder(1);

        return result;


    }

    @Bean
    public ServletListenerRegistrationBean<HttpSessionListener> httpServletContextListener(){
        ServletListenerRegistrationBean<HttpSessionListener> result =  new ServletListenerRegistrationBean<>();
        result.setListener(new ViewerHttpSessionListener());

      //  result.setOrder(2);

        return result;
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        return bCryptPasswordEncoder;
    }


}

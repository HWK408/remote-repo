package com.javaclimb.houserent.common.config;

import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.interceptor.AdminInterceptor;
import com.javaclimb.houserent.common.interceptor.CustomerInterceptor;
import com.javaclimb.houserent.common.interceptor.OwnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 * 前端配置类
 */
@Configuration
@EnableWebMvc
public class MvcConfig implements WebMvcConfigurer {
    /**
     * 配置静态资源访问路径
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry){
        registry.addResourceHandler("/**").addResourceLocations("classpath:/static/");
        registry.addResourceHandler("/uploads/**").addResourceLocations("file:///"+Constant.UPLOADS_PATH);
    }

    /**
     * 配置jsp的访问前后缀
     */
    @Bean
    public InternalResourceViewResolver setupViewResolver(){
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/jsp/");
        resolver.setSuffix(".jsp");
        return resolver;
    }


    @Override
    public void addInterceptors(InterceptorRegistry registry){
        registry.addInterceptor(new CustomerInterceptor())
                .addPathPatterns("/admin/profile")
                .addPathPatterns("/admin/home")
                .addPathPatterns("/admin/order")
                .addPathPatterns("/admin/mark")
                .addPathPatterns("/admin/feedback")
                .addPathPatterns("/admin/password");
        registry.addInterceptor(new OwnerInterceptor())
                .addPathPatterns("/admin/house");
        registry.addInterceptor(new AdminInterceptor())
                .addPathPatterns("/admin/news")
                .addPathPatterns("/admin/user");


    }
}

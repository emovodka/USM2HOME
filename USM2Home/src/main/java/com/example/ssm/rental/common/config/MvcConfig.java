package com.example.ssm.rental.common.config;

import com.example.ssm.rental.common.constant.Constant;
import com.example.ssm.rental.common.interceptor.AdminInterceptor;
import com.example.ssm.rental.common.interceptor.CustomerInterceptor;
import com.example.ssm.rental.common.interceptor.OwnerInterceptor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;


@Slf4j
@Configuration
@EnableWebMvc
public class MvcConfig implements WebMvcConfigurer {


    @Bean
    AdminInterceptor adminInterceptor() {
        return new AdminInterceptor();
    }

    @Bean
    OwnerInterceptor ownerInterceptor() {
        return new OwnerInterceptor();
    }

    @Bean
    CustomerInterceptor customerInterceptor() {
        return new CustomerInterceptor();
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/assets/**")
                .addResourceLocations("classpath:/static/assets/");
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:///" + Constant.UPLOADS_PATH);
    }

    @Bean
    public InternalResourceViewResolver setupViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/jsp/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        registry.addInterceptor(adminInterceptor())
                .addPathPatterns("/admin/user")
                .addPathPatterns("/admin/news")
                .addPathPatterns("/admin/feedback/reply/submit")
                .addPathPatterns("/admin/house/checkPass")
                .addPathPatterns("/admin/house/checkReject")
                .addPathPatterns("/admin/house/checkReject")

        ;

        registry.addInterceptor(ownerInterceptor())
                .addPathPatterns("/admin/house");

        registry.addInterceptor(customerInterceptor())
                .addPathPatterns("/admin/order")
                .addPathPatterns("/admin/mark")
                .addPathPatterns("/admin/feedback")
                .addPathPatterns("/admin/feedback/delete")
                .addPathPatterns("/feedback/submit")
                .addPathPatterns("/admin/profile")
                .addPathPatterns("/admin/password")
                .addPathPatterns("/admin/**")
                .addPathPatterns("/admin/home")
                .addPathPatterns("/order")
                .addPathPatterns("/mark");
    }


}

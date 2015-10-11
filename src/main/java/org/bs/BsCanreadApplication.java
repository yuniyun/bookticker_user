package org.bs;

import javax.servlet.MultipartConfigElement;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@SpringBootApplication
@MapperScan(value={"org.bs.common.mapper"})
public class BsCanreadApplication {

    public static void main(String[] args) {
        SpringApplication.run(BsCanreadApplication.class, args);
    }
    
    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception{
    	SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
    	sessionFactory.setDataSource(dataSource);
    	
    	sessionFactory.setTypeAliasesPackage("org.bs.common.domain,org.bs.login.model");
    	
    	Resource[] res = new PathMatchingResourcePatternResolver()
    						.getResources("classpath:mappers/*Mapper.xml");
    	sessionFactory.setMapperLocations(res);
    	return sessionFactory.getObject();
    }
    
    @Bean
    public MultipartConfigElement multipartConfigElement() {
         MultipartConfigFactory factory = new MultipartConfigFactory();
         factory.setMaxFileSize("100MB");
         factory.setMaxRequestSize("100MB");
         return factory.createMultipartConfig();
    }
}

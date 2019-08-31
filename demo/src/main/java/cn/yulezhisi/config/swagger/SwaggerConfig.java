package cn.yulezhisi.config.swagger;

import com.github.xiaoymin.swaggerbootstrapui.annotations.EnableSwaggerBootstrapUI;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * 通过配置文件开关swagger
 *
 * 可以有多个 Docket 方法对接口分组 ,通过apis指定接口范围
 *
 * @author yulezhisi
 */
@Configuration
@EnableSwagger2
@EnableSwaggerBootstrapUI
public class SwaggerConfig{
    
    @Value("${swagger.is.enable}")
    private boolean swaggerIsEnable;
    
    @Bean
    public Docket swaggerRecption() {
        return new Docket(DocumentationType.SWAGGER_2).enable(swaggerIsEnable)
                                                      .groupName("前台服务")
                                                      .select()
                                                      .apis(RequestHandlerSelectors.basePackage(
                                                              "cn.yulezhisi"))
                                                      .build()
                                                      .apiInfo(apiInfo());
    }
   /*
    @Bean
    public Docket swaggerAdmin() {
        return new Docket(DocumentationType.SWAGGER_2).enable(swaggerIsEnable)
                                                      .groupName("后台管理")
                                                      .select()
                                                      .apis(RequestHandlerSelectors.basePackage(
                                                              "cn.yulezhisi.admin"))
                                                      .build()
                                                      .apiInfo(apiInfo());
    }
    */
    private ApiInfo apiInfo() {
        Contact contact = new Contact("yulezhisi", "https://www.yulezhisi.cn",
                                      "yulezhisimm@outlook.com");
        return new ApiInfoBuilder().contact(contact)
                                   .title("swagger2 *** Api")
                                   .description("请求接口的自动生成文档")
                                   .license("copyright©yulezhisi.cn")
                                   .version("1.0")
                                   .build();
    }
    
}

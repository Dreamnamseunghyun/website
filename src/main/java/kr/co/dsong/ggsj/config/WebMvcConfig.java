package kr.co.dsong.ggsj.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.resource.VersionResourceResolver;

import javax.annotation.Resource;

@Configuration
@EnableWebMvc
@Slf4j
public class WebMvcConfig extends WebMvcConfigurerAdapter {

    @Resource
    private Environment environment;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        log.info("");

        registry.addResourceHandler("/css/**", "/img/**", "/js/**")
                .addResourceLocations("/css/", "/img/", "/js/")
//                .resourceChain(environment.acceptsProfiles("prod"))  // TODO: 추후 개발, 운영 서버 분리되면 적용
                .resourceChain(false)
                .addResolver(new VersionResourceResolver().addContentVersionStrategy("/**"));

        // TODO: /publish 는 추후 정리되면 삭제!
        registry.addResourceHandler("/lib/**", "/publish/**")
                .addResourceLocations("/lib/", "/publish/")
                .resourceChain(true);
    }
}

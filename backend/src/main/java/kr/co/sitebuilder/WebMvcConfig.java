package kr.co.sitebuilder;

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
//                .resourceChain(environment.acceptsProfiles("prod"))  // TODO: 異뷀썑 媛쒕컻, ?占쎌쁺 ?占쎈쾭 遺꾨━?占쎈㈃ ?占쎌슜
                .resourceChain(false)
                .addResolver(new VersionResourceResolver().addContentVersionStrategy("/**"));

        // TODO: /publish ??異뷀썑 ?占쎈━?占쎈㈃ ??占쏙옙!
        registry.addResourceHandler("/lib/**", "/publish/**")
                .addResourceLocations("/lib/", "/publish/")
                .resourceChain(true);
    }
}

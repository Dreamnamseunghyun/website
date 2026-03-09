package kr.co.dsong.ggsj.config;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class StorageConfig {

    private static final String END_POINT = "https://kr.object.ncloudstorage.com";
    private static final String REGION_NAME = "kr-standard";
    private static final String ACCESS_KEY = "Digmki2Hsipqas1AGjfr";
    private static final String SECRET_KEY = "lZ0RuSqfEhafnUl943DcLXd1dOmt6AdqYRtB9RS4";

    @Bean
    public AmazonS3 amazonS3() {
        return AmazonS3ClientBuilder.standard()
                .withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(END_POINT, REGION_NAME))
                .withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY)))
                .build();
    }
}

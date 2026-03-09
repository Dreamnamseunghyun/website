package kr.co.dsong.ggsj.common.service.impl;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.dsong.ggsj.common.service.StorageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

@Service
@Slf4j
public class StorageServiceImpl extends EgovAbstractServiceImpl implements StorageService {

    private static final String BUCKET_NAME_PROD = "ggsj";
    private static final String BUCKET_NAME_DEV = "ggsj-dev";

    @Resource
    private Environment environment;

    @Resource
    private AmazonS3 amazonS3;

    @Override
    public void putObject(String filePath, MultipartFile mf) throws Exception {
        putObject(filePath, mf, false);
    }

    @Override
    public void putObject(String filePath, MultipartFile mf, boolean isPublicRead) throws Exception {
        ObjectMetadata objectMetadata = new ObjectMetadata();
        objectMetadata.setContentLength(mf.getSize());
        objectMetadata.setContentType(mf.getContentType());

        if (isPublicRead) {
            amazonS3.putObject(new PutObjectRequest(getBucketName(), filePath, mf.getInputStream(), objectMetadata).withCannedAcl(CannedAccessControlList.PublicRead));
        } else {
            amazonS3.putObject(getBucketName(), filePath, mf.getInputStream(), objectMetadata);
        }
    }

    @Override
    public S3Object getObject(String filePath) {
        return amazonS3.getObject(getBucketName(), filePath);
    }

    @Override
    public void deleteObject(String filePath) {
        amazonS3.deleteObject(getBucketName(), filePath);
    }

    private String getBucketName() {
//        return environment.acceptsProfiles("prod") ? BUCKET_NAME_PROD : BUCKET_NAME_DEV;  // TODO: 추후 개발, 운영 서버 분리되면 적용
        return BUCKET_NAME_PROD;
    }
}

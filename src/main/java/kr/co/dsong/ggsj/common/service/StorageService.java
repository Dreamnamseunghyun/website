package kr.co.dsong.ggsj.common.service;

import com.amazonaws.services.s3.model.S3Object;
import org.springframework.web.multipart.MultipartFile;

public interface StorageService {

    void putObject(String filePath, MultipartFile mf) throws Exception;

    void putObject(String filePath, MultipartFile mf, boolean isPublicRead) throws Exception;

    S3Object getObject(String filePath);

    void deleteObject(String filePath);
}

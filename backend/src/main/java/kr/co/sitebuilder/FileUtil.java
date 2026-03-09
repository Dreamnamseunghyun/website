package kr.co.sitebuilder;

import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@Slf4j
public class FileUtil {

    @SuppressWarnings("unused")
    public static File transferFile(MultipartFile mf, String filePath) {
        return transferFile(mf, filePath, null);
    }

    public static File transferFile(MultipartFile mf, String filePath, String fileName) {
        log.info("mf.getOriginalFilename(): " + mf.getOriginalFilename() + ", mf.getSize(): " + mf.getSize());
        log.info("filePath: " + filePath + ", fileName: " + fileName);

        if (mf.getSize() == 0 || StringUtils.isEmpty(filePath)) {
            return null;
        }

        if (StringUtils.isEmpty(fileName)) {
            if (StringUtils.isEmpty(mf.getOriginalFilename())) {
                return null;
            }
            fileName = mf.getOriginalFilename();
        }

        // make file path
        File path = new File(filePath);
        if (!path.exists()) {
            if (!path.mkdirs()) {
                return null;
            }
        }

        // transfer file
        File file = new File(filePath + fileName);
        log.info("transfer file: " + file);

        try {
            mf.transferTo(file);
        } catch (IOException e) {
            log.info(e.getLocalizedMessage());
        }

        return file;
    }

    public static String convertDownloadFileName(String userAgent, String orgFileName) {
        userAgent = userAgent.toLowerCase();
        String fileName;

        try {
            if (userAgent.contains("msie") || userAgent.contains("trident") || userAgent.contains("edge")) {
                fileName = URLEncoder.encode(orgFileName, "UTF-8").replaceAll("\\+", "%20");
            } else if (userAgent.contains("chrome")) {
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < orgFileName.length(); i++) {
                    char c = orgFileName.charAt(i);
                    if (c > '~') {
                        sb.append(URLEncoder.encode("" + c, "UTF-8"));
                    } else {
                        sb.append(c);
                    }
                }
                fileName = sb.toString();
            } else {
                fileName = new String(orgFileName.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
            }
        } catch (UnsupportedEncodingException e) {
            log.info(e.getLocalizedMessage());
            fileName = orgFileName;
        }

        return fileName;
    }
}

package kr.co.dsong.ggsj.common.web;

import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.S3Object;
import kr.co.dsong.ggsj.common.service.StorageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StreamUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;

@Controller
@Slf4j
@RequestMapping("/storage")
public class StorageController {

    @Resource
    StorageService storageService;

    @RequestMapping(value = {"/company/*", "/hospital/*", "/center/*"}, method = RequestMethod.GET)
    public void getObjectImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.info("url: " + request.getServletPath());

        S3Object s3Object = storageService.getObject(StringUtils.delete(request.getServletPath(), "/storage/"));

        ObjectMetadata objectMetadata = s3Object.getObjectMetadata();
        response.setContentType(objectMetadata.getContentType());

        InputStream is = s3Object.getObjectContent();
        StreamUtils.copy(is, response.getOutputStream());
        is.close();
    }

    @RequestMapping(value = {"/notice/*", "/healthsense/*", "/archive/*", "/result/*"}, method = RequestMethod.GET)
    public String downloadObject(@RequestParam String orgFileName, Model model, HttpServletRequest request) throws Exception {
        log.info("url: " + request.getServletPath() + ", orgFileName: " + orgFileName);

        S3Object s3Object = storageService.getObject(StringUtils.delete(request.getServletPath(), "/storage/"));
        ObjectMetadata objectMetadata = s3Object.getObjectMetadata();

        model.addAttribute("orgFileName", orgFileName);
        model.addAttribute("contentLength", (int) objectMetadata.getContentLength());
        model.addAttribute("inputStream", s3Object.getObjectContent());

        return "downloadView";
    }

    @RequestMapping(value = {"/template/**"}, method = RequestMethod.GET)
    public String downloadTemplate(Model model, HttpServletRequest request) throws Exception {
        log.info("url: " + request.getServletPath());

        S3Object s3Object = storageService.getObject(StringUtils.delete(request.getServletPath(), "/storage/"));
        ObjectMetadata objectMetadata = s3Object.getObjectMetadata();

        model.addAttribute("contentLength", (int) objectMetadata.getContentLength());
        model.addAttribute("inputStream", s3Object.getObjectContent());

        return "downloadView";
    }
}

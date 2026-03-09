package kr.co.dsong.ggsj.common.web;

import kr.co.dsong.ggsj.util.FileUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.view.AbstractView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

@Slf4j
public class DownloadView extends AbstractView {

    public DownloadView() {
        setContentType("application/octet-stream; charset=UTF-8");
    }

    @Override
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String orgFileName = (String) model.get("orgFileName");
        log.info("orgFileName: " + orgFileName);

        if (StringUtils.isEmpty(orgFileName)) {
            orgFileName = StringUtils.getFilename(request.getServletPath());
        }

        String fileName = FileUtil.convertDownloadFileName(request.getHeader("User-Agent"), orgFileName);
        log.info("fileName: " + fileName);

        Integer contentLength = (Integer) model.get("contentLength");
        log.info("contentLength: " + contentLength);
        if (contentLength != null) {
            response.setContentLength(contentLength);
        }

        response.setContentType(getContentType());
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");

        InputStream is = (InputStream) model.get("inputStream");
        OutputStream os = response.getOutputStream();
        FileCopyUtils.copy(is, os);
    }
}

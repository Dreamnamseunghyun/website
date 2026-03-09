package kr.co.dsong.ggsj.common;

import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@Getter
@PropertySource("classpath:/global.properties")
@PropertySource("classpath:/git.revision.properties")
public class Property {

    @Value("${system.version.major:0}")
    private int versionMajor;

    @Value("${system.version.minor:0}")
    private int versionMinor;

    @Value("${system.version.patch:0}")
    private int versionPatch;

    @Value("${git.revision:0}")
    private int gitRevision;

    public String getVersion() {
        return versionMajor + "." + versionMinor + "." + versionPatch + "." + gitRevision;
    }
}

package kr.co.dsong.ggsj.config;

import net.sf.log4jdbc.Properties;
import net.sf.log4jdbc.log.slf4j.Slf4jSpyLogDelegator;
import net.sf.log4jdbc.sql.Spy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Log4JdbcCustomFormatter extends Slf4jSpyLogDelegator {

    private final Logger sqlOnlyLogger = LoggerFactory.getLogger("jdbc.sqlonly");
    private final Logger sqlTimingLogger = LoggerFactory.getLogger("jdbc.sqltiming");
    private static final String nl = System.getProperty("line.separator");

    @Override
    public void sqlOccurred(Spy spy, String methodCall, String sql) {
        // 빈줄 제거 정규식
        sql = sql.replaceAll("\r\n|\r|\n", nl).replaceAll("\\s*" + nl, nl).trim();

        if (!Properties.isDumpSqlFilteringOn() || shouldSqlBeLogged(sql)) {
            if (sqlOnlyLogger.isDebugEnabled()) {
                sqlOnlyLogger.debug(spy.getConnectionNumber() + ". Sql" + nl + sql);
            } else if (sqlOnlyLogger.isInfoEnabled()) {
                sqlOnlyLogger.info(spy.getConnectionNumber() + ". Sql" + nl + sql);
            }
        }
    }

    @Override
    public void sqlTimingOccurred(Spy spy, long execTime, String methodCall, String sql) {
        // 빈줄 제거 정규식
        sql = sql.replaceAll("\r\n|\r|\n", nl).replaceAll("\\s*" + nl, nl).trim();

        if (sqlTimingLogger.isErrorEnabled() && (!Properties.isDumpSqlFilteringOn() || shouldSqlBeLogged(sql))) {
            if (Properties.isSqlTimingErrorThresholdEnabled() && execTime >= Properties.getSqlTimingErrorThresholdMsec()) {
                sqlTimingLogger.error(spy.getConnectionNumber() + ". Sql" + nl + sql + nl + "{executed in " + execTime + " msec}");
            } else if (sqlTimingLogger.isWarnEnabled()) {
                if (Properties.isSqlTimingWarnThresholdEnabled() && execTime >= Properties.getSqlTimingWarnThresholdMsec()) {
                    sqlTimingLogger.warn(spy.getConnectionNumber() + ". Sql" + nl + sql + nl + "{executed in " + execTime + " msec}");
                } else if (sqlTimingLogger.isDebugEnabled()) {
                    sqlTimingLogger.debug(spy.getConnectionNumber() + ". Sql" + nl + sql + nl + "{executed in " + execTime + " msec}");
                } else if (sqlTimingLogger.isInfoEnabled()) {
                    sqlTimingLogger.info(spy.getConnectionNumber() + ". Sql" + nl + sql + nl + "{executed in " + execTime + " msec}");
                }
            }
        }
    }

    private boolean shouldSqlBeLogged(String sql) {
        if (sql == null) {
            return false;
        } else {
            // 주석 제거 정규식
            sql = sql.replaceAll("\r\n|\r|\n", nl)
                    .replaceAll("/\\*(\\*[^/]|[^*]/|[^*/])*\\*/", "")
                    .replaceAll("--.*" + nl, "")
                    .trim();

            if (sql.length() < 6) {
                return false;
            } else {
                sql = sql.substring(0, 6).toLowerCase();
                return Properties.isDumpSqlSelect() && "select".equals(sql) ||
                        Properties.isDumpSqlInsert() && "insert".equals(sql) ||
                        Properties.isDumpSqlUpdate() && "update".equals(sql) ||
                        Properties.isDumpSqlDelete() && "delete".equals(sql) ||
                        Properties.isDumpSqlCreate() && "create".equals(sql);
            }
        }
    }
}

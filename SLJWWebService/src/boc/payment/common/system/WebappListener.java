package boc.payment.common.system;

import java.io.File;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.xml.DOMConfigurator;


public class WebappListener implements ServletContextListener {

    public void contextDestroyed(ServletContextEvent servletContextEvent) {
    }

    public void contextInitialized(ServletContextEvent servletContextEvent) {
        head();
        try {
        	String workPath = this.getClass().getResource("/").toURI().getPath().toString();
            String systemConfigPath = workPath + servletContextEvent.getServletContext().getInitParameter("system.config.path");
            String paymentConfigPath = workPath + servletContextEvent.getServletContext().getInitParameter("payment.config.path");

            // Log4j
            String log4jConfigFile = systemConfigPath + File.separatorChar + "log4j.xml";
            System.out.println(log4jConfigFile);
            DOMConfigurator.configure(log4jConfigFile);

            // 初始化系统环境
            SystemEnvironment.initialize(systemConfigPath);

            // 初始化支付环境
            PaymentEnvironment.initialize(paymentConfigPath);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void head() {
        System.out.println("========================================");
        System.out.println("BOC Payment Demo 1.0");
        System.out.println("========================================");
    }

}

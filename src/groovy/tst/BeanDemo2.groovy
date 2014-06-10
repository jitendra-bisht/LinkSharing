package tst

import com.linkshare.LoginService
import org.codehaus.groovy.grails.commons.spring.GrailsApplicationContext
import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes

/**
 * Created by intelligrape on 10/6/14.
 */
class BeanDemo2 {
    void run(){
        def context = ServletContextHolder.servletContext.getAttribute(GrailsApplicationAttributes.APPLICATION_CONTEXT);
        LoginService loginService = context.loginService
        loginService?.testMethod();
    }
}

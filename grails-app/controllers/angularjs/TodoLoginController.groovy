package angularjs

import com.intelligrape.intellimeet.ToDoRole
import com.intelligrape.intellimeet.ToDoUser
import com.intelligrape.intellimeet.ToDoUserToDoRole
import grails.plugin.springsecurity.LoginController
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.security.access.annotation.Secured

//@Secured('permitAll')

class TodoLoginController extends LoginController {

    def index() {
        if (springSecurityService.isLoggedIn()) {
            redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
        } else {
            redirect action: 'login', params: params
        }
    }

    def register(ToDoUser toDoUser) {
        println params
        toDoUser.enabled = true
        println(toDoUser.validate())
        toDoUser.save(flush: true)
        ToDoUserToDoRole.create toDoUser, ToDoRole.get(1), true
        redirect(controller: 'todoLogin', action: 'index')
    }

    def login() {

        def config = SpringSecurityUtils.securityConfig

        if (springSecurityService.isLoggedIn()) {
            redirect uri: config.successHandler.defaultTargetUrl
            return
        }

        String view = 'login'
        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
        render view: view, model: [postUrl            : postUrl,
                                   rememberMeParameter: config.rememberMe.parameter]
    }
}

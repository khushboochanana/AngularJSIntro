package angularjs

import com.intelligrape.intellimeet.ToDoRole
import com.intelligrape.intellimeet.ToDoUser
import com.intelligrape.intellimeet.ToDoUserToDoRole
import grails.plugin.springsecurity.LoginController
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.rest.token.generation.TokenGenerator

//@Secured('permitAll')

class TodoLoginController extends LoginController {
    SpringSecurityService springSecurityService
    TokenGenerator tokenGenerator


    def index() {
        if (springSecurityService.isLoggedIn()) {
            redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
        } else {
            redirect action: 'login', params: params
        }
    }

    def register(ToDoUser toDoUser) {
        toDoUser.save(flush: true, failOnError: true)
        ToDoUserToDoRole.create toDoUser, ToDoRole.get(1), true
        redirect(controller: 'todoLogin',action:  'login')
    }


    def todoApp() {
        println(">>>>>>>>>>>>>>>>>>>>>>>..............................>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
//        println(springSecurityService.currentUser)

        render(view: '/todoLogin/todoApp');
    }


    def login() {
        println(">>>>>>>>>>>>>>>>>>>>>>>Login>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
        println params
        def config = SpringSecurityUtils.securityConfig
        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
        println(postUrl)
        render view: '/todoLogin/todo', model: [postUrl            : postUrl,
                                                 rememberMeParameter: config.rememberMe.parameter]
    }
}

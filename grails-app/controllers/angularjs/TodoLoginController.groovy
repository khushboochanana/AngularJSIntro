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
        println params
        toDoUser.enabled = true
        println(toDoUser.validate())
        toDoUser.save(flush: true)
        ToDoUserToDoRole.create toDoUser, ToDoRole.get(1), true
        redirect(controller: 'todoLogin', action: 'index')
    }

//    @Override
//    def ajaxSuccess() {
//        println("........................///////////////////...................................")
//        println(springSecurityService.authentication)
//        println(springSecurityService.currentUser)
//        println("........................///////////////////...................................")
//
//        if (springSecurityService.principal.hasProperty("id")) {
//            println("........................///////////////////...................................")
//            def authToken
//            def currentUser = AuthenticationToken.get(springSecurityService.principal.id)
//            println(currentUser)
//            println("........................///////////////////...................................")
//
//            if (currentUser.tokenValue == null) {
//                authToken = tokenGenerator.generateAccessToken()
//                println(authToken)
//                println("........................///////////////////...................................")
//
//                currentUser.tokenValue = authToken
////                userResourceService.update(currentUser)
//            } else authToken = currentUser.tokenValue
//            render([success: true, data: [tokenValue: authToken, userid: currentUser.id, username: currentUser.username] as JSON]);
//        }
//        render([success: false, message: "Sorry.User is not authenticated"] as JSON)
//    }

    def todoApp() {
        println(">>>>>>>>>>>>>>>>>>>>>>>..............................>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
        println(springSecurityService.currentUser)

        render(view: '/todoApp');
    }

    def login() {
        println(">>>>>>>>>>>>>>>>>>>>>>>Login>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
        println params
        println(params.username)
        def config = SpringSecurityUtils.securityConfig
//        render(view:'/todoApp')

//        if (springSecurityService.isLoggedI n()) {
//            redirect uri: config.successHandler.defaultTargetUrl
//            return
//        }
        String view = 'login'
        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
        println(postUrl)
        render view: '/todoLogin/login', model: [postUrl            : postUrl,
                                   rememberMeParameter: config.rememberMe.parameter]
    }
}

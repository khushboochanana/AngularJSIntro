package angularjs

class AppFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                log.info("Controller : ${controllerName}, Action : ${actionName}");
                println("Controller : ${controllerName}, Action : ${actionName}");
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}

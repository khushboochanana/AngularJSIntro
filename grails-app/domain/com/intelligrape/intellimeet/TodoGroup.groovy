package com.intelligrape.intellimeet

import grails.converters.JSON
import grails.rest.Resource
import org.springframework.security.access.annotation.Secured

//@Secured('permitAll')

@Resource(uri = "/rest/api/abcd", formats = ['json', 'xml'])
class TodoGroup {
    String ownedBy = 'Khushboo'
    String name

    static hasMany = [todos: Todo]


    JSON toJSON(json) {
        json.build {
            ownedBy(ownedBy)
            name(name)
            todos(todos)
        }
    }
}

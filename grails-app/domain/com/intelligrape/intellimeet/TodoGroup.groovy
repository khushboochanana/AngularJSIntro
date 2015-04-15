package com.intelligrape.intellimeet

import grails.converters.JSON
import grails.rest.Resource

//@Secured('permitAll')

@Resource(uri = "/rest/api/abcd", formats = ['json', 'xml'])
class TodoGroup {
    String ownedBy = 'Khushboo'
    String name

    static belongsTo = [todoUser: ToDoUser]
    static hasMany = [todos: Todo]


    JSON toJSON(json) {
        json.build {
            ownedBy(ownedBy)
            name(name)
            todos(todos)
        }
    }
}

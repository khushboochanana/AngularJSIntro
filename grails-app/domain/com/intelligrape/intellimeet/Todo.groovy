package com.intelligrape.intellimeet

import org.springframework.security.access.annotation.Secured

import grails.rest.Resource
//@Secured('permitAll')
@Resource(uri = "/rest/todo", formats = ['json', 'xml'])
class Todo {
    String task
    Boolean completed = false
    Long dateCreated
    Long lastUpdated
    Priority priority = Priority.LOW

    static belongsTo = [collection: TodoGroup]

    def beforeInsert = {
        dateCreated = lastUpdated = new Date().time
    }

    def beforeUpdate = {
        lastUpdated = new Date().time
    }
}

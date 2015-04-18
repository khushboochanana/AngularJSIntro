package com.intelligrape.intellimeet

import grails.rest.Resource

@Resource(uri = "/rest/user", formats = ['json', 'xml'])

class ToDoUser {

    transient springSecurityService
    String firstName
    String lastName
    String username
    String email
    String password
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    static hasMany = [todoGroup: TodoGroup]
    static transients = ['springSecurityService']

    static constraints = {
        username blank: false, unique: true
        password blank: false
        email email: true, unique: true
    }

    static mapping = {
        password column: '`password`'
    }

    Set<ToDoRole> getAuthorities() {
        ToDoUserToDoRole.findAllByToDoUser(this).collect { it.toDoRole }
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }
}

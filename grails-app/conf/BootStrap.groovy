import com.intelligrape.intellimeet.*

class BootStrap {

    def init = { servletContext ->
        ToDoRole adminRole = new ToDoRole(authority: 'ROLE_ADMIN').save(flush: true)
        ToDoRole userRole = new ToDoRole(authority: 'ROLE_ADMIN').save(flush: true)

        ToDoUser testUser = new ToDoUser(firstName: 'khushboo', lastName: 'chanana', email: 'khushbooc@intelligrape.com', username: 'KhushbooChanana', enabled: true,
                password: 'abcd')
        ToDoUser testUser2 = new ToDoUser(firstName: 'ankit', lastName: 'chanana', email: 'ankit@gmail.com', username: 'AnkitChanana', enabled: true, password: 'abcd')
        testUser.save(flush: true)
        testUser2.save(flush: true)

        ToDoUserToDoRole.create testUser, adminRole, true
        ToDoUserToDoRole.create testUser2, adminRole, true


        TodoGroup todoGroup = new TodoGroup(name: "group1", todoUser: testUser)
        todoGroup.save(flush: true)
        TodoGroup todoGroup1 = new TodoGroup(name: "group2", todoUser: testUser2)
        todoGroup1.save(flush: true)
        TodoGroup todoGroup2 = new TodoGroup(name: "group3")
        todoGroup2.save(flush: true)

        Todo todo = new Todo(task: "Eat", collection: todoGroup)
        todo.save(flush: true)

        Todo todo1 = new Todo(task: "Drink", collection: todoGroup1)
        todo1.save(flush: true)

        Todo todo2 = new Todo(task: "sleep", collection: todoGroup)
        todo2.save(flush: true)
    }

    def destroy = {
    }
}

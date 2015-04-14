import com.intelligrape.intellimeet.ToDoRole
import com.intelligrape.intellimeet.ToDoUser
import com.intelligrape.intellimeet.ToDoUserToDoRole
import com.intelligrape.intellimeet.Todo
import com.intelligrape.intellimeet.TodoGroup

class BootStrap {

    def init = { servletContext ->
        ToDoRole adminRole = new ToDoRole(authority: 'ROLE_ADMIN').save(flush: true)
        ToDoRole userRole = new ToDoRole(authority: 'permitAll').save(flush: true)

        def testUser = new ToDoUser(username: 'KhushbooChanana', enabled: true,
                password: 'abcd')
        testUser.save(flush: true)

        ToDoUserToDoRole.create testUser, adminRole, true


        TodoGroup todoGroup = new TodoGroup(name: "group1")
        todoGroup.save(flush: true)
        TodoGroup todoGroup1 = new TodoGroup(name: "group2")
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

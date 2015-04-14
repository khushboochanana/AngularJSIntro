package com.intelligrape.intellimeet

import org.apache.commons.lang.builder.HashCodeBuilder

class ToDoUserToDoRole implements Serializable {

	private static final long serialVersionUID = 1

	ToDoUser toDoUser
	ToDoRole toDoRole

	boolean equals(other) {
		if (!(other instanceof ToDoUserToDoRole)) {
			return false
		}

		other.toDoUser?.id == toDoUser?.id &&
		other.toDoRole?.id == toDoRole?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (toDoUser) builder.append(toDoUser.id)
		if (toDoRole) builder.append(toDoRole.id)
		builder.toHashCode()
	}

	static ToDoUserToDoRole get(long toDoUserId, long toDoRoleId) {
		ToDoUserToDoRole.where {
			toDoUser == ToDoUser.load(toDoUserId) &&
			toDoRole == ToDoRole.load(toDoRoleId)
		}.get()
	}

	static boolean exists(long toDoUserId, long toDoRoleId) {
		ToDoUserToDoRole.where {
			toDoUser == ToDoUser.load(toDoUserId) &&
			toDoRole == ToDoRole.load(toDoRoleId)
		}.count() > 0
	}

	static ToDoUserToDoRole create(ToDoUser toDoUser, ToDoRole toDoRole, boolean flush = false) {
		def instance = new ToDoUserToDoRole(toDoUser: toDoUser, toDoRole: toDoRole)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(ToDoUser u, ToDoRole r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = ToDoUserToDoRole.where {
			toDoUser == ToDoUser.load(u.id) &&
			toDoRole == ToDoRole.load(r.id)
		}.deleteAll()

		if (flush) { ToDoUserToDoRole.withSession { it.flush() } }

		rowCount > 0
	}

	static void removeAll(ToDoUser u, boolean flush = false) {
		if (u == null) return

		ToDoUserToDoRole.where {
			toDoUser == ToDoUser.load(u.id)
		}.deleteAll()

		if (flush) { ToDoUserToDoRole.withSession { it.flush() } }
	}

	static void removeAll(ToDoRole r, boolean flush = false) {
		if (r == null) return

		ToDoUserToDoRole.where {
			toDoRole == ToDoRole.load(r.id)
		}.deleteAll()

		if (flush) { ToDoUserToDoRole.withSession { it.flush() } }
	}

	static constraints = {
		toDoRole validator: { ToDoRole r, ToDoUserToDoRole ur ->
			if (ur.toDoUser == null) return
			boolean existing = false
			ToDoUserToDoRole.withNewSession {
				existing = ToDoUserToDoRole.exists(ur.toDoUser.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['toDoRole', 'toDoUser']
		version false
	}
}

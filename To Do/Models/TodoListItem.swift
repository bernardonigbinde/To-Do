//
//  TodoListItem.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation

struct TodoListItem: Codable, Identifiable {
	let id: String
	let ownerID: String
	var title: String
	var todoListID: String = ""
	var completed: Bool = false
	var dueAt: TimeInterval
	var createdAt: TimeInterval = Date().timeIntervalSince1970
	var updatedAt: TimeInterval = Date().timeIntervalSince1970
	
	mutating func updateTitle(to newTitle: String) {
		title = newTitle
		updatedAt = Date().timeIntervalSince1970
	}
	
	mutating func setComplete(to newStatus: Bool) {
		completed = newStatus
		updatedAt = Date().timeIntervalSince1970
	}
	
	mutating func moveTodo(to newListId: String) {
		todoListID = newListId
		updatedAt = Date().timeIntervalSince1970
	}
	
	mutating func removeFromList() {
		todoListID = ""
		updatedAt = Date().timeIntervalSince1970
	}
	
	mutating func updateDueAt(to newTime: TimeInterval) {
		dueAt = newTime
		updatedAt = Date().timeIntervalSince1970
	}
}

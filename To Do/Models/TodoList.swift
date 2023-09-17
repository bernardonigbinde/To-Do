//
//  TodoList.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/18.
//

import Foundation

struct TodoList: Codable, Identifiable {
	let id: String
	let ownerID: String
	var title: String
	var createdAt: TimeInterval = Date().timeIntervalSince1970
	var updatedAt: TimeInterval = Date().timeIntervalSince1970
	
	mutating func updateTitle(to newTitle: String) {
		title = newTitle
		updatedAt = Date().timeIntervalSince1970
	}
}

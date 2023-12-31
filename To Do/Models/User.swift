//
//  User.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation


struct User: Codable {
	let id: String
	var name: String
	let email: String
	var createdAt: TimeInterval = Date().timeIntervalSince1970
	var updatedAt: TimeInterval = Date().timeIntervalSince1970
	
	mutating func updateName(to newName: String) {
		name = newName
		updatedAt = Date().timeIntervalSince1970
	}
}

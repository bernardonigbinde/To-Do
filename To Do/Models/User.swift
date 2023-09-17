//
//  User.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation


struct User: Codable {
	let id: String
	let name: String
	let email: String
	let createdAt: TimeInterval
}

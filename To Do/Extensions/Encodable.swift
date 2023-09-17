//
//  Encodable.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation

extension Encodable {
	func toJson() -> [String:Any] {
		guard let data = try? JSONEncoder().encode(self) else { return [:] }
		do {
			return try JSONSerialization.jsonObject(with: data) as? [String:Any] ?? [:]
		} catch {
			return [:]
		}
	}
}

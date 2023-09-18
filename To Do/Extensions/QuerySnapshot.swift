//
//  QuerySnapshot.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/18.
//

import Foundation
import FirebaseFirestore


extension QuerySnapshot {
	func toList<T: Decodable>() -> [T] {
		var output: [T] = []
		
		documents.forEach { documentSnapshot in
			guard let data = try? JSONSerialization.data(withJSONObject: documentSnapshot.data()) else {
				print("item deserialization failed 1")
				return
			}
			do {
				output.append(try JSONDecoder().decode(T.self, from: data))
			} catch {
				print("item deserialization failed 2")
			}
		}
		
		return output
	}
}

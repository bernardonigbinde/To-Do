//
//  AuthBaseViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/19.
//

import Foundation
import FirebaseFirestore

class AuthBaseViewModel: BaseViewModel {
	
	func storeUser(_ user: User) {
		let db = Firestore.firestore()
		db.collection("users")
			.document(user.id)
			.setData(user.toJson())
	}
}

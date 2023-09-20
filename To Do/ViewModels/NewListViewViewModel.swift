//
//  NewListViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/18.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewListViewViewModel: BaseViewModel {
	@Published var title = ""
	@Published var showAlert = false
	@Published var errorMessage = ""
	var canSave: Bool {
		guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
			errorMessage = "Title cannot be empty."
			showAlert = true
			return false
		}
		
		errorMessage = ""
		showAlert = false
		return true
	}
	
	func isValidSubmission() -> Bool {
		return false
	}
	
	func save() -> Bool {
		guard canSave else { return false }
		
		guard let userID = firebaseUser?.uid else {
			errorMessage = "Could not load your account correctly."
			showAlert = true
			return false
		}
		
		let todoListID = UUID().uuidString
		let todoList = TodoList(id: todoListID, ownerID: userID, title: title)
		
		let db = Firestore.firestore()
		db.collection(Constants.Collections.todoLists)
			.document(todoListID)
			.setData(todoList.toJson())
		
		return true
	}
}

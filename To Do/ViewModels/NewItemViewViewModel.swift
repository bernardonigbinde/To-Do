//
//  NewItemViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: BaseViewModel {
	@Published var title: String = ""
	@Published var todoListID = ""
	@Published var dueAt: Date = Date()
	@Published var errorMessage = ""
	@Published var showAlert = false
	@Published var lists: [TodoList] = []
	
	var canSave: Bool {
		guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
			errorMessage = "Title cannot be empty."
			showAlert = true
			return false
		}
		
		guard Date().timeIntervalSince1970.isLess(than: dueAt.timeIntervalSince1970) else {
			errorMessage = "You can not set a date or time in the past."
			showAlert = true
			return false
		}
		
		errorMessage = ""
		showAlert = false
		return true
	}
	
	func save() -> Bool {
		guard canSave else { return false }
		
		guard let userID = firebaseUser?.uid else {
			errorMessage = "Could not load your account correctly."
			showAlert = true
			return false
		}
		
		let todoListItemID = UUID().uuidString
		let todoListItem = TodoListItem(id: todoListItemID, ownerID: userID, title: title, todoListID: todoListID, dueAt: dueAt.timeIntervalSince1970)
		
		let db = Firestore.firestore()
		db.collection(Constants.Collections.todoListItems)
			.document(todoListItemID)
			.setData(todoListItem.toJson())
		
		return true
	}
	
	func getLists() {
		guard let userID = firebaseUser?.uid else { return }
		let db = Firestore.firestore()
		db.collection(Constants.Collections.todoLists)
			.whereField("ownerID", isEqualTo: userID)
			.getDocuments { [weak self] snapshot, error in
				guard let error = error else {
					let remoteLists: [TodoList] = snapshot?.toList() ?? []
					self?.lists.append(TodoList(id: "", ownerID: userID, title: "No List"))
					self?.lists.append(contentsOf: remoteLists)
					self?.todoListID = self?.lists.first?.id ?? ""
					return
				}
				self?.errorMessage = "Could not load lists. \(error.localizedDescription)"
				self?.showAlert = true
			}
	}
}

//
//  ToDoListViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

class ToDoListViewViewModel: BaseViewModel {
	@Published var isShowingNewItemView = false
	@Published var todoItems: [TodoListItem] = []
	@Published var todoLists: [TodoList] = []
	
	func loadData() {
		guard let userID = firebaseUser?.uid else { return }
		let db = Firestore.firestore()
		db.collection("todoLists")
			.whereField("ownerID", isEqualTo: userID)
			.getDocuments { [weak self] snapshot, error in
				guard let error = error else {
					self?.todoLists.removeAll()
					self?.todoLists.append(contentsOf: snapshot?.toList() ?? [])
					return
				}
			}
		
		db.collection("todos")
			.whereField("ownerID", isEqualTo: userID)
			.getDocuments { [weak self] snapshot, error in
				guard let error = error else {
					self?.todoItems.removeAll()
					self?.todoItems.append(contentsOf: snapshot?.toList() ?? [])
					return
				}
			}
	}
}

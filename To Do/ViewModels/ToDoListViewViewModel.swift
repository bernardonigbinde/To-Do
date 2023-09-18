//
//  ToDoListViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ToDoListViewViewModel: BaseViewModel {
	@Published var isShowingNewItemView = false
	var grouped: [String:[TodoListItem]] = [:]
	var lists: [TodoList] = []
	
	func getLists(userID: String) {
		let db = Firestore.firestore()
		db.collection("todoLists")
			.whereField("ownerID", isEqualTo: userID)
			.getDocuments(completion: { [weak self] snapshot, error in
				self?.lists.append(contentsOf: snapshot?.toList() ?? [])
				self?.getItemsByLists(userID: userID)
			})
		
	}
	
	func getItemsByLists(userID: String) {
		let db = Firestore.firestore()
		var currentList: [TodoListItem] = []
		
		lists.forEach { todoList in
			db.collection("todos")
				.whereField("ownerID", isEqualTo: userID)
				.whereField("todoListID", isEqualTo: todoList.id)
				.getDocuments(completion: { [weak self] snapshot, error in
					currentList.append(contentsOf: snapshot?.toList() ?? [])
					print("Count: \(currentList.count)")
					print(currentList)
					self?.grouped[todoList.id] = currentList
					print(self?.grouped ?? [:])
				})
		}
	}
}

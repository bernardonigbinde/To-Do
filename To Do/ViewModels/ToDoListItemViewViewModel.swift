//
//  ToDoListItemViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ToDoListItemViewViewModel: BaseViewModel {
	@Published var isShowingNewItemView = false
	var grouped: [String:[TodoListItem]] = [:]
	var lists: [TodoList] = []
	
	func getLists(userID: String) {
		let db = Firestore.firestore()
		db.collection("todoLists")
			.whereField("ownerID", isEqualTo: userID)
			.getDocuments(completion: { [weak self] snapshot, error in
				snapshot?.documents.forEach({ snapshot in
					guard let data = try? JSONSerialization.data(withJSONObject: snapshot.data()) else {
						print("list deserialization failed 1")
						return
					}
					do {
						self?.lists.append(try JSONDecoder().decode(TodoList.self, from: data))
					} catch {
						print("list deserialization failed 2")
					}
					print(self?.lists ?? [])
					self?.getItemsByLists(userID: userID)
				})
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
					snapshot?.documents.forEach({ snap in
						guard let data = try? JSONSerialization.data(withJSONObject: snap.data()) else {
							print("item deserialization failed 1")
							return
						}
						do {
							currentList.append(try JSONDecoder().decode(TodoListItem.self, from: data))
						} catch {
							print("item deserialization failed 2")
						}
					})
					
					print("Count: \(currentList.count)")
					
					print(currentList)
					self?.grouped[todoList.id] = currentList
					print(self?.grouped ?? [:])
				})
		}
	}
}

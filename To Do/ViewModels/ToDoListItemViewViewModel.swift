//
//  ToDoListItemViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation
import FirebaseFirestore

class ToDoListItemViewViewModel: BaseViewModel {
	func delete(_ todo: TodoListItem) {
		guard let userID = firebaseUser?.uid else { return }
		
		let db = Firestore.firestore()
		db.collection(Constants.Collections.todoListItems)
			.document(todo.id)
			.delete()
	}
}

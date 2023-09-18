//
//  ListsViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/18.
//

import Foundation
import FirebaseFirestore

class ListsViewViewModel: BaseViewModel {
	@Published var isShowingNewListView = false
	@Published var todoLists: [TodoList] = []
	
	func loadLists() {
		guard let userID = firebaseUser?.uid else { return }
		
		let db = Firestore.firestore()
		db.collection("todoLists")
			.whereField("ownerID", isEqualTo: userID)
			.getDocuments { [weak self] snapshot, error in
				self?.todoLists.removeAll()
				self?.todoLists.append(contentsOf: snapshot?.toList() ?? [])
			}
	}
}

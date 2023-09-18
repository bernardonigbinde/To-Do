//
//  ToDoListView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ToDoListView: View {
	@StateObject private var viewModel = ToDoListViewViewModel()
	@FirestoreQuery var todoItems: [TodoListItem]
	@FirestoreQuery var todoLists: [TodoList]
	private let userID: String
	
	init(userID: String) {
		self.userID = userID
		self._todoItems = FirestoreQuery(
			collectionPath: "todos", predicates: [
				.where("ownerID", isEqualTo: userID),
			]
		)
		self._todoLists = FirestoreQuery(
			collectionPath: "todoLists", predicates: [
				.where("ownerID", isEqualTo: userID),
			]
		)
	}

    var body: some View {
		NavigationView {
			VStack {
				if todoItems.isEmpty {
					Image(systemName: "tray.fill")
						.resizable()
						.scaledToFit()
						.frame(width: 150)
						.foregroundColor(Color.gray)
					Text("No item yet")
						.foregroundColor(Color.gray)
				} else{
					List {
						Section(header: Text("Uncategorized")) {
							ForEach(todoItems.filter({ $0.todoListID.isEmpty })) { todo in
								ToDoListItemView(todo: .constant(todo))
							}
						}
						ForEach(todoLists) { list in
							Section(header: Text(list.title)) {
								ForEach(todoItems.filter({ $0.todoListID == list.id })) { todo in
									ToDoListItemView(todo: .constant(todo))
								}
							}
						}
					}
					.listStyle(.insetGrouped)
				}
			}
			.navigationTitle(.title)
			.toolbar {
				Button {
					viewModel.isShowingNewItemView = true
				} label: {
					Image(systemName: "plus")
				}

			}
		}
		.sheet(isPresented: $viewModel.isShowingNewItemView) {
			NewItemView(userID: userID, isPresented: $viewModel.isShowingNewItemView)
		}
	}
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userID: "XPFdF3DLiNQO64Um3MVQGuftbdG3")
    }
}


fileprivate extension LocalizedStringKey {
	static var title = LocalizedStringKey("todolist.header.title")
}

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
	private let userID: String
	@FirestoreQuery var todoItems: [TodoListItem]
	
	init(userID: String) {
		self.userID = userID
		self._todoItems = FirestoreQuery(
			collectionPath: "todos", predicates: [
				.where("ownerID", isEqualTo: userID),
				.where("todoListID", isEqualTo: "")
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
					List(todoItems.sorted(by: { todo1, todo2 in
						todo2.createdAt.isLess(than: todo1.createdAt)
					})) { todoItem in
						Text(todoItem.title)
					}
					.listStyle(PlainListStyle())
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
		.onAppear {
			viewModel.getLists(userID: userID)
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

//
//  ToDoListView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ToDoListView: View {
	@StateObject private var viewModel = ToDoListViewViewModel()
	@FirestoreQuery var todoListItems: [TodoListItem]
	@FirestoreQuery var todoLists: [TodoList]
	
	init() {
		if let userID = Auth.auth().currentUser?.uid {
			_todoListItems = FirestoreQuery(collectionPath: Constants.Collections.todoListItems, predicates: [
				.whereField("ownerID", isEqualTo: userID)
			])
			_todoLists = FirestoreQuery(collectionPath: Constants.Collections.todoLists, predicates: [
				.whereField("ownerID", isEqualTo: userID)
			])
		} else {
			_todoLists = FirestoreQuery(collectionPath: "")
			_todoListItems = FirestoreQuery(collectionPath: "")
		}
	}

    var body: some View {
		NavigationView {
			VStack {
				if todoListItems.isEmpty {
					Image(systemName: "tray.fill")
						.resizable()
						.scaledToFit()
						.frame(width: 150)
						.foregroundColor(Color.gray)
					Text(.emptyListLabel)
						.foregroundColor(Color.gray)
				} else{
					List {
						Section(header: Text(.uncategorizedHeader)) {
							ForEach(todoListItems.filter({ $0.todoListID.isEmpty })) { todo in
								ToDoListItemView(todo: .constant(todo))
							}
						}
						ForEach(todoLists) { list in
							Section(header: Text(list.title)) {
								ForEach(todoListItems.filter({ $0.todoListID == list.id })) { todo in
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
			NewItemView(isPresented: $viewModel.isShowingNewItemView)
		}
	}
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}


fileprivate extension LocalizedStringKey {
	static var title = LocalizedStringKey("todolist.header.title")
	static var uncategorizedHeader = LocalizedStringKey("todolist.list.header.uncategorized.title")
	static var emptyListLabel = LocalizedStringKey("todolist.list.empty.label")
}

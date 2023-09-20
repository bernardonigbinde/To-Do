//
//  ListsView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/18.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseAuth

struct ListsView: View {
	@StateObject private var viewModel = ListsViewViewModel()
	@FirestoreQuery var todoList: [TodoList]
	
	init() {
		if let userID = Auth.auth().currentUser?.uid {
			_todoList = FirestoreQuery<[TodoList]>(collectionPath: Constants.Collections.todoLists, predicates: [
				.whereField("ownerID", isEqualTo: userID)
			])
		} else {
			_todoList = FirestoreQuery(collectionPath: "")
		}
	}
	
    var body: some View {
		NavigationView {
			VStack {
				if todoList.isEmpty {
					Image(systemName: "tray.fill")
						.resizable()
						.scaledToFit()
						.frame(width: 150)
						.foregroundColor(Color.gray)
					Text(.emptyListLabel)
						.foregroundColor(Color.gray)
				} else{
					List {
						ForEach(todoList) { list in
							Text(list.title)
						}
					}
				}
			}
			.navigationTitle(.title)
			.toolbar {
				Button {
					viewModel.isShowingNewListView = true
				} label: {
					Image(systemName: "plus")
				}
			}
			.sheet(isPresented: $viewModel.isShowingNewListView) {
				NewListView(isPresented: $viewModel.isShowingNewListView)
			}
		}
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
		ListsView()
    }
}


fileprivate extension LocalizedStringKey {
	static var title = LocalizedStringKey("lists.header.title")
	static var emptyListLabel = LocalizedStringKey("lists.list.empty.label")
}

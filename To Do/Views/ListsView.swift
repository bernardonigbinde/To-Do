//
//  ListsView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/18.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ListsView: View {
	@StateObject private var viewModel = ListsViewViewModel()
	private let userID: String
	@FirestoreQuery var todoLists: [TodoList]
	
	init(userID: String) {
		self.userID = userID
		self._todoLists = FirestoreQuery(
			collectionPath: "todoLists", predicates: [
				.where("ownerID", isEqualTo: userID),
			]
		)
	}
	
    var body: some View {
		NavigationView {
			VStack {
				if todoLists.isEmpty {
					Image(systemName: "tray.fill")
						.resizable()
						.scaledToFit()
						.frame(width: 150)
						.foregroundColor(Color.gray)
					Text("No lists yet")
						.foregroundColor(Color.gray)
				} else{
					List {
						ForEach(todoLists) { list in
							Text(list.title)
						}
					}
				}
			}
			.navigationTitle(.title)
			.toolbar {
				Button {
					
				} label: {
					Image(systemName: "plus")
				}

			}
		}
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
		ListsView(userID: "XPFdF3DLiNQO64Um3MVQGuftbdG3")
    }
}


fileprivate extension LocalizedStringKey {
	static var title = LocalizedStringKey("lists.header.title")
}
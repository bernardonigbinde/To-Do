//
//  ToDoListView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct ToDoListView: View {
	@StateObject private var viewModel = ToDoListItemViewViewModel()
	
	init(userID: String) {
		viewModel.userID = userID
	}

    var body: some View {
		NavigationView {
			VStack {
				
			}
			.navigationTitle(.title)
			.toolbar {
				Button {
					
				} label: {
					Image(systemName: "plus")
				}

			}
		}
		.sheet(isPresented: $viewModel.isShowingNewItemView) {
			NewItemView()
		}
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userID: "")
    }
}


fileprivate extension LocalizedStringKey {
	static var title = LocalizedStringKey("todolist.header.title")
}

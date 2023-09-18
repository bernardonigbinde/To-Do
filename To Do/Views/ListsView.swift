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
	
    var body: some View {
		NavigationView {
			VStack {
				if viewModel.todoLists.isEmpty {
					Image(systemName: "tray.fill")
						.resizable()
						.scaledToFit()
						.frame(width: 150)
						.foregroundColor(Color.gray)
					Text("No lists yet")
						.foregroundColor(Color.gray)
				} else{
					List {
						ForEach(viewModel.todoLists) { list in
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
		.onAppear {
			viewModel.loadLists()
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
}

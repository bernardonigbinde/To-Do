//
//  ToDoListView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct ToDoListView: View {
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
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}


fileprivate extension LocalizedStringKey {
	static var title = LocalizedStringKey("todolist.header.title")
}

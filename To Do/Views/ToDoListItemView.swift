//
//  ToDoListItemView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct ToDoListItemView: View {
	@StateObject private var viewModel = ToDoListItemViewViewModel()

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
		ToDoListItemView()
    }
}

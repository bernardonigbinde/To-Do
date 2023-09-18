//
//  ToDoListViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ToDoListViewViewModel: BaseViewModel {
	@Published var isShowingNewItemView = false
}

//
//  ListsViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/18.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class ListsViewViewModel: BaseViewModel {
	@Published var isShowingNewListView = false
}

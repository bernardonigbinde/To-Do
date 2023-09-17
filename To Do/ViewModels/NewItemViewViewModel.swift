//
//  NewItemViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation

class NewItemViewViewModel: BaseViewModel {
	@Published var title: String = ""
	@Published var dueTime: Date = Date()
}

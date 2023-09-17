//
//  MainViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: BaseViewModel {
	@Published var currentUserId: String = ""
	private var handler: AuthStateDidChangeListenerHandle?
	var isSignedIn: Bool { Auth.auth().currentUser != nil && !currentUserId.isEmpty }
	
	override init() {
		super.init()
		
		handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
			DispatchQueue.main.async {
				self?.currentUserId = user?.uid ?? ""
			}
		}
	}
}

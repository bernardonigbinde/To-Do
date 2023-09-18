//
//  BaseViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation
import FirebaseAuth

class BaseViewModel: ObservableObject {
	var firebaseUser: FirebaseAuth.User? { Auth.auth().currentUser }
	
	func signOut() {
		do {
			try Auth.auth().signOut()
		} catch let error as NSError {
			print("Error signin out: %@", error)
		}
	}
}

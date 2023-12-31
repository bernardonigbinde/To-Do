//
//  String.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation


extension String {
	func isValidEmailAddress() -> Bool {
		let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
		let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
		return emailPredicate.evaluate(with: self) && !trimmingCharacters(in: .whitespaces).isEmpty
	}
	
	func isValidPassword() -> Bool {
		!trimmingCharacters(in: .whitespaces).isEmpty && count >= 8
	}
	
	func isValidMobileNumber() -> Bool {
		!trimmingCharacters(in: .whitespaces).isEmpty && CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
	}
}

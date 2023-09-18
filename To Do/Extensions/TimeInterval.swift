//
//  TimeInterval.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/18.
//

import Foundation

extension TimeInterval {
	func toFormattedDateTime() -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = "MMM dd, yyyy 'at' h:mm a"
		
		return formatter.string(from: Date(timeIntervalSince1970: self))
	}
}

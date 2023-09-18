//
//  View.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/18.
//

import Foundation
import SwiftUI

extension View {
	func swipeActions(leading: [SwipeActionButton] = [],
					  allowsFullSwipeLeading: Bool = false,
					  trailing: [SwipeActionButton] = [],
					  allowsFullSwipeTrailing: Bool = false) -> some View {
		modifier(SwipeActionView(leading: leading,
								 allowsFullSwipeLeading: allowsFullSwipeLeading,
								 trailing: trailing,
								 allowsFullSwipeTrailing: allowsFullSwipeTrailing))
	}
}

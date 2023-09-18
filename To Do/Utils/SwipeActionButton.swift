//
//  SwipeActionButton.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/18.
//

import SwiftUI

struct SwipeActionButton: View, Identifiable {
	static let width: CGFloat = 70
	
	let id = UUID()
	let text: Text?
	let icon: Image?
	let action: () -> Void
	let tint: Color?
	
	init(text: Text? = nil,
		 icon: Image? = nil,
		 action: @escaping () -> Void,
		 tint: Color? = nil) {
		self.text = text
		self.icon = icon
		self.action = action
		self.tint = tint ?? .gray
	}
	
	var body: some View {
		ZStack {
			tint
			VStack {
				icon?
					.foregroundColor(.white)
				if icon == nil {
					text?
						.foregroundColor(.white)
				}
			}
			.frame(width: SwipeActionButton.width)
		}
	}
}

struct SwipeActionButton_Previews: PreviewProvider {
    static var previews: some View {
		SwipeActionButton() {}
    }
}

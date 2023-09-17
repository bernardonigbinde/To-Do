//
//  ProfileView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct ProfileView: View {
	@StateObject private var viewModel = ProfileViewViewModel()

	var body: some View {
		NavigationView {
			VStack {
				
			}
			.navigationTitle(.title)
		}
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

fileprivate extension LocalizedStringKey {
	static var title = LocalizedStringKey("profile.header.title")
}

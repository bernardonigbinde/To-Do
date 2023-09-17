//
//  MainView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct MainView: View {
	@StateObject private var viewModel = MainViewViewModel()

    var body: some View {
		if viewModel.isSignedIn {
			DashboardView(userID: viewModel.currentUserId)
		} else {
			SignInView()
		}
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

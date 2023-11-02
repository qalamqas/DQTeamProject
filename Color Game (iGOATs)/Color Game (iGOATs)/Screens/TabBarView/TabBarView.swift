//
//  TabView.swift
//  Color Game (iGOATs)
//
//  Created by Bekpayev Dias on 16.10.2023.
//

import SwiftUI
import Foundation

struct TabBarView: View {
    @ObservedObject var viewModel: TabBarViewModel
    
    var body: some View {
        TabView {
            SettingsAssembly().build()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
                .toolbarBackground(.visible, for: .tabBar)
            
            ProfileAssembly().build()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .toolbarBackground(.visible, for: .tabBar)
            
            AboutProgramAssembly().build()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("About program")
                }
                .toolbarBackground(.visible, for: .tabBar)
        }
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarAssembly().build()
//    }
//}

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
            
            ProfileAssembly().build()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            
            AboutProgramAssembly().build()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("About program")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarAssembly().build()
    }
}

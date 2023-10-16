//
//  TabView.swift
//  Color Game (iGOATs)
//
//  Created by Bekpayev Dias on 16.10.2023.
//

import SwiftUI
import Foundation

struct TabBarView: View {
    
    var body: some View {
        TabView {
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            
            AboutProgramView()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("About program")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
         TabBarView()
    }
}

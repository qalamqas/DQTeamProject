//
//  ContentView.swift
//  Color Game (iGOATs)
//
//  Created by Bekpayev Dias on 03.10.2023.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    @State private var button1State = 1
    @State private var button2State = 1
    
    var body: some View {
        NavigationView {
            LazyVStack {
                Text("Settings")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                    .frame(height: 5)
                
                Text("Challenge your color vision.")
                Spacer()
                    .frame(height: 40)
                
                Button(action: {
                    self.button1State += 1
                    if self.button1State > 2 {
                        self.button1State = 1
                    }
                }) {
                    HStack{
                        Spacer()
                        VStack {
                            Text(self.button1Text(for: button1State))
                                .font(.headline)
                                .fixedSize(horizontal: true, vertical: true)
                            Text(self.button1Description(for: button1State))
                                .fixedSize(horizontal: true, vertical: true)
                        }
                        Spacer()
                        Text(">")
                        Spacer()
                            .frame(width: 60)
                    }
                }
                .frame(width: 350, height: 80)
                .background(.gray)
                .foregroundColor(.black)
                .cornerRadius(20)
                
                Button(action: {
                    self.button2State += 1
                    if self.button2State > 3 {
                        self.button2State = 1
                    }
                }) {
                    HStack {
                        Spacer()
                        VStack {
                            Text(self.button2Text(for: button2State))
                                .font(.headline)
                                .fixedSize(horizontal: true, vertical: true)
                            Text(self.button2Description(for: button2State))
                                .fixedSize(horizontal: true, vertical: true)
                        }
                        Spacer()
                        Text(">")
                        Spacer()
                            .frame(width: 60)
                    }
                }
                .frame(width: 350, height: 80)
                .background(.gray)
                .foregroundColor(.black)
                .cornerRadius(20)
                

                
                
                Button(action: {
                    Router.shared.showGameView()
                }) {
                    HStack{
                        Text("Start")
                    }
                }
                .buttonStyle(.borderedProminent)
                .frame(width: 350, height: 70)
                .cornerRadius(20)
            }
        }
    }
    
    
    private func button1Text(for state: Int) -> String {
        switch state {
        case 1:
            return "Normal mode"
        case 2:
            return "Colorblind mode"
        default:
            return ""
        }
    }
    
    private func button1Description(for state: Int) -> String {
        switch state {
        case 1:
            return "Test your attentiveness"
        case 2:
            return "Find out if you are colorblind"
        default:
            return ""
        }
    }
    
    private func button2Text(for state: Int) -> String {
        switch state {
        case 1:
            return "Easy"
        case 2:
            return "Medium"
        case 3:
            return "Hard"
        default:
            return ""
        }
    }
    
    private func button2Description(for state: Int) -> String {
        switch state {
        case 1:
            return "Choose your difficulty"
        case 2:
            return "Choose your difficulty"
        case 3:
            return "Choose your difficulty"
        default:
            return ""
        }
    }
}
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsAssembly().build()
        }
    }


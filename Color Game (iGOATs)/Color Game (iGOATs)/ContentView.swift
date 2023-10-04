//
//  ContentView.swift
//  Color Game (iGOATs)
//
//  Created by Bekpayev Dias on 03.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var button1State = 1
    @State private var button2State = 1
    @State private var button3State = 1
    
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
                .frame(width: 350, height: 70)
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
                .frame(width: 350, height: 70)
                .background(.gray)
                .foregroundColor(.black)
                .cornerRadius(20)
                
                Button(action: {
                    self.button3State += 1
                    if self.button3State > 3 {
                        self.button3State = 1
                    }
                }) {
                    HStack{
                        Spacer()
                        VStack {
                            Text(self.button3Text(for: button3State))
                                .font(.headline)
                                .fixedSize(horizontal: true, vertical: true)
                            Text(self.button3Description(for: button3State))
                                .fixedSize(horizontal: true, vertical: true)
                        }
                        Spacer()
                        Text(">")
                        Spacer()
                            .frame(width: 60)
                    }
                }
                .frame(width: 350, height: 70)
                .background(.gray)
                .foregroundColor(.black)
                .cornerRadius(20)
                
                Button(action: {
                    
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
            return "Singleplayer"
        case 2:
            return "Multiplayer"
        default:
            return ""
        }
    }
    
    private func button1Description(for state: Int) -> String {
        switch state {
        case 1:
            return "Play on your own"
        case 2:
            return "Play with friends"
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
    
    private func button3Text(for state: Int) -> String {
        switch state {
        case 1:
            return "⭐"
        case 2:
            return "🟨"
        case 3:
            return "💛"
        default:
            return ""
        }
    }
    
    private func button3Description(for state: Int) -> String {
        switch state {
        case 1:
            return "Select the shape of the figures"
        case 2:
            return "Select the shape of the figures"
        case 3:
            return "Select the shape of the figures"
        default:
            return ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

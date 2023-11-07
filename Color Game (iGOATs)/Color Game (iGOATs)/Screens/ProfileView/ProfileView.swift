//
//  RecordsView.swift
//  Color Game (iGOATs)
//
//  Created by Bekpayev Dias on 14.10.2023.
//

import SwiftUI
import UIKit
import Photos
import Foundation
import SwiftData

struct ProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    @ObservedObject var gameViewModel: GameViewModel
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    @State var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State var playerName: String = ""
    
    
    var body: some View {
        ZStack {
            ProfileBackgroundView()
            ScrollView(.vertical) {
                LazyVStack {
                    Spacer()
                        .frame(height: 70)
                    ScrollView {
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.blue, lineWidth: 5))
                                .padding(.top, 20)
                        } else {
                            Image(systemName: "person.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.blue, lineWidth: 5))
                                .padding(.top, 20)
                        }
                        
                        Button("Pick the photo") {
                            isImagePickerPresented = true
                        }
                        .sheet(isPresented: $isImagePickerPresented) {
                            ImagePicker(selectedImage: $selectedImage) {
                                pickedImage in
                                if let imageData = pickedImage?.jpegData(compressionQuality: 1.0) {
                                    UserDefaults.standard.setProfileImage(imageData)
                                    UserDefaults.standard.synchronize()
                                }
                            }
                        }
                        
                        TextField("Player name", text: $playerName, onEditingChanged: { isEditing in
                            if !isEditing {
                                UserDefaults.standard.setPlayerName(playerName)
                                UserDefaults.standard.synchronize()

                            }
                        })
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 10)
                            .multilineTextAlignment(.center)
                        
                        
//                        Text("Games played: \(settingsViewModel.gamesPlayed)")
//                            .font(.headline)
//                            .padding(.top, 5)
//                        
//                        Text("Total number of round wins: \(gameViewModel.totalWonRounds)")
//                            .font(.headline)
//                            .padding(.top, 5)
//                        
//                        Text("Total number of lost lives: \(gameViewModel.totalLostLives)")
//                            .font(.headline)
//                            .padding(.top, 5)
//                        
//                        Text("Records (Rounds)")
//                            .font(.headline)
//                            .padding(.top, 5)
//                            .padding(.bottom, 5)
//                        
//                        Grid {
//                            GridRow {
//                                Text("Difficulty")
//                                    .bold()
//                                Text("1")
//                                    .bold()
//                                Text("2")
//                                    .bold()
//                                Text("3")
//                                    .bold()
//                            }
//                            Divider()
//                            GridRow {
//                                Text("Baby-Time")
//                                    .bold()
//                                Text("\(gameViewModel.maxRounds[.colorMindGame]?[.babyTime1] ?? 0)")
//                                Text("\(gameViewModel.maxRounds[.colorMindGame]?[.babyTime2] ?? 0)")
//                                Text("0")
//                            }
//                            Divider()
//                            GridRow {
//                                Text("Easy")
//                                    .bold()
//                                Text("\(gameViewModel.maxRounds[.colorMindGame]?[.easy1] ?? 0)")
//                                Text("\(gameViewModel.maxRounds[.colorMindGame]?[.easy2] ?? 0)")
//                                Text("\(gameViewModel.maxRounds[.colorMindGame]?[.easy3] ?? 0)")
//                            }
//                            Divider()
//                            GridRow {
//                                Text("Medium")
//                                    .bold()
//                                Text("\(gameViewModel.maxRounds[.colorMindGame]?[.medium1] ?? 0)")
//                                Text("\(gameViewModel.maxRounds[.colorMindGame]?[.medium2] ?? 0)")
//                                Text("\(gameViewModel.maxRounds[.colorMindGame]?[.medium3] ?? 0)")
//                            }
//                            Divider()
//                            GridRow {
//                                Text("Hard")
//                                    .bold()
//                                Text("\(gameViewModel.maxRounds[.colorMindGame]?[.hard1] ?? 0)")
//                                Text("\(gameViewModel.maxRounds[.colorMindGame]?[.hard2] ?? 0)")
//                                Text("\(gameViewModel.maxRounds[.colorMindGame]?[.hard3] ?? 0)")
//                            }
//                        }
//                        
//                        Text("Records (Streak)")
//                            .font(.headline)
//                            .padding(.top, 5)
//                            .padding(.bottom, 5)
//                        
//                        Grid {
//                            GridRow {
//                                Text("Difficulty")
//                                    .bold()
//                                Text("1")
//                                    .bold()
//                                Text("2")
//                                    .bold()
//                                Text("3")
//                                    .bold()
//                            }
//                            Divider()
//                            GridRow {
//                                Text("Baby-Time")
//                                    .bold()
//                                Text("\(gameViewModel.maxStreaks[.colorMindGame]?[.babyTime1] ?? 0)")
//                                Text("\(gameViewModel.maxStreaks[.colorMindGame]?[.babyTime2] ?? 0)")
//                                Text("0")
//                            }
//                            Divider()
//                            GridRow {
//                                Text("Easy")
//                                    .bold()
//                                Text("\(gameViewModel.maxStreaks[.colorMindGame]?[.easy1] ?? 0)")
//                                Text("\(gameViewModel.maxStreaks[.colorMindGame]?[.easy2] ?? 0)")
//                                Text("\(gameViewModel.maxStreaks[.colorMindGame]?[.easy3] ?? 0)")
//                            }
//                            Divider()
//                            GridRow {
//                                Text("Medium")
//                                    .bold()
//                                Text("\(gameViewModel.maxStreaks[.colorMindGame]?[.medium1] ?? 0)")
//                                Text("\(gameViewModel.maxStreaks[.colorMindGame]?[.medium2] ?? 0)")
//                                Text("\(gameViewModel.maxStreaks[.colorMindGame]?[.medium3] ?? 0)")
//                            }
//                            Divider()
//                            GridRow {
//                                Text("Hard")
//                                    .bold()
//                                Text("\(gameViewModel.maxStreaks[.colorMindGame]?[.hard1] ?? 0)")
//                                Text("\(gameViewModel.maxStreaks[.colorMindGame]?[.hard2] ?? 0)")
//                                Text("\(gameViewModel.maxStreaks[.colorMindGame]?[.hard3] ?? 0)")
//                            }
//                        }
                    }
                 .frame(height: 500)
                }
            }
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileAssembly().build()
//    }
//}

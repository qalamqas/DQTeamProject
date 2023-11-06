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

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @ObservedObject var gameViewModel: GameViewModel
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    @State var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var playerName = ""
    var records: [Records] {
        return [
            Records(
                difficulty: "baby-time",
                column1: "\(gameViewModel.maxStreakBabyTime1)",
                column2: "\(gameViewModel.maxStreakBabyTime2)",
                column3: "0"),
            Records(
                difficulty: "Easy",
                column1: "\(gameViewModel.maxStreakEasy1)",
                column2: "\(gameViewModel.maxStreakEasy2)",
                column3: "\(gameViewModel.maxStreakEasy3)"),
            Records(
                difficulty: "Medium",
                column1: "\(gameViewModel.maxStreakMedium1)",
                column2: "\(gameViewModel.maxStreakMedium1)",
                column3: "\(gameViewModel.maxStreakMedium3)"),
            Records(
                difficulty: "Hard",
                column1: "\(gameViewModel.maxStreakHard1)",
                column2: "\(gameViewModel.maxStreakHard2)",
                column3: "\(gameViewModel.maxStreakHard3)")
        ]
    }
    
    var body: some View {
        ZStack {
            ProfileBackgroundView()
            ScrollView {
                Spacer()
                    .frame(height: 50)
                LazyVStack(alignment: .center) {
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
                        ImagePicker(selectedImage: $selectedImage)
                    }
                    
                    TextField("Player name", text: $playerName)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                        .multilineTextAlignment(.center)
                    
                    Text("Games played: \(settingsViewModel.gamesPlayed)")
                        .font(.headline)
                        .padding(.top, 5)
                    
                    Text("Total number of round wins: 75")
                        .font(.headline)
                        .padding(.top, 5)
                    
                    Text("Total number of lost lives: 30")
                        .font(.headline)
                        .padding(.top, 5)
                    
                    Table(records) {
                        TableColumn("Difficulty", value: \.difficulty)
                        TableColumn("1", value: \.column1)
                        TableColumn("2", value: \.column2)
                        TableColumn("3", value: \.column3)
                    }
                }
            }
            Spacer()
                .frame(height: 50)
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileAssembly().build()
//    }
//}

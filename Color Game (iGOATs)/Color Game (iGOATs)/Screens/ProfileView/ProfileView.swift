//
//  RecordsView.swift
//  Color Game (iGOATs)
//
//  Created by Bekpayev Dias on 14.10.2023.
//

import SwiftUI
import UIKit
import Photos

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    
    var body: some View {
        ZStack {
            ProfileBackgroundView()
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
                .foregroundColor(.yellow)
                
                Text("Player name")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                Text("Games played: 100")
                    .font(.headline)
                    .padding(.top, 5)
                
                Text("Total number of victories: 75")
                    .font(.headline)
                    .padding(.top, 5)
                
                Text("Total number of defeats: 30")
                    .font(.headline)
                    .padding(.top, 5)
                
                Text("Record of victories without defeats in easy mode: 25")
                    .font(.headline)
                    .padding(.top, 5)
                    .multilineTextAlignment(.center)
                
                Text("Record of victories without defeats in medium mode: 25")
                    .font(.headline)
                    .padding(.top, 5)
                    .multilineTextAlignment(.center)
                
                Text("Record of victories without defeats in hard mode: 25")
                    .font(.headline)
                    .padding(.top, 5)
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
    }
}


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
        LazyVStack {
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
            
            Button("Выбрать фото") {
                isImagePickerPresented = true
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            Text("Имя Игрока")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            Text("Сыграно игр: 100")
                .font(.headline)
                .padding(.top, 5)
            
            Text("Побед: 75")
                .font(.headline)
                .padding(.top, 5)
            
            Text("Рекорд побед без поражений: 30")
                .font(.headline)
                .padding(.top, 5)
            
            Text("Поражений: 25")
                .font(.headline)
                .padding(.top, 5)
            
            Spacer()
        }
    }
}



//
//  RecordsView.swift
//  Color Game (iGOATs)
//
//  Created by Bekpayev Dias on 14.10.2023.
//

import SwiftUI
import UIKit

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State var selectedImage: UIImage?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
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
                let imagePicker = UIImagePickerController()
                imagePicker.sourceType = .photoLibrary
                imagePicker.delegate = self.makeCoordinator()
                if let windowScene = UIApplication.shared.connectedScenes
                    .filter({ $0.activationState == .foregroundActive })
                    .first as? UIWindowScene {
                    if let window = windowScene.windows.first {
                        window.rootViewController?.present(imagePicker, animated: true, completion: nil)
                    }
                }
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

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var parent: ProfileView
    
    init(_ parent: ProfileView) {
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            parent.selectedImage = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}


//struct Profile_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarAssembly().build()
//    }
//}


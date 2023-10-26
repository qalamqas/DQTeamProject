//
//  RecordsView.swift
//  Color Game (iGOATs)
//
//  Created by Bekpayev Dias on 14.10.2023.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        LazyVStack {
            Image("person.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 5))
                .padding(.top, 20)
            
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

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        TabBarAssembly().build()
    }
}


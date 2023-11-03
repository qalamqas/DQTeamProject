//
//  BackgroundView.swift
//  Color Game (iGOATs)
//
//  Created by Bekpayev Dias on 02.11.2023.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
          GeometryReader { geometry in
              Image("Background")
                  .resizable()
                  .scaledToFill()
                  .frame(width: geometry.size.width, height: geometry.size.height)
          }
          .edgesIgnoringSafeArea(.all)
      }
}

struct ProfileBackgroundView: View {
    var body: some View {
          GeometryReader { geometry in
              Image("ProfileBackground")
                  .resizable()
                  .scaledToFill()
                  .frame(width: geometry.size.width, height: geometry.size.height)
          }
          .edgesIgnoringSafeArea(.all)
      }
}

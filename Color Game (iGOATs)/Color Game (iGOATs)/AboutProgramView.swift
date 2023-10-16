//
//  AboutProgramView.swift
//  Color Game (iGOATs)
//
//  Created by Bekpayev Dias on 14.10.2023.
//

import SwiftUI

struct AboutProgramView: View {
    var paragraphStyle: NSParagraphStyle {
        let style = NSMutableParagraphStyle()
        style.alignment = .justified
        return style
    }
    
    var body: some View {
        LazyVStack(spacing: 1) {
            Text("About program")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)
                
            HStack {
                Text("Program name: ")
                    .bold()
                    .padding()
                Text("Color game")
                Spacer()
            }
            .padding(.leading, 10)
            
            HStack {
                
                Text("Program version: ")
                    .bold()
                    .padding()
                Text("0.6")
                Spacer()
            }
            .padding(.leading, 10)
            
            
            HStack {
                Text("Developer Information: ")
                    .bold()
                    .padding()
                Text("<<iGOATs>>")
                Spacer()
            }
            .padding(.leading, 10)
            
            HStack {
                Text("Contact Information: ")
                    .bold()
                    .padding()
                Text("iGOATs@gmail.com")
                Spacer()
            }
            .padding(.leading, 10)
            
            HStack{
                Text("Game rules: ")
                    .bold()
                    .padding()
                Spacer()
            }
            .padding(.leading, 10)
            
            JustifiedText("The goal of the game is to find a pair of the same color, while the difficulty of the game is selected by the user")
                .padding()
                .frame(height: 94)
            
            JustifiedText("This application is designed to test your visual attention and also test for color blindness if desired. The application was developed as a practice for novice programmers, don’t judge strictly.")
                .frame(height: 110)
                .padding()
            
        }
        .padding()
    }
}

struct AboutProgram_Previews: PreviewProvider {
    static var previews: some View {
        AboutProgramView()
    }
}

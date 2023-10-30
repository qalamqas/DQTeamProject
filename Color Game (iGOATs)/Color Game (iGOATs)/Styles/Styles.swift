//
//  Styles.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 24.10.2023.
//

import SwiftUI

struct ColorButtonStyle: ButtonStyle {
    var background: Color
    var shapeType: ShapeType
    var isBorder: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 60, height: 60)
            .background(
                ZStack {
                    ColorButtonShape(shapeType: shapeType)
                        .fill(background)
                        .overlay(
                            ColorButtonShape(shapeType: shapeType)
                                .stroke(Color.black, lineWidth: isBorder ? 2 : 0)
                        )
                }
            )
            .scaleEffect(configuration.isPressed ? 0.5 : 1.0)
    }
}

struct ColorButtonShape: Shape {
    var shapeType: ShapeType
    
    func path(in rect: CGRect) -> Path {
        switch shapeType {
        case .heart:
            return HeartShape().path(in: rect)
        case .square:
            return RoundedRectangle(cornerSize: CGSize(width: 12, height: 12)).path(in: rect)
        case .circle:
            return Circle().path(in: rect)
        }
    }
}


struct HeartShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY ))
        
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.height/4),
                      control1:CGPoint(x: rect.midX, y: rect.height*3/4) ,
                      control2: CGPoint(x: rect.minX, y: rect.midY) )
        path.addArc(center: CGPoint( x: rect.width/4,y: rect.height/4),
                    radius: (rect.width/4),
                    startAngle: Angle(radians: Double.pi),
                    endAngle: Angle(radians: 0),
                    clockwise: false)
        path.addArc(center: CGPoint( x: rect.width * 3/4,y: rect.height/4),
                    radius: (rect.width/4),
                    startAngle: Angle(radians: Double.pi),
                    endAngle: Angle(radians: 0),
                    clockwise: false)
        path.addCurve(to: CGPoint(x: rect.midX, y: rect.height),
                      control1: CGPoint(x: rect.width, y: rect.midY),
                      control2: CGPoint(x: rect.midX, y: rect.height*3/4) )
        return path
    }
}


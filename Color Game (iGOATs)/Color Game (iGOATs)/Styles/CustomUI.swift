//
//  CustomUI.swift
//  Color Game (iGOATs)
//
//  Created by Bekpayev Dias on 16.10.2023.
//

import SwiftUI

struct JustifiedText: UIViewRepresentable {
    private let value: String
    init(_ string: String) {
        value = string
    }

    func makeUIView(context: Context) -> UILabel {
        let view = UILabel()
        view.textAlignment = .justified
        view.numberOfLines = 0
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        view.text = value
        view.textColor = .yellow
        return view
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
    }
}

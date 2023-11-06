//
//  AlertItem.swift
//  Color Game (iGOATs)
//
//  Created by Bekpayev Dias on 06.11.2023.
//

import Foundation

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let primaryActionTitle: String
    let secondaryActionTitle: String
    let primaryAction: () -> Void
    let secondaryAction: () -> Void
}

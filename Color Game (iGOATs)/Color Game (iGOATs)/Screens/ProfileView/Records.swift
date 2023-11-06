//
//  Records.swift
//  Color Game (iGOATs)
//
//  Created by Bekpayev Dias on 06.11.2023.
//

import Foundation


struct Records: Identifiable {
    var id = UUID()
    var difficulty: String
    var column1: String
    var column2: String
    var column3: String
}

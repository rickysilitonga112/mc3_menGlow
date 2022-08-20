//
//  Routine.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 18/08/22.
//

import Foundation



struct Routine: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var time: Date
    var isEnable: Bool
    var products: [Product]
}




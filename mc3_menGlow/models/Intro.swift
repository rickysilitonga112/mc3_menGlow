//
//  Intro.swift
//  mc3_menGlow
//
//  Created by Arma Qurrota Ayuni on 23/08/22.
//

import Foundation
import SwiftUI


struct Intro: Identifiable {
    var id = UUID().uuidString
    var title: String
    var subTitle: String
    var description: String
    var pic: String
    var color: Color
    var offset: CGSize = .zero
        
}

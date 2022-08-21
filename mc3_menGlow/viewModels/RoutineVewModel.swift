//
//  RoutineVewModel.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 18/08/22.
//

import Foundation
import UIKit
import SwiftUI


class RoutineViewModel: ObservableObject {
    static let shared = RoutineViewModel()
    
    
    @Published var routineList: [Routine] = [
        Routine(
            title: "Morning Routine",
            image: "routinelist_morning",
            time: Date.now,
            isEnable: false,
            products: Product.getProduct(),
            image2: "header_morningsungreen"
        ),
        Routine(
            title: "Night Routine",
            image: "routinelist_evening",
            time: Date.now,
            isEnable: false,
            products: Product.getProduct(),
            image2: "header_nightmoonwhite"
        )
    ]
    
    
    func getIndex(id: UUID) -> Int {
        let index = 0
         
        return index
    }
}

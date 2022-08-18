//
//  RoutineVewModel.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 18/08/22.
//

import Foundation
import UIKit


class RoutineViewModel: ObservableObject {
    static let shared = RoutineViewModel()
    
    
    @Published var routineList: [Routine] = [
        Routine(
            title: "Morning Routine",
            image: "routinelist_morning",
            time: Date.now,
            isEnable: false,
            products: [
                Product(title: "Sunscreen", isCheck: true),
                Product(title: "Moisturizer", isCheck: false)
            ]
        ),
        Routine(
            title: "Night Routine",
            image: "routinelist_evening",
            time: Date.now,
            isEnable: false,
            products: [
                Product(title: "Sunscreen", isCheck: true),
                Product(title: "Moisturizer", isCheck: false)
            ]
        )
    ]
    
}

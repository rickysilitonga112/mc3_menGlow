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
            products: Product.getProduct()
        ),
        Routine(
            title: "Night Routine",
            image: "routinelist_evening",
            time: Date.now,
            isEnable: false,
            products: Product.getProduct()
        )
    ]
    
    
    func addNewRoutine(_ newRoutine: Routine) {
        routineList.append(newRoutine)
    }
    
    
//    func getIndex(id: UUID) -> Int {
//        var index = 0
//         
//        return index
//    }
}

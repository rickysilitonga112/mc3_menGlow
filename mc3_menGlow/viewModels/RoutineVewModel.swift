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
            products: Product.getProduct())
//        Routine(
//            title: "Night Routine",
//            image: "routinelist_evening",
//            time: Date.now,
//            isEnable: false,
//            products: Product.getProduct())
    ]
    
    // nyimpan history
    @Published var record: [Record] = []
    
    
    func addNewRoutine(_ newRoutine: Routine) {
        routineList.append(newRoutine)
    }

    func getDashboardRoutineImage(title: String) -> String {
        if title == "Morning Routine" {
            return "header_morningsungreen"
        } else if title == "Night Routine" {
            return "header_nightmoonwhite"
        } else {
            return ""
        }
    }
    
    func addRecord(_ newrecord: Record) {
        record.append(newrecord)
    }
    
    func getTagViewItem(routine: Routine) -> [String] {
        var tagItems: [String] = []
        
        for product in routine.products {
            if product.isCheck {
                tagItems.append(product.title)
            }
        }
        
        return tagItems
    }
    
}

struct Record: Identifiable {
    var id = UUID()
    
    let routineTitle: String
    let time: Date
    var product: [Product]
}

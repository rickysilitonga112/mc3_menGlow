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
    
    @Published var indexShow: Int = 0
    @Published var showEmptyState: Bool = false
    
    @Published var routineList: [Routine] = [
        Routine(
            title: "Morning Routine",
            image: "routinelist_morning",
            time: Date.now,
            isEnable: false,
            products: Product.getProduct()),
        Routine(
            title: "Night Routine",
            image: "routinelist_evening",
            time: Date.now,
            isEnable: false,
            products: Product.getProduct())
    ]
    
    // nyimpan history
    @Published var record: [Record] = []
    
    var totalProgress: Int {
        routineList.map { $0.products.filter { $0.isUsed }.count }.reduce(0, +)
    }
    
    var totalProduct: Int {
        routineList.map { $0.products.count }.reduce(0, +)
    }
    
    var percentageProgress: Double {
        Double(totalProgress) / Double(totalProduct)
    }
    
    func addNewRoutine(_ newRoutine: Routine) {
        routineList.append(newRoutine)
    }
    
    func checkMorningRoutine() {
        for i in 0..<routineList[0].products.count {
            routineList[0].products[i].isUsed.toggle()
        }
     }
    
    func checkRoutineEnable() -> Bool {
        for i in 0 ... routineList.count - 1 {
            if routineList[i].isEnable {
                return true
            }
        }
        return false
    }
    
    func checkRoutineProductEnable() -> Bool {
        for i in 0 ... routineList.count - 1 {
            for j in 0 ... routineList[i].products.count - 1 {
                if routineList[i].products[j].isCheck {
                    return true
                }
            }
        }
        return false
    }
    
    func getRoutineIndex(id: UUID) -> Int {
        var index: Int = 0
        
        for i in 0 ... routineList.count - 1 {
            if routineList[i].id == id {
                index = i
            }
        }
        return index
    }

    func getDashboardRoutineImage(title: String) -> String {
        if title == "Morning Routine" {
            return "header_morningsungreen"
        } else if title == "Night Routine" {
            return "header_nightmoonwhite"
        } else {
            return "customheader"
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

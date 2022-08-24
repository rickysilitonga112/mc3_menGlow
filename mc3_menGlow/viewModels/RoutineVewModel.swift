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
    
    // nyimpan history
    @Published var record: [Record] = []
    
    @Published var typeCard: [SkinType] = [
        SkinType(title:"Normal", description: "Characteristics of normal skin include a regular texture and a soft appearance. It's not too dry and not too oily.", pic:"normal_skin"),
        SkinType(title:"Dry",description: "Your skin can crack, peel, or become itchy, irritated, or inflamed. If it’s very dry, it can become rough and scaly.", pic:"dry_skin"),
        SkinType(title:"Oily",description: "Oily skin has a porous, humid and bright appearance. It is caused by excessive fat production by sebaceous glands.", pic:"oily_skin"),
        SkinType(title:"Combination",description: "It presents characteristics of both dry and oily skin since the distribution of sebaceous and sweat glands is not homogeneous.", pic:"combination_skin"),
    ]
    
    @Published var concernCard: [SkinConcern] = [
        SkinConcern(title:"Acne", description: "A skin condition that occurs when your hair follicles become plugged with oil and dead skin cells.", pic:"acne"),
        SkinConcern(title:"Razor Burn",description: "A condition in which shaving causes inflammation and bumps to develop on the skin.", pic:"razor_burn"),
        SkinConcern(title:"Sunspot",description: "Sunspots are harmless, flat brown spots that develop on areas of skin frequently exposed to the sun.", pic:"sunspot"),
        SkinConcern(title:"Dark Circle",description: "Dark circles under your eyes happen when the skin beneath both eyes appears darkened.", pic:"dark_circle"),
        SkinConcern(title:"Sensitive",description: "It is a fragile skin, usually accompanied by feelings of discomfort, such as heat, tightness, redness or itching.", pic:"sensitive"),

    ]
    
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

//
//  RoutineDay.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 22/08/22.
//

import Foundation

struct RoutineDay: Identifiable {
    var id = UUID()
    var day: String
    var isChoose: Bool = true
    
    
    static func getRoutineDays() -> [RoutineDay] {
        let days: [String] = ["S", "M", "T", "W", "T", "F", "S"]
        
        var routineDays = [RoutineDay]()
        
        for day in days {
            routineDays.append(RoutineDay(day: day))
        }
        return routineDays
    }
}

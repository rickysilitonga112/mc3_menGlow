//
//  ProgressViewModel.swift
//  mc3_menGlow
//
//  Created by Amalia . on 21/08/22.
//

import Foundation
import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var storedTasks:[ProgressModel] = [
        ProgressModel(taskDate: .init(timeIntervalSince1970: 1641645497)),
        ProgressModel(taskDate: .init(timeIntervalSince1970: 1641649097)),
        ProgressModel(taskDate: .init(timeIntervalSince1970: 1641652697)),
        ProgressModel(taskDate: .init(timeIntervalSince1970: 1641656297)),
        ProgressModel(taskDate: .init(timeIntervalSince1970: 1641661897)),
        ProgressModel(taskDate: .init(timeIntervalSince1970: 1641641897)),
        ProgressModel(taskDate: .init(timeIntervalSince1970: 1641677897)),
        ProgressModel(taskDate: .init(timeIntervalSince1970: 1641681497))
    ]
    
    //MARK: Current Week Days
    @Published var currentWeek: [Date] = []
    
    //MARK: Current Day
    @Published var currentDate: Date = Date()
    
    //MARK: Initializing
    init(){
        FetchCurrentWeek()
    }
    
    func FetchCurrentWeek() {
        
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else {
            return
        }
        
        (1...7).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
            
        }
    }
    
    //MARK: Extracting Date
    func extractDate(date: Date, format: String)->String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    //MARK: Checking if current Date is Today
    func isToday(date: Date)->Bool{
        
        let calendar = Calendar.current
        
        return calendar.isDate(currentDate, inSameDayAs: date)
    }
    
    
 }

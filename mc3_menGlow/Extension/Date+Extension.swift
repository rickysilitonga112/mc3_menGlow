//
//  Date+Extension.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 22/08/22.
//

import Foundation

extension Date {
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

//
//  Product.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 18/08/22.
//

import Foundation


struct Product: Identifiable {
    var id = UUID()
    var title: String
    var isCheck: Bool
    var productName: String

    static func getProduct() -> [Product] {
        let products = [
            Product(title: "Cleanser", isCheck: true, productName: ""),
            Product(title: "Moisturizer", isCheck: true, productName: ""),
            Product(title: "Sunscreen", isCheck: false, productName: ""),
            Product(title: "Toner", isCheck: false, productName: ""),
            Product(title: "Serum", isCheck: false, productName: ""),
            Product(title: "Night Cream", isCheck: false, productName: ""),
            Product(title: "Mask", isCheck: false, productName: "")
        ]
        
        return products
    }
}

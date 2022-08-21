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
    var icon: String

    static func getProduct() -> [Product] {
        let products = [
            Product(title: "Cleanser", isCheck: true, productName: "", icon: "cleanser_icon"),
            Product(title: "Moisturizer", isCheck: false, productName: "", icon: "moisturizer_icon"),
            Product(title: "Sunscreen", isCheck: false, productName: "", icon: "sunscreen_icon"),
            Product(title: "Toner", isCheck: false, productName: "", icon: "toner_icon"),
            Product(title: "Serum", isCheck: false, productName: "", icon: "serum_icon"),
            Product(title: "Night Cream", isCheck: false, productName: "", icon: "moisturizer_icon"),
            Product(title: "Mask", isCheck: false, productName: "", icon: "moisturizer_icon")
        ]
        
        return products
    }
}

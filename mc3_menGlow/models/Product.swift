//
//  Product.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 18/08/22.
//

import Foundation


struct Product {
    let title: String
    let isCheck: Bool

    func getProduct() -> [Product] {
        let products = [
            Product(title: "Cleanser", isCheck: false),
            Product(title: "Moisturizer", isCheck: false),
            Product(title: "Sunscreen", isCheck: false),
            Product(title: "Toner", isCheck: false),
            Product(title: "Serum", isCheck: false),
            Product(title: "Night Cream", isCheck: false),
            Product(title: "Mask", isCheck: false)
        ]
        
        return products
    }
}

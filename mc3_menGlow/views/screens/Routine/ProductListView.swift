//
//  ProductListView.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 16/08/22.
//

import SwiftUI

struct ProductListView: View {
    @State private var productList: [ProductList] = [
        ProductList(productName: "Cleanser", isCheck: true),
        ProductList(productName: "Moisturizer", isCheck: true),
        ProductList(productName: "Sunscreen", isCheck: true),
        ProductList(productName: "Toner", isCheck: false),
        ProductList(productName: "Serum", isCheck: false),
        ProductList(productName: "Night Cream", isCheck: false),
        ProductList(productName: "Mask", isCheck: false)
    ]
    var body: some View {
        VStack {
            
            HStack {
                Text("Product List")
                Spacer()
            }
            //product list
//            List($productList, id: \.self) { (product: Binding<ProductList>) in
//                Toggle(isOn: product.isCheck) {
//                    Text("\(product.productName)")
//                }
//            }
            
            // button
        }
        .padding(.horizontal)    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}


struct ProductList: Identifiable {
    var id = UUID()
    let productName: String
    let isCheck: Bool
}

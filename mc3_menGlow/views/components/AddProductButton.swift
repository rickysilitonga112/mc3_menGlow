//
//  AddProductButton.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 20/08/22.
//

import SwiftUI

struct AddProductButton: View {
    let title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "plus.circle.fill")
                    .frame(width: 22, height: 22)
                    .foregroundColor(kSecondaryColor)
                Text(title)
                    .foregroundColor(kSecondaryColor)
            }
            
            Spacer()
        }
    }
}

struct AddProductButton_Previews: PreviewProvider {
    
    static var previews: some View {
        AddProductButton(title: "Add New Product") {
            print("Add product item function")
        }
    }
}

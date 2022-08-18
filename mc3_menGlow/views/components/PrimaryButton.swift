//
//  PrimaryButton.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 16/08/22.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .font(.title)
                .frame(width: 250, height: 50)
                .padding()
                .foregroundColor(.white)
                .background(Color(red: 70/255, green: 73/255, blue: 48/255))
                .cornerRadius(25)
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Test") {
            print("Test")
        }
    }
}

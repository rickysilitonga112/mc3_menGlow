//
//  TagView.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 21/08/22.
//

import Foundation
import SwiftUI

struct TagViewPlacement: View {
    let tagItems: [String]
    
    
    var groupedItems: [[String]] = [[String]]()
    let screenWidth = UIScreen.main.bounds.width
    
    
    init(items: [String]) {
        self.tagItems = items
        self.groupedItems = createGroupedItems(tagItems)
    }
    
    private func createGroupedItems(_ items: [String]) -> [[String]]{
        var groupedItems: [[String]] = [[String]]()
        var tempItems: [String] = [String]()
        var width: CGFloat = 0
        
        for word in items {
            let label = UILabel()
            
            label.text = word
            label.sizeToFit()
            
            let labelWidth = label.frame.size.width + 32
            
            if (width + labelWidth + 14) < screenWidth {
                width += labelWidth
                tempItems.append(word)
            } else {
                width = labelWidth
                groupedItems.append(tempItems)
                tempItems.removeAll()
                tempItems.append(word)
            }
        }
        
        groupedItems.append(tempItems)
        return groupedItems
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(groupedItems, id: \.self) { subItems in
                HStack() {
                    ForEach(subItems, id: \.self) { word in
                        TagView(tagText: word)
                    }
                }
            }
            
            Spacer()
        }
    }
}


struct TagView: View {
    let tagText: String
    var body: some View {
        Text(tagText)
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Capsule().fill(kSecondaryColor))
    }
}

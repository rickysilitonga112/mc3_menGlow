//
//  CustomRoutine.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 18/08/22.
//

import SwiftUI

struct DailyRepeat: Identifiable {
    var id = UUID()
    let day: Day
    var isChoose: Bool
}

struct CustomRoutine: View {
    @StateObject var routineVM: RoutineViewModel
    
    @State private var title: String = ""
    @State private var time: Date = Date.now
    @State private var products: [Product] = Product.getProduct()
    
    var body: some View {
        VStack(spacing: 30) {
            // textfield
            TextField("Routine Name", text: $title)
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(kSecondaryColor, lineWidth: 2)
                        .frame(height: 42)
                )
                .frame(height: 42)
                .padding(.horizontal)
            
            // time picker
            HStack {
                Text("Time for routine")
                    .fontWeight(.semibold)
                Spacer()
                DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                    .labelsHidden()
            } .padding(.horizontal)
            
            
            VStack {
                HStack {
                    Text("When do you want to repeat?")
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                HStack {
                    
                    ForEach(0 ..< 7) { item in
                        Circle()
                            .fill(Color.green)
                            .frame(width: 40, height: 40, alignment: .center)
                            .overlay(
                                Text("S")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                        )
                        Spacer()
                    }
                    
                }
            } .padding(.horizontal)
            
            LazyVStack {
                ForEach($products) { $product in
                    if product.isCheck {
                        VStack {
                            HStack {
                                Text(product.title)
                                Spacer()
                                Button {
                                    product.isCheck.toggle()
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .frame(width: 20, height: 22)
                                        .foregroundColor(kSecondaryColor)
                                }
                            }
                            
                            TextField("Product Name", text: $product.productName)
                        }
                    }
                }
            } .padding(.horizontal)
            
            Spacer()
            
        }
        .navigationTitle("Custom Routine")
        .navigationBarTitleDisplayMode(.large)
    }
    
}

struct CustomRoutine_Previews: PreviewProvider {
    static var previews: some View {
        CustomRoutine(routineVM: RoutineViewModel())
    }
}

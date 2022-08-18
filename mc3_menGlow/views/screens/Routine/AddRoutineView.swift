//
//  AddRoutineView.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 16/08/22.
//

import SwiftUI

struct AddRoutineView: View {
    @State private var routineTime = Date.now
    @State private var routineName: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Morning Routine")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            
            HStack {
                Text("Time for routine")
                Spacer()
                DatePicker("", selection: $routineTime, displayedComponents: .hourAndMinute)
                    .labelsHidden()
            }
            
            HStack {
                Text("What skincare product that you use?")
                Spacer()
            }
            
            VStack {
                HStack {
                    Text("Cleanser")
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "trash.fill")
                            .frame(width: 20, height: 22)
                    }
                }
                
                TextField("Product Name", text: $routineName)
            }
            
            Button {
                // add new skincare product
            } label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .frame(width: 22, height: 22)
                    Text("Add New Skincare Product")
                }
                
                Spacer()
            }
            
            Spacer()
            HStack {
                Spacer()
                PrimaryButton(title: "Save") {
                    // Save new routine
                }
                Spacer()
            }
            
        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        AddRoutineView()
    }
}

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
    
    
    @State var presentSheet: Bool = false
    @Binding var routine: Routine
//    @Binding var showAddRoutineView: Bool

    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("\(routine.title)")
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
                presentSheet.toggle()
            } label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .frame(width: 22, height: 22)
                        .foregroundColor(kPrimaryColor)
                    Text("Add New Skincare Product")
                        .foregroundColor(kPrimaryColor)
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
        .sheet(isPresented: $presentSheet) {
            ProductListView(routine: $routine, presentSheet: $presentSheet)
        }
    }
    
}

struct AddRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        AddRoutineView(routine: .constant(Routine(title: "", image: "", isEnable: false, products: [], image2: "")))
    }
}

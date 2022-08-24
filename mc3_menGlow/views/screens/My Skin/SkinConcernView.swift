//
//  SkinConcernView.swift
//  mc3_menGlow
//
//  Created by Arma Qurrota Ayuni on 24/08/22.
//

import SwiftUI
struct SkinProfile: Identifiable{
        var id = UUID()
        var title: String
        var description: String
        var pic: String
        var isChoose: Bool = false
}

struct SkinConcernView: View {
   
    @StateObject var concernVM = RoutineViewModel.shared
    
    @State var skinType: [SkinProfile] = [
        SkinProfile(title:"Normal", description: "Characteristics of normal skin include a regular texture and a soft appearance. It's not too dry and not too oily.", pic:"normal_skin"),
        SkinProfile(title:"Dry",description: "Your skin can crack, peel, or become itchy, irritated, or inflamed. If it’s very dry, it can become rough and scaly.", pic:"dry_skin"),
        SkinProfile(title:"Oily",description: "Oily skin has a porous, humid and bright appearance. It is caused by excessive fat production by sebaceous glands.", pic:"oily_skin"),
        SkinProfile(title:"Combination",description: "It presents characteristics of both dry and oily skin since the distribution of sebaceous and sweat glands is not homogeneous.", pic:"combination_skin"),
    ]
    
    @State var skinConcern: [SkinProfile] = [
        SkinProfile(title:"Acne", description: "A skin condition that occurs when your hair follicles become plugged with oil and dead skin cells.", pic:"acne"),
        SkinProfile(title:"Razor Burn",description: "A condition in which shaving causes inflammation and bumps to develop on the skin.", pic:"razor_burn"),
        SkinProfile(title:"Sunspot",description: "Sunspots are harmless, flat brown spots that develop on areas of skin frequently exposed to the sun.", pic:"sunspot"),
        SkinProfile(title:"Dark Circle",description: "Dark circles under your eyes happen when the skin beneath both eyes appears darkened.", pic:"dark_circle"),
        SkinProfile(title:"Sensitive",description: "It is a fragile skin, usually accompanied by feelings of discomfort, such as heat, tightness, redness or itching.", pic:"sensitive"),

    ]
    
    var body: some View {
     
        InsertSkinView(pageTitle: "Choose Your Skin Type", skinProfile: $skinType)
        
    }
}

struct SkinConcernView_Previews: PreviewProvider {
    static var previews: some View {
        SkinConcernView()
    }
}

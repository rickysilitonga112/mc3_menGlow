//
//  mc3_menGlowApp.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 15/08/22.
//

import SwiftUI

@main
struct mc3_menGlowApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//            OnboardingView()
            SkinConcernView()

                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

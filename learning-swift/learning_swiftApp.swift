//
//  learning_swiftApp.swift
//  learning-swift
//
//  Created by Piotr prom on 06/03/2023.
//

import SwiftUI

@main
struct learning_swiftApp: App {
  @StateObject private var modelData = ModelData()

  let persistenceController = PersistenceController.shared

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        .environmentObject(modelData)
      }
  }
}

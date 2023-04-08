//
//  ContentView.swift
//  learning-swift
//
//  Created by Piotr prom on 06/03/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @State private var selection: Tab = .featured
  
  enum Tab {
    case featured
    case list
  }
  
  var body: some View {
      TabView(selection: $selection) {
        StopWatch()
          .tabItem {
            Label("Stopwatch", systemImage: "timer")
          }
        Badge()
          .tabItem {
            Label("Badge", systemImage: "person.crop.circle")
          }
        HikeView(hike: ModelData().hikes[0])
          .tabItem {
            Label("Hikes", systemImage: "waveform")
          }
        CategoryHome()
          .tabItem {
            Label("Featured", systemImage: "star")
          }
          .tag(Tab.featured)
        
        LandmarkList()
          .tabItem {
            Label("List", systemImage: "list.bullet")
          }
          .tag(Tab.list)
    }
  }
  
  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ForEach(["iPhone SE (3rd generation)", "iPhone 14", "My mac", "iPad Pro (11-inch) (4th generation)"], id: \.self) { deviceName in
        ContentView()
          .previewLayout(.device)
          .previewDevice(PreviewDevice(rawValue: deviceName))
          .previewDisplayName(deviceName)
          .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
          .environmentObject(ModelData())
      }
    }
  }
}

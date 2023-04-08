//
//  StopWatch.swift
//  learning-swift
//
//  Created by Piotr prom on 29/03/2023.
//

import SwiftUI

struct StopWatch: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    animation: .default)
  private var items: FetchedResults<Item>
  
  
  var body: some View {
    NavigationView {
      List {
        ForEach(items, id: \.self) { item in
          NavigationLink {
            Text("Item at \(item.timestamp!, formatter: itemFormatter)").foregroundColor(.teal)
              .toolbar {
                ToolbarItem(placement: .principal) {
                  HStack(alignment: .center) {
                    Text("\(item.description.count)")
                      .multilineTextAlignment(.center)
                      .accessibilityAddTraits([.isHeader])
                  }
                    .padding(.leading, 30.0)
                }
            }

          } label: {
              Text(item.timestamp!, formatter: itemFormatter)
          }
            .navigationTitle("Timer")
        }
          .onDelete(perform: deleteItems)
      }
      .toolbar {
        ToolbarItem(placement: .principal) {
          VStack {
            Text("Timer")
              .multilineTextAlignment(.center)
              .accessibilityAddTraits([.isHeader])
          }
        }

#if os(iOS)
          ToolbarItem(placement: .navigationBarTrailing) {
            EditButton()
          }
#endif
          ToolbarItem {
            Button(action: addItem) {
              Label("Add Item", systemImage: "plus")
            }
          }
        }
        Text("Select an item")
      }
    }
  
  private func addItem() {
    withAnimation {
      let newItem = Item(context: viewContext)
      newItem.timestamp = Date()

      do {
        try viewContext.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }

  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      offsets.map { items[$0] }.forEach(viewContext.delete)

      do {
        try viewContext.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
}

private let itemFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .medium
  return formatter
}()

struct StopWatch_Previews: PreviewProvider {
    static var previews: some View {
        StopWatch()
    }
}

//
//  ContentView.swift
//  FakeUI
//
//  Created by ash on 1/15/25.
//

import SwiftUI

struct DefaultView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 3) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                    .font(.title)
            }
            Text("Latest Items:")
            LazyHGrid(rows: Array(repeating: GridItem(.flexible(minimum: 100)), count: 2), spacing: 5) {
                Text("1")
                    .frame(width: 100, height: 60)
                    .background(Color.secondary.opacity(0.3))
                    .mask(RoundedRectangle(cornerRadius: 10))
                Text("2")
                    .frame(width: 100, height: 60)
                    .background(Color.secondary.opacity(0.3))
                    .mask(RoundedRectangle(cornerRadius: 10))
                Text("3")
                    .frame(width: 100, height: 60)
                    .background(Color.secondary.opacity(0.3))
                    .mask(RoundedRectangle(cornerRadius: 10))
                Text("4")
                    .frame(width: 100, height: 60)
                    .background(Color.secondary.opacity(0.3))
                    .mask(RoundedRectangle(cornerRadius: 10))
                Text("5")
                    .frame(width: 100, height: 60)
                    .background(Color.secondary.opacity(0.3))
                    .mask(RoundedRectangle(cornerRadius: 10))
                Text("6")
                    .frame(width: 100, height: 60)
                    .background(Color.secondary.opacity(0.3))
                    .mask(RoundedRectangle(cornerRadius: 10))
            }
            HStack(spacing: 5) {
                
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(VisualEffectView(material: .headerView, blendingMode: .behindWindow).edgesIgnoringSafeArea(.all))
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            // Sidebar
            VStack {
                TextField("Search", text: .constant(""))
                    .padding(5)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                List {
                    Section(header: Text("Main")) {
                        NavigationLink(destination: DefaultView()) {
                            Label("Home", systemImage: "house")
                        }
                        NavigationLink(destination: DefaultView()) {
                            Label("Browse", systemImage: "square.grid.2x2.fill")
                        }
                    }
                    
                    Section(header: Text("Library")) {
                        NavigationLink(destination: DefaultView()) {
                            Label("Items", systemImage: "circle.circle.fill")
                        }
                        
                        NavigationLink(destination: DefaultView()) {
                            Label("Lists", systemImage: "list.bullet")
                        }
                    }
                }
                .listStyle(SidebarListStyle())
                .navigationTitle("Menu")
            }
                
                // Default main view shown on launch
                DefaultView()
        }
    }
}

#Preview {
    ContentView()
}

struct VisualEffectView: NSViewRepresentable {
    let material: NSVisualEffectView.Material
    let blendingMode: NSVisualEffectView.BlendingMode
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
        visualEffectView.state = .active
        return visualEffectView
    }
    
    func updateNSView(_ visualEffectView: NSVisualEffectView, context: Context) {
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
    }
}

import SwiftUI
import PlaygroundSupport

/*
 SwiftUI View Lifecycle Explained in Simple Terms
 
 A view's lifecycle is like the life of a person - it's born, it grows, it changes, and eventually it dies.
 In SwiftUI, views go through these main stages:
 
 1. CREATION - The view is born (init)
 2. APPEARANCE - The view shows up on screen (onAppear)
 3. UPDATES - The view changes when data changes (body gets called)
 4. DISAPPEARANCE - The view goes away (onDisappear)
 5. DEATH - The view is removed from memory (deinit)
 */

// MARK: - Example 1: Basic View Lifecycle
struct LifecycleExampleView: View {
    @State private var message = "Hello, I'm alive!"
    @State private var counter = 0
    
    // This is called when the view is CREATED (born)
    init() {
        print("🎯 INIT: View is being created (born)")
    }
    
    var body: some View {
        // This is called EVERY TIME the view needs to UPDATE
        print("🔄 BODY: View is updating/redrawing")
        
        return VStack(spacing: 20) {
            Text("SwiftUI View Lifecycle Demo")
                .font(.title)
                .padding()
            
            Text(message)
                .foregroundColor(.blue)
            
            Text("Counter: \(counter)")
                .font(.headline)
            
            Button("Tap to Update") {
                counter += 1
                message = "I've been updated \(counter) times!"
            }
            .buttonStyle(.borderedProminent)
            
            NavigationLink("Go to Next View", destination: SecondView())
                .buttonStyle(.bordered)
        }
        .padding()
        // This is called when the view APPEARS on screen
        .onAppear {
            print("👋 ON APPEAR: View just showed up on screen")
        }
        // This is called when the view DISAPPEARS from screen
        .onDisappear {
            print("👋 ON DISAPPEAR: View just left the screen")
        }
    }
}

// MARK: - Example 2: Second View to Demonstrate Navigation Lifecycle
struct SecondView: View {
    @State private var isVisible = true
    
    init() {
        print("🎯 SECOND VIEW INIT: Second view is being created")
    }
    
    var body: some View {
        print("🔄 SECOND VIEW BODY: Second view is updating")
        
        return VStack(spacing: 20) {
            Text("Second View")
                .font(.title)
            
            Text("This view demonstrates lifecycle during navigation")
                .multilineTextAlignment(.center)
                .padding()
            
            if isVisible {
                Text("I'm visible!")
                    .foregroundColor(.green)
                    .transition(.opacity)
            }
            
            Button("Toggle Visibility") {
                withAnimation {
                    isVisible.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear {
            print("👋 SECOND VIEW ON APPEAR: Second view appeared")
        }
        .onDisappear {
            print("👋 SECOND VIEW ON DISAPPEAR: Second view disappeared")
        }
    }
}

// MARK: - Example 3: Advanced Lifecycle with State Changes
struct AdvancedLifecycleView: View {
    @State private var name = ""
    @State private var age = 0
    @State private var showDetails = false
    
    // Step 1: Creation
    init() {
        print("🎯 View created!")
    }
    
    var body: some View {
        print("🔄 DETAILS BODY: PersonDetailsView updating")
        
        return VStack {
            Text("Person Details")
                .font(.headline)
            
            Text("Name: \(name.isEmpty ? "Anonymous" : name)")
            Text("Age: \(age)")
            
            Text("This child view has its own lifecycle!")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal)
        .onAppear {
            print("👋 DETAILS ON APPEAR: PersonDetailsView appeared")
        }
        .onDisappear {
            print("👋 DETAILS ON DISAPPEAR: PersonDetailsView disappeared")
        }
    }
}

// MARK: - Main App View
struct MainAppView: View {
    var body: some View {
        NavigationView {
            TabView {
                LifecycleExampleView()
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("Basic")
                    }
                
                AdvancedLifecycleView()
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("Advanced")
                    }
            }
            .navigationTitle("SwiftUI Lifecycle")
        }
    }
}

/*
 KEY LIFECYCLE METHODS EXPLAINED:

 1. init() - Called when the view is FIRST CREATED
    - Happens only ONCE when the view is born
    - Use for initial setup that doesn't depend on data
    
 2. body - Called EVERY TIME the view needs to update
    - Happens when @State, @Binding, or other data changes
    - Should be fast and not have side effects
    
 3. onAppear() - Called when view APPEARS on screen
    - Good for starting timers, fetching data, etc.
    - Can be called multiple times (when navigating back and forth)
    
 4. onDisappear() - Called when view DISAPPEARS from screen
    - Good for cleanup, stopping timers, saving data
    - Can be called multiple times
    
 5. onChange() - Called when a specific value changes
    - Use to react to specific data changes
    - Very useful for validation or side effects
    
 IMPORTANT NOTES:
 - body is called VERY OFTEN, so keep it fast!
 - onAppear/onDisappear can be called multiple times
 - Use @State for data that belongs to the view
 - Views are structs, so they're recreated frequently
 - SwiftUI is smart about only updating what actually changed
*/

// Set up the playground
PlaygroundPage.current.setLiveView(MainAppView())

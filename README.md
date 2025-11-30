# SwiftUI View Lifecycle Guide

Learn how SwiftUI views are born, live, and die with simple examples!

## What is View Lifecycle?

Think of a SwiftUI view like a person's life:
- 🎯 **Birth** - The view is created
- 👋 **Growing up** - The view appears on screen  
- 🔄 **Living** - The view updates when things change
- 💔 **Going away** - The view disappears from screen
- ⚰️ **Death** - The view is removed from memory

## The 5 Main Lifecycle Steps

### 1. Creation (Birth) - `init()`
This happens when your view is first made.
```swift
init() {
    print("I'm being born!")
}
```

### 2. Appearance - `onAppear()`
This happens when your view shows up on screen.
```swift
.onAppear {
    print("Hello! I'm now visible!")
}
```

### 3. Updates - `body`
This happens every time your view needs to change.
```swift
var body: some View {
    print("I'm updating myself!")
    return Text("Hello World")
}
```

### 4. Disappearance - `onDisappear()`
This happens when your view goes away from screen.
```swift
.onDisappear {
    print("Goodbye! I'm leaving now!")
}
```

### 5. Watching Changes - `onChange()`
This happens when specific data changes.
```swift
.onChange(of: userName) { oldName, newName in
    print("Name changed from \(oldName) to \(newName)")
}
```

## Simple Example

Here's a basic view that shows all lifecycle steps:

```swift
struct MyView: View {
    @State private var count = 0
    
    // Step 1: Creation
    init() {
        print("🎯 View created!")
    }
    
    // Step 3: Updates (called many times)
    var body: some View {
        VStack {
            Text("Count: \(count)")
            Button("Add 1") {
                count += 1
            }
        }
        // Step 2: Appearance
        .onAppear {
            print("👋 View appeared!")
        }
        // Step 4: Disappearance
        .onDisappear {
            print("💔 View disappeared!")
        }
        // Step 5: Watching changes
        .onChange(of: count) { old, new in
            print("Count changed from \(old) to \(new)")
        }
    }
}
```

## What You'll Learn

This playground teaches you:

✅ When views are created and destroyed  
✅ How to run code when views appear/disappear  
✅ How to watch for data changes  
✅ How parent and child views work together  
✅ Best practices for each lifecycle step  

## Examples in This Project

### 1. Basic Lifecycle Demo
- Shows all 5 lifecycle steps
- Simple counter example
- Navigation between views

### 2. Advanced Examples
- Form with text fields
- Parent-child view relationships
- Animations and transitions
- Data watching with `onChange`

## Important Tips

💡 **The `body` runs A LOT** - Keep it fast!  
💡 **Views can appear/disappear multiple times** - Don't assume it happens once  
💡 **Use `onAppear` for setup** - Like starting timers or loading data  
💡 **Use `onDisappear` for cleanup** - Like stopping timers or saving data  
💡 **Use `onChange` for reactions** - When you need to do something when data changes  

## How to Run

1. Open the `.playground` file in Xcode
2. Click the play button ▶️
3. Watch the console for lifecycle messages
4. Interact with the demo to see lifecycle in action!

## Console Output Example

When you run the playground, you'll see messages like:
```
🎯 INIT: View is being created (born)
🔄 BODY: View is updating/redrawing
👋 ON APPEAR: View just showed up on screen
📝 NAME CHANGED: From '' to 'John'
👋 ON DISAPPEAR: View just left the screen
```

Each emoji helps you understand what's happening when!

---

Happy learning! 🎉 This will help you build better SwiftUI apps by understanding when things happen in your views.

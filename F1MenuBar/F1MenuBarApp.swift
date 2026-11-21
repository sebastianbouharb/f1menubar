//
//  F1MenuBarApp.swift
//  F1MenuBar
//
//  Created by Sebastian Bou Harb on 11/20/26.
//

import SwiftUI

@main

//Or alternatively, to create a utility app that only shows in the menu bar.

//```
//@main
//struct UtilityApp: App {
//    var body: some Scene {
//        MenuBarExtra("Utility App", systemImage: "hammer") {
//            AppMenu()
//        }
//    }
//}
//```

//For more complex or data rich menu bar extras, you can use the
//[`window`](/documentation/SwiftUI/MenuBarExtraStyle/window) style, which displays a popover-like window
//from the menu bar icon that contains standard controls. You define the
//layout and contents of those controls with the content that you provide:
//
//```
//MenuBarExtra("Utility App", systemImage: "hammer") {
//    ScrollView {
//        LazyVGrid(...)
//    }
//}
//.menuBarExtraStyle(.window)
//```

struct F1MenuBarApp: App {
    
    var body: some Scene {
        MenuBarExtra("F1MenuBar", systemImage: "flag.pattern.checkered") {
                VStack(alignment: .leading, spacing: 10){
                    ContentView()
                }
            }
        .menuBarExtraStyle(.window)
        }
    }


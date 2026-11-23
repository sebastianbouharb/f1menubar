//
//  ClearWindowMaker.swift
//  F1MenuBar
//
//  Created by Sebastian Bou Harb on 11/22/26.
//

import AppKit
import SwiftUI

struct WindowAccessor: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        DispatchQueue.main.async {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                if let window = view.window {
                    window.isOpaque = false
                    window.backgroundColor = .clear
                    window.hasShadow = false
                }
            }
        }
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}

func dumpViews(_ view: NSView, depth: Int = 0) {
    print(String(repeating: "  ", count: depth) + String(describing: type(of: view)))
    for sub in view.subviews {
        dumpViews(sub, depth: depth + 1)
    }
}
//What each part does:
//
//NSViewRepresentable is a protocol for wrapping an AppKit view (NSView) so SwiftUI can use it like any other view. It requires the two functions you see.
//makeNSView creates the AppKit view once. Here it's an empty NSView(), which we only use as a handle.
//view.window is the window the view lives in. At the moment the view is created, it hasn't been placed in a window yet, so it's nil. DispatchQueue.main.async waits a moment until it has been placed, and then reads it.
//updateNSView runs when SwiftUI state changes. We have nothing to update, so it's empty.


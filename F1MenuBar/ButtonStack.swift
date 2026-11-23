//
//  ButtonStack.swift
//  F1MenuBar
//
//  Created by Sebastian Bou Harb on 11/22/26.
//

import SwiftUI

struct ButtonStack: View {
    
    @State private var isHovering = false;
    let strongBlue = Color(red: 0.135, green: 0.625, blue: 1.46)
    
    var body: some View {
        HStack{
            
            Button {
                
            } label: {
                ZStack {
                    Circle()
                        .fill(.clear)
                        .frame(width: 80, height: 22)
                        .glassEffect(.regular.tint(strongBlue))
                    
                    Text("Preferences")
                        .font(.caption)
                        .fontWeight(.bold)
                        .scaleEffect(1.0)
                }
                
            }
            .buttonStyle(.borderless)
            .frame(alignment: .leading)
            .padding(10)
            
            
            
            Button {
                //NSApplication: the class that represents the runnning mac app
                //.shared is the type property that returns the one app object for the process. , like getInstance() in Java. Gets the object without the explicit name
                //.terminate(nil) is a method on the object that asks the app to quit. nil is what sends the request, in this case, a sender isnt needed
                NSApplication.shared.terminate(nil)
            } label: {
                ZStack{
                    Circle()
                        .fill(.clear)
                        .frame(width: isHovering ? 22 : 17, height: isHovering ? 22:  17)
                        .glassEffect(.regular.tint(.red))
                    
                    Image(systemName: "xmark")
                        .font(.caption)
                        .fontWeight(.heavy)
                        .scaleEffect(isHovering ? 1.2 : 1.0)
                    
                    
                    
                }.frame(width: 40, height: 25)
            }
            .buttonStyle(.borderless)
            .onHover{ hovering in
                withAnimation(.smooth(duration: 0.2)){
                    isHovering = hovering
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(10)
            .keyboardShortcut("Q", modifiers: [.command])
        }.glassEffect(.clear)
            .frame(maxWidth: .infinity)
    }
}

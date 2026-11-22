//
//  ContentView.swift
//  F1MenuBar
//
//  Created by Sebastian Bou Harb on 11/20/26.
//

// creating a shortcut:
// .keyboardShortcut("KEY", modifiers: [MODIFIER, MODIFIER])

import SwiftUI

let strongRed = Color(red: 1.0, green: 0.0, blue: 0.0)

struct ContentView: View {
    
    @State private var isHovering = false;
    @State private var drivers : [DriverStandings] = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("2026 Drivers Standings").font(.title).bold()
            ForEach(drivers.prefix(10),id: \.Driver.driverId){driver in
                
                let team = driver.Constructors.first
                Text("P\(driver.positionText)  \(driver.Driver.givenName) \(driver.Driver.familyName) -  \(team?.name ?? "no name" )").fontWeight(.bold)
                Text("          \(driver.points) Points")
            }
                
        }
        .padding()
        .task {
            do {
                drivers =  try await fetchStandings()
            } catch {
                print(error)
            }
        }
//        1. Check the data arrives. Add a print of drivers.count after the fetch line, run the app, open the popover and read the console. You expect 25. If you see an error instead, paste it to me, because it names the key that failed.
        
        
        
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
            .offset(x: 15, y: 7)
            
        
    }
        
        
    
}



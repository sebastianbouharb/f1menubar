//
//  ContentView.swift
//  F1MenuBar
//
//  Created by Sebastian Bou Harb on 11/20/26.
//

// creating a shortcut:
// .keyboardShortcut("KEY", modifiers: [MODIFIER, MODIFIER])

import SwiftUI

struct ContentView: View {
    
    @State private var drivers : [DriverStandings] = []
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 10){
                Text("2026 Drivers Standings").font(.title).bold()
                ForEach(drivers.prefix(10),id: \.Driver.driverId){driver in
                    
                    let first = driver.Constructors.first
                    Text("P\(driver.positionText)  \(driver.Driver.givenName) \(driver.Driver.familyName) -  \(first?.name ?? "no name" )").fontWeight(.bold)
                    Text("          \(driver.points) Points")
                        .frame(maxWidth: .infinity)
                    
                }
                
            }
            .padding(10)
            .task {
                do {
                    drivers =  try await fetchStandings()
                } catch {
                    print(error)
                }
            }
            //        1. Check the data arrives. Add a print of drivers.count after the fetch line, run the app, open the popover and read the console. You expect 25. If you see an error instead, paste it to me, because it names the key that failed.
            
            
        }.glassEffect(in: .rect(cornerRadius: 15.0))
            .padding(7)
    }
        
        
    
}



//
//  ContentViewOLD.swift
//  F1MenuBar
//
//  Created by Sebastian Bou Harb on 11/20/26.
//

// creating a shortcut:
// .keyboardShortcut("KEY", modifiers: [MODIFIER, MODIFIER])

import SwiftUI

struct ContentViewOLD: View {
    
    @State private var drivers : [DriverStandings] = []
    
    var body: some View {
            VStack(alignment: .leading, spacing: 10 ){
                HStack{
                    Text("2026 Drivers' Standings").font(.title).bold()
                }.glassEffect(in: .rect(cornerRadius: 15.0))
                    .padding(7)
                
                HStack{
                    Text("POS.").font(.caption).bold()
                    Text("DRIVER").font(.caption).bold()
                    Text("NATIONALITY").font(.caption).bold()
                    Text("TEAM").font(.caption).bold()
                    Text("POINTS").font(.caption).bold()
                }.glassEffect(in: .rect(cornerRadius: 15.0))
                    .padding(7)
                
                VStack{
                    ForEach(drivers.prefix(10),id: \.Driver.driverId){driver in
                        HStack {
                            let first = driver.Constructors.first
                            Text("\(driver.positionText)  \(driver.Driver.givenName) \(driver.Driver.familyName) -  \(first?.name ?? "no name" )").fontWeight(.bold)
                            Text("\(driver.points)")
                                .frame(maxWidth: .infinity)
                        }
                        
                    }
                }.glassEffect(in: .rect(cornerRadius: 15.0))
                    .frame(maxWidth: .infinity)
                    .padding(7)
                
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
            
            
    }
        
        
    
}



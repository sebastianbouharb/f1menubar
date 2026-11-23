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

    @State private var isHovering = false;
    @State private var state: LoadState = .loading
    
    let strongBlue = Color(red: 0.135, green: 0.625, blue: 1.46)
    
    var body: some View {
        
        Group {
            switch state {
            case .loading:
                Text("Loading")
                ProgressView()
            case .loaded(let drivers):
                
                
                HStack{
                    Text("2026 Drivers' Standings").font(.title).bold()
                        .padding(10)
                }.glassEffect(in: .rect(cornerRadius: 15.0))
                    .frame(maxWidth: .infinity)
                    .padding(10)
                
                
                VStack(alignment: .leading, spacing: 10 ){
                    
                    // The overall content view window
                    VStack{
                        
                        HStack{ // Horizontal Stack of Each Section : POS | DRIVER | NATIONALITY | TEAM | POINTS
                            VStack(alignment: .leading, spacing: 4){ // POS
                                Text("Pos.").font(.caption).fontWeight(.heavy)
                                ForEach(drivers.prefix(25),id: \.Driver.driverId){driver in
                                    Text("\(driver.positionText)").fontWeight(.bold)
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 4){ //DRIVER
                                Text("Driver").font(.caption).fontWeight(.heavy)
                                ForEach(drivers.prefix(25),id: \.Driver.driverId){driver in
                                    Text("\(driver.Driver.familyName)").fontWeight(.bold).frame(alignment: .leading)
                                }
                            }
                            
                            //                    VStack{ // NATIONALITY
                            //                        Text("Nat.").font(.caption).fontWeight(.heavy)
                            //                        ForEach(drivers.prefix(10),id: \.Driver.driverId){driver in
                            //                            Text("\(driver.Driver.nationality)").fontWeight(.bold)
                            //                        }
                            //                    }
                            
                            VStack(alignment: .leading, spacing: 4){ //Team
                                Text("Team").font(.caption).fontWeight(.heavy)
                                ForEach(drivers.prefix(25),id: \.Driver.driverId){driver in
                                    let first = driver.Constructors.first
                                    Text("\(first?.name ?? "no name")")
                                }
                            }
                            
                            VStack(alignment: .trailing, spacing: 4){
                                Text("Points").font(.caption).fontWeight(.heavy)
                                ForEach(drivers.prefix(25),id: \.Driver.driverId){driver in
                                    Text("\(driver.points)")
                                }
                            }
                        }
                        
                        Button {
                            Task {
                                await load()
                            }
                        } label : {
                            ZStack{
                                Circle()
                                    .fill(.clear)
                                    .frame(width: isHovering ? 27 : 22, height: isHovering ? 27:  22)
                                    .glassEffect(.regular.tint(strongBlue))
                                
                                Image(systemName: "arrow.clockwise")
                                    .font(.caption)
                                    .fontWeight(.heavy)
                                    .scaleEffect(isHovering ? 1.4 : 1.2)
                                
                                
                                
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
                        .keyboardShortcut("R", modifiers: [.command])
                        .offset(x: 20, y: 12)
                    }
                    .padding(10)
                    
                }
                .glassEffect(in: .rect(cornerRadius: 15.0))
                .frame(maxWidth: .infinity)
                .padding(10)
            case .failedToLoad(let message):
                Text(message)
            }
        }.task {
            await load()
        }
        //        1. Check the data arrives. Add a print of drivers.count after the fetch line, run the app, open the popover and read the console. You expect 25. If you see an error instead, paste it to me, because it names the key that failed.
    }
    
    func load() async {
        do {
            state = .loading
            let result = try await fetchStandings()
            state = .loaded(result)
        } catch {
            state = .failedToLoad(error.localizedDescription)
        }
    }
    }




//
//  Models.swift
//  F1MenuBar
//
//  Created by Sebastian Bou Harb on 11/21/26.
//

// Structs are fast, stored in the stack, and objects in the stack are value types

// Value types are copied and mutated


import Foundation
import SwiftUI


struct Response: Codable  { // contains all data from api
    let MRData: MRData
}

struct MRData: Codable{ // focuses on the API's standings table
    let total: String
    let StandingsTable: StandingsTable
}

struct StandingsTable: Codable { // branches of the Standings table according to API
    let season : String
    let round : String
    let StandingsLists : Array<StandingsLists>
}

struct StandingsLists: Codable { // branches of the Standings list according to API
    let season : String
    let round  : String
    let DriverStandings : Array<DriverStandings>
    let ConstructorStandings : Array<ConstructorStandings>?
}

struct ConstructorStandings: Codable { // branches of the Constructors standings
    let position : String
    let positionText : String
    let points : String
    let wins: String
    let Constructor : Constructor
}

struct DriverStandings: Codable { // branches of the Drivers standings according to API

    let position : String
    let positionText : String
    let points : String
    let wins : String
    let Driver : Driver
    let Constructors : Array<Constructor>
}

struct Driver: Codable { // elements of a Driver
    let driverId : String
    let permanentNumber: String
    let code : String
    let url : String
    let givenName : String
    let familyName : String
    let dateOfBirth : String
    let nationality : String
}

struct Constructor: Codable  { // elements of a Constructor
    let constructorId : String
    let url: String
    let name : String
    let nationality : String
}

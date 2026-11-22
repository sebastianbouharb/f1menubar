//
//  API.swift
//  F1MenuBar
//
//  Created by Sebastian Bou Harb on 11/22/26.
//
import Foundation


//func fetchStandings() declares the function, like func in Go.
////async throws means two things: the function can pause while waiting on the network, and it can fail with an error. Anyone who calls it must use await and try.
////-> [DriverStandings] is the return type, an array of your DriverStandings struct. [X] is shorthand for Array<X>, which you’ve been writing out.
////URL(string:) returns an optional, because a bad string could fail. The ! at the end says “I’m sure this works.” That’s fine for a fixed address you’ve checked, but it would crash if the string were malformed. You could use guard let later to handle that more safely.


func fetchStandings() async throws -> [DriverStandings] {
    let url = URL(string: "https://api.jolpi.ca/ergast/f1/2026/driverstandings/")!
    
//    1. Download. The Go version was http.Get(url), then io.ReadAll(resp.Body).
//    URLSession.shared.data(from:) does the request and reads the whole body in one call, so it replaces both Go lines.
//    It gives back two things at once, a tuple: the raw bytes (data) and information about the reply (response). The let (a, b) = ... form unpacks both.
//    try replaces if err != nil { return err }. If the call fails, the error is passed up to whoever called your function automatically. await is the "pause while the network works" part.
    let (data, response) = try await URLSession.shared.data(from: url)
    
//    2. Decode. The Go version was json.Unmarshal(body, &result).
//    JSONDecoder() is the decoder object. It's like creating the json machinery in Go.
//    You pass it a type, Response.self, not a pointer to a variable. .self means "the type itself". It builds and returns a new Response, so you don't create an empty one first.
//    Again try stands in for the error check. A wrong key name or type is thrown here.
//
    
    let decoded = try JSONDecoder().decode(Response.self, from: data)
    
//    3. Return the list. The Go version was lists[0].DriverStandings.
//    It's the same dot path you followed in Go, with [0] for the first item.
//    In Go you checked len(lists) == 0 first. In Swift, [0] on an empty array crashes the app. The data should always have an item, so it's fine for now, but a safer version would check first.
    
    return decoded.MRData.StandingsTable.StandingsLists[0].DriverStandings
}

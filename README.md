# F1MenuBar

A macOS menu bar app that shows the current Formula 1 driver standings. Click the checkered flag in the menu bar to see live points, teams, and positions.

![F1MenuBar screenshot](<img width="307" height="745" alt="Screenshot 2026-11-23 at 4 04 52 PM" src="https://github.com/user-attachments/assets/63067920-30af-4dd6-953f-d671b743f1d0" />
)

## Features

- Live 2026 driver standings from the [Jolpica F1 API](https://api.jolpi.ca/ergast/f1/)
- Liquid Glass popover UI built with SwiftUI
- Loading and error states, so the app never shows a blank window
- Refresh button to re-fetch standings on demand
- Hover-animated glass Quit button

## Run it

1. Requires macOS 26 (Liquid Glass) and Xcode.
2. Clone the repo:
   ```
   git clone git@github.com:sebastianbouharb/f1menubar.git
   ```
3. Open the project in Xcode and press **Run** (Command-R).
4. Look for the flag icon in your menu bar. The app has no Dock icon.

## How it works

- `API.swift` fetches the standings with `URLSession` and `async/await`.
- `Models.swift` holds the `Codable` structs that decode the JSON, plus a `LoadState` enum (`loading`, `loaded`, `failedToLoad`).
- `ContentView.swift` switches on `LoadState` to decide what to show.

## What I learned

- Building a menu bar app with SwiftUI's `MenuBarExtra`
- Fetching and decoding JSON with `Codable`, `async/await`, and `URLSession`
- Modeling UI state with an enum with associated values and a `switch`
- Working with the macOS App Sandbox (outgoing network entitlement)

## Roadmap

- Constructor standings
- Preferences window
- Race calendar

//
//  ContentView.swift
//  NavigationAPI
//
//  Created by Sachin Sabat on 2023-09-09.
//

import SwiftUI

enum Games: String, CaseIterable {
    case football = "Football"
    case cricket = "Cricket"
    case hockey = "Hockey"
}


struct GamesListView: View {
    @Binding var games: Games?

    var body: some View {
        List(Games.allCases, 
             id: \.self,
             selection: $games) { games in
            Text(games.rawValue)
        }
    }
}

struct GamesDetailView: View {
    let games: Games
    var body: some View {
        NavigationStack {
            NavigationLink(games.rawValue) {
                Text(games.rawValue)
            }
        }
    }
}

struct ContentView: View {
    @State private var games: Games? = .cricket

    var body: some View {
        NavigationSplitView {
            GamesListView(games: $games)
        } detail: {
            GamesDetailView(games: games ?? .cricket)
        }

    }
}

#Preview {
    ContentView()
}

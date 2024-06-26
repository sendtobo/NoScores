//
//  ContentView.swift
//  NoScores
//
//  Created by Bo Oelkers on 3/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @State var loading = false

    @State var date: Date = .now
    @State var games: [Game] = []

    @State var datePickerId = 1

    var body: some View {
        NavigationStack {
            List {
                Section {
                    DatePicker("Games on:", selection: $date, displayedComponents: .date)
                        .id(datePickerId)
                        .onChange(of: date) { _, _ in
                            datePickerId += 1
                        }
                    Button {
                        date = .now
                    } label: {
                        Text("Today")
                    }

                }
                if loading {
                    HStack(alignment: .center) {
                        Spacer()
                        VStack(alignment: .center) {
                            Text("Fetching Games")
                            ProgressView()
                                .id(datePickerId)
                        }
                        Spacer()
                    }
                } else {
                    Section("Games") {
                        ForEach(games) { game in
                            GameView(game: game)
                                .alignmentGuide(.listRowSeparatorLeading){ _ in 0 }
                        }
                    }
                }
            }
            .onAppear(perform: {
                date = .now
                loadGames()
            })
            .onChange(of: date) { _, _ in
                loadGames()
            }
        }
    }

    func loadGames() {
        loading = true
        Task {
            let games = await API.shared.fetchGames(date: date)
            DispatchQueue.main.async {
                self.games = games
                self.loading = false
            }
        }
    }
}

struct GameView: View {
    let game: Game

    var homeTeam: LocalTeam {
        LocalTeam(rawValue: game.homeTeam.abbreviation)!
    }

    var awayTeam: LocalTeam {
        LocalTeam(rawValue: game.awayTeam.abbreviation)!
    }

    var body: some View {
        VStack {
            HStack {
                TeamView(team: awayTeam)
                Spacer().frame(width: .infinity)
                VStack {
                    Text(game.startTime.formatted(date: .omitted, time: .shortened))
                }
                .fixedSize()
                Spacer().frame(width: .infinity)
                TeamView(team: homeTeam)
            }
        }
    }
}

struct TeamView: View {
    let team: LocalTeam
    var body: some View {
        VStack {
            Image(team.rawValue)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 40)
                .aspectRatio(contentMode: .fit)
            Text(team.name)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContentView()
}

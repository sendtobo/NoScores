//
//  API.swift
//  NoScores
//
//  Created by Bo Oelkers on 3/11/24.
//

import Foundation

class API {
    static var shared = API()

    private var dataTasks: [URLSessionDataTask] = []

    func fetchGames(date: Date) async -> [Game] {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        var month = "\(components.month!)"
        if month.count == 1 {
            month = "0\(month)"
        }
        var day = "\(components.day!)"
        if day.count == 1 {
            day = "0\(day)"
        }
        let url = URL(string: "https://api-web.nhle.com/v1/schedule/\(components.year!)-\(month)-\(day)")!
        return await withUnsafeContinuation { continuation in
            let task = URLSession.shared.dataTask(with: .init(url: url)) { data, response, error in
                continuation.resume(returning: try! JSONDecoder().decode(Response.self, from: data!).gameWeek.first!.games)
            }
            dataTasks.append(task)
            task.resume()
        }
    }
}

struct Response: Codable {
    var gameWeek: [GameWeek]
}

struct GameWeek: Codable {
    var games: [Game]
}

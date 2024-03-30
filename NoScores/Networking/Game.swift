//
//  Game.swift
//  NoScores
//
//  Created by Bo Oelkers on 3/11/24.
//

import Foundation

struct Game: Codable, Identifiable {
    let id: Int
    let venue: String
    let startTime: Date
    let awayTeam: Team
    let homeTeam: Team

    enum CodingKeys: String, CodingKey {
        case id
        case venue
        case startTime = "startTimeUTC"
        case awayTeam
        case homeTeam
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let venueContainer = try container.decode(DefaultContainer.self, forKey: .venue)
        self.venue = venueContainer.default
        let startTimeString = try container.decode(String.self, forKey: .startTime)

        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.timeZone = .init(identifier: "UTC")
        self.startTime = dateFormatter.date(from: startTimeString)!
        self.awayTeam = try container.decode(Team.self, forKey: .awayTeam)
        self.homeTeam = try container.decode(Team.self, forKey: .homeTeam)

        self.id = try container.decode(Int.self, forKey: .id)
    }
}

struct Team: Codable {
    var abbreviation: String
    var place: String
    var logoURL: String
    var darkLogoURL: String

    enum CodingKeys: String, CodingKey {
        case abbreviation = "abbrev"
        case place = "placeName"
        case logoURL = "logo"
        case darkLogoURL = "darkLogo"
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.abbreviation = try container.decode(String.self, forKey: .abbreviation)
        let placeContainer = try container.decode(DefaultContainer.self, forKey: .place)
        self.place = placeContainer.default
        self.logoURL = try container.decode(String.self, forKey: .logoURL)
        self.darkLogoURL = try container.decode(String.self, forKey: .darkLogoURL)
    }
}

struct DefaultContainer: Codable {
    var `default`: String
}

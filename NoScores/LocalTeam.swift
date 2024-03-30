//
//  TeamMapper.swift
//  NoScores
//
//  Created by Bo Oelkers on 3/11/24.
//

import Foundation

enum LocalTeam: String {
    case AnaheimDucks = "ANA"
    case ArizonaCoyotes = "ARI"
    case BostonBruins = "BOS"
    case BuffaloSabres = "BUF"
    case CalgaryFlames = "CGY"
    case CarolinaHurricanes = "CAR"
    case ChicagoBlackhawks = "CHI"
    case ColoradoAvalanche = "COL"
    case ColumbusBlueJackets = "CBJ"
    case DallasStars = "DAL"
    case DetroitRedWings = "DET"
    case EdmontonOilers = "EDM"
    case FloridaPanthers = "FLA"
    case LosAngelesKings = "LAK"
    case MinnesotaWild = "MIN"
    case MontrealCanadiens = "MTL"
    case NashvillePredators = "NSH"
    case NewJerseyDevils = "NJD"
    case NewYorkIslanders = "NYI"
    case NewYorkRangers = "NYR"
    case OttawaSenators = "OTT"
    case PhiladelphiaFlyers = "PHI"
    case PittsburghPenguins = "PIT"
    case SanJoseSharks = "SJS"
    case SeattleKraken = "SEA"
    case StLouisBlues = "STL"
    case TampaBayLightning = "TBL"
    case TorontoMapleLeafs = "TOR"
    case VancouverCanucks = "VAN"
    case VegasGoldenKnights = "VGK"
    case WashingtonCapitals = "WSH"
    case WinnipegJets = "WPG"

    var name: String {
        switch self {
        case .AnaheimDucks: "Ducks"
        case .ArizonaCoyotes: "Coyotes"
        case .BostonBruins: "Bruins"
        case .BuffaloSabres: "Sabres"
        case .CalgaryFlames: "Flames"
        case .CarolinaHurricanes: "Hurricanes"
        case .ChicagoBlackhawks: "Blackhawks"
        case .ColoradoAvalanche: "Avalanche"
        case .ColumbusBlueJackets: "Blue Jackets"
        case .DallasStars: "Stars"
        case .DetroitRedWings: "Red Wings"
        case .EdmontonOilers: "Oilers"
        case .FloridaPanthers: "Panthers"
        case .LosAngelesKings: "Kings"
        case .MinnesotaWild: "Wild"
        case .MontrealCanadiens: "Canadiens"
        case .NashvillePredators: "Predators"
        case .NewJerseyDevils: "Devils"
        case .NewYorkIslanders: "Islanders"
        case .NewYorkRangers: "Rangers"
        case .OttawaSenators: "Senators"
        case .PhiladelphiaFlyers: "Flyers"
        case .PittsburghPenguins: "Penguins"
        case .SanJoseSharks: "Sharks 🦈"
        case .SeattleKraken: "Kraken"
        case .StLouisBlues: "Blues"
        case .TampaBayLightning: "Lightning"
        case .TorontoMapleLeafs: "Maple Leafs"
        case .VancouverCanucks: "Canucks"
        case .VegasGoldenKnights: "Golden Knights"
        case .WashingtonCapitals: "Capitals"
        case .WinnipegJets: "Jets"
        }
    }
}

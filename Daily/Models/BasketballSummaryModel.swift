//
//  BasketballSummaryModel.swift
//  Daily
//
//  Created by Michael Gillund on 1/6/23.
//

import Foundation

struct BasketballSummaryModel: Codable, Identifiable {
    
    let id: UUID = UUID()
    
    struct Boxscore: Codable {
        struct Team: Codable {
            struct Team: Codable {
                let id: String?
                let uid: String?
                let slug: String?
                let location: String?
                let name: String?
                let abbreviation: String?
                let displayName: String?
                let shortDisplayName: String?
                let color: String?
                let alternateColor: String?
                let logo: URL?
            }

            struct Statistic: Codable {
                let name: String?
                let displayValue: String?
                let label: String?
                let abbreviation: String?
            }

            let team: Team?
            let statistics: [Statistic]?
        }

        struct Player: Codable {
            struct Team: Codable {
                let id: String?
                let uid: String?
                let slug: String?
                let location: String?
                let name: String?
                let abbreviation: String?
                let displayName: String?
                let shortDisplayName: String?
                let color: String?
                let alternateColor: String?
                let logo: URL?
            }

            struct Statistic: Codable, Identifiable {
                struct Athlete: Codable, Identifiable {
                    struct Athlete: Codable {
                        struct Link: Codable {
                            let rel: [String]?
                            let href: URL?
                            let text: String?
                        }

                        struct Headshot: Codable {
                            let href: URL
                            let alt: String?
                        }

                        struct Position: Codable {
                            let name: String?
                            let displayName: String?
                            let abbreviation: String?
                        }

                        let id: String?
                        let uid: String?
                        let guid: String?
                        let displayName: String?
                        let shortName: String?
                        let links: [Link]?
                        let headshot: Headshot?
                        let jersey: String?
                        let position: Position?
                    }
                    let id: UUID = UUID()
                    let active: Bool?
                    let athlete: Athlete?
                    let starter: Bool?
                    let didNotPlay: Bool
                    let reason: String?
                    let ejected: Bool?
                    var stats: [String]
                    
                    var min: String {
                        let value = stats.prefix(1)
                        return value.first ?? ""
                    }
                    
                    var stat: [String] {
                        var value: [String] = []
                        for index in stats.indices {
//                            if index == 0 {
//                               value.append(stats[index])
//                            }
//                            else
                            if index == 1 {
                                value.append(stats[index])
                            }
                            else if index == 2 {
                                value.append(stats[index])
                            }
                            else if index == 3 {
                                value.append(stats[index])
                            }
                            else if index == 6 {
                                value.append(stats[index])
                            }
                            else if index == 7 {
                                value.append(stats[index])
                            }
//                            else if index == 8 {
//                                value.append(stats[index])
//                            }
//                            else if index == 9 {
//                                value.append(stats[index])
//                            }
                            else if index == 13 {
                                value.append(stats[index])
                            }
                            
                        }
//                        print("value")
//                        print(value)
                        var initial = value
                        var positions = [4,6,5,2,3,1]
                        var new = Array(zip(initial, positions))
//                        print("zipped", new)
                        new = new.sorted(by:{$0.1 < $1.1})
//                        print("sorted", new)
                        let sorted = new.map(){$0.0}
//                        print("end")
                        return sorted
                    }
                }
                let id: UUID = UUID()
                let names: [String]?
                let keys: [String]?
                let labels: [String]
                let descriptions: [String]?
                let athletes: [Athlete]?
                let totals: [String]?
                
                var label: [String] {
                    var value: [String] = []
                    for index in labels.indices {
                        if index == 0 {
                            value.append(labels[index])
                        }else if index == 1 {
                            value.append(labels[index])
                        }
                        else if index == 2 {
                            value.append(labels[index])
                        }
                        else if index == 3 {
                            value.append(labels[index])
                        }
                        else if index == 6 {
                            value.append(labels[index])
                        }
                        else if index == 7 {
                            value.append(labels[index])
                        }
                        else if index == 8 {
                            value.append(labels[index])
                        }
                        else if index == 9 {
                            value.append(labels[index])
                        }
                        else if index == 13 {
                            value.append(labels[index])
                        }
                        
                    }
                    return value
                }
       
            }

            let team: Team?
            let statistics: [Statistic]?
        }

        let teams: [Team]?
        let players: [Player]?
    }

//    struct Format: Codable {
//        struct Regulation: Codable {
//            let periods: Int?
//            let displayName: String?
//            let slug: String?
//            let clock: Double?
//        }
//
//        struct Overtime: Codable {
//            let clock: Double?
//        }
//
//        let regulation: Regulation?
//        let overtime: Overtime?
//    }
//
//    struct GameInfo: Codable {
//        struct Venue: Codable {
//            struct Address: Codable {
//                let city: String?
//                let state: String?
//            }
//
//            struct Image: Codable {
//                let href: URL?
//                let width: Int?
//                let height: Int?
//                let alt: String?
//                let rel: [String]?
//            }
//
//            let id: String?
//            let fullName: String?
//            let shortName: String?
//            let address: Address?
//            let capacity: Int?
//            let grass: Bool?
//            let images: [Image]?
//        }
//
//        struct Official: Codable {
//            struct Position: Codable {
//                let name: String?
//                let displayName: String?
//                let id: String?
//            }
//
//            let fullName: String?
//            let displayName: String?
//            let position: Position?
//            let order: Int?
//        }
//
//        let venue: Venue?
//        let attendance: Int?
//        let officials: [Official]?
//    }
//
//    struct Leader: Codable {
//        struct Team: Codable {
//            struct Link: Codable {
//                let href: URL?
//                let text: String?
//            }
//
//            let id: String?
//            let uid: String?
//            let displayName: String?
//            let abbreviation: String?
//            let links: [Link]?
//            let logo: URL?
//        }
//
//        struct Leader: Codable {
//            struct Leader: Codable {
//                struct Athlete: Codable {
//                    struct Link: Codable {
//                        let rel: [String]?
//                        let href: URL?
//                        let text: String?
//                    }
//
//                    struct Headshot: Codable {
//                        let href: URL?
//                        let alt: String?
//                    }
//
//                    struct Position: Codable {
//                        let abbreviation: String?
//                    }
//
//                    struct Team: Codable {
//                        let _$ref: URL?
//
//                        private enum CodingKeys: String, CodingKey {
//                            case _$ref = "$ref"
//                        }
//                    }
//
//                    let id: String?
//                    let uid: String?
//                    let guid: String?
//                    let lastName: String?
//                    let fullName: String?
//                    let displayName: String?
//                    let shortName: String?
//                    let links: [Link]?
//                    let headshot: Headshot?
//                    let jersey: String?
//                    let position: Position?
//                    let team: Team?
//                }
//
//                struct Statistic: Codable {
//                    let name: String?
//                    let displayName: String?
//                    let shortDisplayName: String?
//                    let description: String?
//                    let abbreviation: String?
//                    let value: Double?
//                    let displayValue: String?
//                }
//
//                let displayValue: String?
//                let athlete: Athlete?
//                let statistics: [Statistic]?
//            }
//
//            let name: String?
//            let displayName: String?
//            let leaders: [Leader]?
//        }
//
//        let team: Team?
//        let leaders: [Leader]?
//    }
//
//    struct Seasonseries: Codable {
//        struct Event: Codable {
//            struct StatusType: Codable {
//                let id: String?
//                let name: String?
//                let state: String?
//                let completed: Bool?
//                let description: String?
//                let detail: String?
//                let shortDetail: String?
//            }
//
//            struct Competitor: Codable {
//                struct Team: Codable {
//                    struct Link: Codable {
//                        let href: URL?
//                        let text: String?
//                    }
//
//                    let id: String?
//                    let uid: String?
//                    let displayName: String?
//                    let abbreviation: String?
//                    let links: [Link]?
//                    let logo: URL?
//                }
//
//                let homeAway: String?
//                let winner: Bool?
//                let team: Team?
//                let score: String?
//            }
//
//            struct Link: Codable {
//                let language: String?
//                let rel: [String]?
//                let href: URL?
//                let text: String?
//                let shortText: String?
//                let isExternal: Bool?
//                let isPremium: Bool?
//            }
//
//            let id: String?
//            let uid: String?
//            let date: Date?
//            let timeValid: Bool?
//            let status: String?
//            let statusType: StatusType?
//            let competitors: [Competitor]?
//            let links: [Link]?
////            let broadcasts: [Any]?
//        }
//
//        let type: String?
//        let title: String?
//        let description: String?
//        let summary: String?
//        let completed: Bool?
//        let totalCompetitions: Int?
//        let events: [Event]?
//    }
//
//    struct Predictor: Codable {
//        struct HomeTeam: Codable {
//            let id: String?
//        }
//
//        struct AwayTeam: Codable {
//            let id: String?
//        }
//
//        let header: String?
//        let homeTeam: HomeTeam?
//        let awayTeam: AwayTeam?
//    }
//
//    struct Pickcenter: Codable {
//        struct Provider: Codable {
//            let id: String?
//            let name: String?
//            let priority: Int?
//        }
//
//        struct AwayTeamOdd: Codable {
//            struct SpreadRecord: Codable {
//                let wins: Int?
//                let losses: Int?
//                let pushes: Int?
//                let summary: String?
//            }
//
//            let favorite: Bool?
//            let underdog: Bool?
//            let moneyLine: Int?
//            let spreadOdds: Double?
//            let teamID: String?
//            let winPercentage: Double?
//            let averageScore: Double?
//            let spreadRecord: SpreadRecord?
//
//            private enum CodingKeys: String, CodingKey {
//                case favorite
//                case underdog
//                case moneyLine
//                case spreadOdds
//                case teamID = "teamId"
//                case winPercentage
//                case averageScore
//                case spreadRecord
//            }
//        }
//
//        struct HomeTeamOdd: Codable {
//            struct SpreadRecord: Codable {
//                let wins: Int?
//                let losses: Int?
//                let pushes: Int?
//                let summary: String?
//            }
//
//            let favorite: Bool?
//            let underdog: Bool?
//            let moneyLine: Int?
//            let spreadOdds: Double?
//            let teamID: String?
//            let winPercentage: Double?
//            let averageScore: Double?
//            let spreadRecord: SpreadRecord?
//
//            private enum CodingKeys: String, CodingKey {
//                case favorite
//                case underdog
//                case moneyLine
//                case spreadOdds
//                case teamID = "teamId"
//                case winPercentage
//                case averageScore
//                case spreadRecord
//            }
//        }
//
//        let provider: Provider?
//        let details: String?
//        let overUnder: Double?
//        let spread: Double?
//        let awayTeamOdds: AwayTeamOdd?
//        let homeTeamOdds: HomeTeamOdd?
////        let links: [Any]?
//    }
//
//    struct AgainstTheSpread: Codable {
//        struct Team: Codable {
//            struct Link: Codable {
//                let href: URL?
//                let text: String?
//            }
//
//            let id: String?
//            let uid: String?
//            let displayName: String?
//            let abbreviation: String?
//            let links: [Link]?
//            let logo: URL?
//        }
//
//        let team: Team?
////        let records: [Any]?
//    }
//
//    struct Winprobability: Codable {
//        let tiePercentage: Double?
//        let homeWinPercentage: Double?
//        let playID: String?
//
//        private enum CodingKeys: String, CodingKey {
//            case tiePercentage
//            case homeWinPercentage
//            case playID = "playId"
//        }
//    }
//
//    struct Header: Codable {
//        struct Season: Codable {
//            let year: Int?
//            let type: Int?
//        }
//
//        struct Competition: Codable {
//            struct Competitor: Codable {
//                struct Team: Codable {
//                    struct Logo: Codable {
//                        let href: URL?
//                        let width: Int?
//                        let height: Int?
//                        let alt: String?
//                        let rel: [String]?
//                        let lastUpdated: String?
//                    }
//
//                    struct Link: Codable {
//                        let rel: [String]?
//                        let href: URL?
//                        let text: String?
//                    }
//
//                    let id: String?
//                    let uid: String?
//                    let location: String?
//                    let name: String?
//                    let abbreviation: String?
//                    let displayName: String?
//                    let color: String?
//                    let alternateColor: String?
//                    let logos: [Logo]?
//                    let links: [Link]?
//                }
//
//                struct Linescore: Codable {
//                    let displayValue: String?
//                }
//
//                struct Record: Codable {
//                    let type: String?
//                    let summary: String?
//                    let displayValue: String?
//                }
//
//                let id: String?
//                let uid: String?
//                let order: Int?
//                let homeAway: String?
//                let winner: Bool?
//                let team: Team?
//                let score: String?
//                let linescores: [Linescore]?
//                let record: [Record]?
//                let possession: Bool?
//            }
//
//            struct Status: Codable {
//                struct `Type`: Codable {
//                    let id: String?
//                    let name: String?
//                    let state: String?
//                    let completed: Bool?
//                    let description: String?
//                    let detail: String?
//                    let shortDetail: String?
//                }
//
//                let type: `Type`?
//            }
//
//            struct Series: Codable {
//                struct Competitor: Codable {
//                    struct Team: Codable {
//                        let _$ref: URL?
//
//                        private enum CodingKeys: String, CodingKey {
//                            case _$ref = "$ref"
//                        }
//                    }
//
//                    let id: String?
//                    let uid: String?
//                    let wins: Int?
//                    let ties: Int?
//                    let team: Team?
//                }
//
//                struct Event: Codable {
//                    let _$ref: URL?
//                    let id: String?
//
//                    private enum CodingKeys: String, CodingKey {
//                        case _$ref = "$ref"
//                        case id
//                    }
//                }
//
//                let type: String?
//                let title: String?
//                let description: String?
//                let summary: String?
//                let completed: Bool?
//                let totalCompetitions: Int?
//                let competitors: [Competitor]?
//                let events: [Event]?
//            }
//
//            let id: String?
//            let uid: String?
//            let date: String?
//            let neutralSite: Bool?
//            let conferenceCompetition: Bool?
//            let boxscoreAvailable: Bool?
//            let commentaryAvailable: Bool?
//            let liveAvailable: Bool?
//            let shotChartAvailable: Bool?
//            let timeoutsAvailable: Bool?
//            let possessionArrowAvailable: Bool?
//            let onWatchESPN: Bool?
//            let recent: Bool?
//            let boxscoreSource: String?
//            let playByPlaySource: String?
//            let competitors: [Competitor]?
//            let status: Status?
////            let broadcasts: [Any]?
//            let series: [Series]?
//        }
//
//        struct Link: Codable {
//            let rel: [String]?
//            let href: URL?
//            let text: String?
//            let shortText: String?
//            let isExternal: Bool?
//            let isPremium: Bool?
//        }
//
//        struct League: Codable {
//            struct Link: Codable {
//                let rel: [String]?
//                let href: URL?
//                let text: String?
//            }
//
//            let id: String?
//            let uid: String?
//            let name: String?
//            let abbreviation: String?
//            let slug: String?
//            let isTournament: Bool?
//            let links: [Link]?
//        }
//
//        let id: String?
//        let uid: String?
//        let season: Season?
//        let timeValid: Bool?
//        let competitions: [Competition]?
//        let links: [Link]?
//        let league: League?
//    }
//
//    struct News: Codable {
//        struct Link: Codable {
//            let language: String?
//            let rel: [String]?
//            let href: URL?
//            let text: String?
//            let shortText: String?
//            let isExternal: Bool?
//            let isPremium: Bool?
//        }
//
//        struct Article: Codable {
//            struct Image: Codable {
//                let name: String?
//                let width: Int?
//                let alt: String?
//                let caption: String?
//                let url: URL?
//                let height: Int?
//                let id: Int?
//                let credit: String?
//                let type: String?
//            }
//
//            struct Link: Codable {
//                struct Api: Codable {
//                    struct News: Codable {
//                        let href: URL?
//                    }
//
//                    struct `Self`: Codable {
//                        let href: URL?
//                    }
//
//                    let news: News?
//                    let `self`: `Self`?
//                }
//
//                struct Web: Codable {
//                    struct Short: Codable {
//                        let href: URL?
//                    }
//
//                    let href: URL?
//                    let short: Short?
//                }
//
//                struct Mobile: Codable {
//                    let href: URL?
//                }
//
//                let api: Api?
//                let web: Web?
//                let mobile: Mobile?
//            }
//
//            struct Category: Codable {
//                struct League: Codable {
//                    struct Link: Codable {
//                        struct Api: Codable {
//                            struct League: Codable {
//                                let href: URL?
//                            }
//
//                            let leagues: League?
//                        }
//
//                        struct Web: Codable {
//                            struct League: Codable {
//                                let href: URL?
//                            }
//
//                            let leagues: League?
//                        }
//
//                        struct Mobile: Codable {
//                            struct League: Codable {
//                                let href: URL?
//                            }
//
//                            let leagues: League?
//                        }
//
//                        let api: Api?
//                        let web: Web?
//                        let mobile: Mobile?
//                    }
//
//                    let id: Int?
//                    let description: String?
//                    let links: Link?
//                }
//
//                struct Athlete: Codable {
//                    struct Link: Codable {
//                        struct Api: Codable {
//                            struct Athlete: Codable {
//                                let href: URL?
//                            }
//
//                            let athletes: Athlete?
//                        }
//
//                        struct Web: Codable {
//                            struct Athlete: Codable {
//                                let href: URL?
//                            }
//
//                            let athletes: Athlete?
//                        }
//
//                        struct Mobile: Codable {
//                            struct Athlete: Codable {
//                                let href: URL?
//                            }
//
//                            let athletes: Athlete?
//                        }
//
//                        let api: Api?
//                        let web: Web?
//                        let mobile: Mobile?
//                    }
//
//                    let id: Int?
//                    let description: String?
//                    let links: Link?
//                }
//
//                struct Team: Codable {
//                    struct Link: Codable {
//                        struct Api: Codable {
//                            struct Team: Codable {
//                                let href: URL?
//                            }
//
//                            let teams: Team?
//                        }
//
//                        struct Web: Codable {
//                            struct Team: Codable {
//                                let href: URL?
//                            }
//
//                            let teams: Team?
//                        }
//
//                        struct Mobile: Codable {
//                            struct Team: Codable {
//                                let href: URL?
//                            }
//
//                            let teams: Team?
//                        }
//
//                        let api: Api?
//                        let web: Web?
//                        let mobile: Mobile?
//                    }
//
//                    let id: Int?
//                    let description: String?
//                    let links: Link?
//                }
//
//                let id: Int?
//                let description: String?
//                let type: String?
//                let sportID: Int?
//                let leagueID: Int?
//                let league: League?
//                let uid: String?
//                let createDate: Date?
//                let athleteID: Int?
//                let athlete: Athlete?
//                let teamID: Int?
//                let team: Team?
//                let topicID: Int?
//                let guid: String?
//
//                private enum CodingKeys: String, CodingKey {
//                    case id
//                    case description
//                    case type
//                    case sportID = "sportId"
//                    case leagueID = "leagueId"
//                    case league
//                    case uid
//                    case createDate
//                    case athleteID = "athleteId"
//                    case athlete
//                    case teamID = "teamId"
//                    case team
//                    case topicID = "topicId"
//                    case guid
//                }
//            }
//
//            let images: [Image]?
//            let description: String?
//            let published: Date?
//            let type: String?
//            let premium: Bool?
//            let links: Link?
//            let lastModified: Date?
//            let categories: [Category]?
//            let headline: String?
//            let byline: String?
//        }
//
//        let header: String?
//        let link: Link?
//        let articles: [Article]?
//    }
//
//    struct Article: Codable {
//        struct Video: Codable {
//            struct Ad: Codable {
//                let sport: String?
//                let bundle: String?
//            }
//
//            struct Tracking: Codable {
//                let sportName: String?
//                let leagueName: String?
//                let coverageType: String?
//                let trackingName: String?
//                let trackingID: String?
//
//                private enum CodingKeys: String, CodingKey {
//                    case sportName
//                    case leagueName
//                    case coverageType
//                    case trackingName
//                    case trackingID = "trackingId"
//                }
//            }
//
//            struct TimeRestriction: Codable {
//                let embargoDate: Date?
//                let expirationDate: Date?
//            }
//
//            struct DeviceRestriction: Codable {
//                let type: String?
//                let devices: [String]?
//            }
//
//            struct GeoRestriction: Codable {
//                let type: String?
//                let countries: [String]?
//            }
//
//            struct Category: Codable {
//                struct Athlete: Codable {
//                    struct Link: Codable {
//                        struct Api: Codable {
//                            struct Athlete: Codable {
//                                let href: URL?
//                            }
//
//                            let athletes: Athlete?
//                        }
//
//                        struct Web: Codable {
//                            struct Athlete: Codable {
//                                let href: URL?
//                            }
//
//                            let athletes: Athlete?
//                        }
//
//                        struct Mobile: Codable {
//                            struct Athlete: Codable {
//                                let href: URL?
//                            }
//
//                            let athletes: Athlete?
//                        }
//
//                        let api: Api?
//                        let web: Web?
//                        let mobile: Mobile?
//                    }
//
//                    let id: Int?
//                    let description: String?
//                    let links: Link?
//                }
//
//                struct Team: Codable {
//                    struct Link: Codable {
//                        struct Api: Codable {
//                            struct Team: Codable {
//                                let href: URL?
//                            }
//
//                            let teams: Team?
//                        }
//
//                        struct Web: Codable {
//                            struct Team: Codable {
//                                let href: URL?
//                            }
//
//                            let teams: Team?
//                        }
//
//                        struct Mobile: Codable {
//                            struct Team: Codable {
//                                let href: URL?
//                            }
//
//                            let teams: Team?
//                        }
//
//                        let api: Api?
//                        let web: Web?
//                        let mobile: Mobile?
//                    }
//
//                    let id: Int?
//                    let description: String?
//                    let links: Link?
//                }
//
//                struct League: Codable {
//                    struct Link: Codable {
//                        struct Api: Codable {
//                            struct League: Codable {
//                                let href: URL?
//                            }
//
//                            let leagues: League?
//                        }
//
//                        struct Web: Codable {
//                            struct League: Codable {
//                                let href: URL?
//                            }
//
//                            let leagues: League?
//                        }
//
//                        struct Mobile: Codable {
//                            struct League: Codable {
//                                let href: URL?
//                            }
//
//                            let leagues: League?
//                        }
//
//                        let api: Api?
//                        let web: Web?
//                        let mobile: Mobile?
//                    }
//
//                    let id: Int?
//                    let description: String?
//                    let links: Link?
//                }
//
//                let id: Int?
//                let description: String?
//                let type: String?
//                let sportID: Int?
//                let athleteID: Int?
//                let athlete: Athlete?
//                let uid: String?
//                let teamID: Int?
//                let team: Team?
//                let leagueID: Int?
//                let league: League?
//                let topicID: Int?
//
//                private enum CodingKeys: String, CodingKey {
//                    case id
//                    case description
//                    case type
//                    case sportID = "sportId"
//                    case athleteID = "athleteId"
//                    case athlete
//                    case uid
//                    case teamID = "teamId"
//                    case team
//                    case leagueID = "leagueId"
//                    case league
//                    case topicID = "topicId"
//                }
//            }
//
//            struct PosterImage: Codable {
//                struct Default: Codable {
//                    let href: URL?
//                    let width: Int?
//                    let height: Int?
//                }
//
//                struct Full: Codable {
//                    let href: URL?
//                }
//
//                struct Wide: Codable {
//                    let href: URL?
//                }
//
//                struct Square: Codable {
//                    let href: URL?
//                }
//
//                let `default`: Default?
//                let full: Full?
//                let wide: Wide?
//                let square: Square?
//            }
//
//            struct Image: Codable {
//                let name: String?
//                let url: URL?
//                let alt: String?
//                let caption: String?
//                let credit: String?
//                let width: Int?
//                let height: Int?
//            }
//
//            struct Link: Codable {
//                struct Api: Codable {
//                    struct `Self`: Codable {
//                        let href: URL?
//                    }
//
//                    struct Artwork: Codable {
//                        let href: URL?
//                    }
//
//                    let `self`: `Self`?
//                    let artwork: Artwork?
//                }
//
//                struct Web: Codable {
//                    struct Short: Codable {
//                        let href: URL?
//                    }
//
//                    struct `Self`: Codable {
//                        let href: URL?
//                    }
//
//                    let href: URL?
//                    let short: Short?
//                    let `self`: `Self`?
//                }
//
//                struct Source: Codable {
//                    struct Mezzanine: Codable {
//                        let href: URL?
//                    }
//
//                    struct Flash: Codable {
//                        let href: URL?
//                    }
//
//                    struct Hd: Codable {
//                        let href: URL?
//                    }
//
//                    struct HL: Codable {
//                        struct HD: Codable {
//                            let href: URL?
//                        }
//
//                        let href: URL?
//                        let hD: HD?
//
//                        private enum CodingKeys: String, CodingKey {
//                            case href
//                            case hD = "HD"
//                        }
//                    }
//
//                    struct HD: Codable {
//                        let href: URL?
//                    }
//
//                    struct Full: Codable {
//                        let href: URL?
//                    }
//
//                    let mezzanine: Mezzanine?
//                    let flash: Flash?
//                    let hds: Hd?
//                    let hLS: HL?
//                    let hD: HD?
//                    let full: Full?
//                    let href: URL?
//
//                    private enum CodingKeys: String, CodingKey {
//                        case mezzanine
//                        case flash
//                        case hds
//                        case hLS = "HLS"
//                        case hD = "HD"
//                        case full
//                        case href
//                    }
//                }
//
//                struct Mobile: Codable {
//                    struct Alert: Codable {
//                        let href: URL?
//                    }
//
//                    struct Source: Codable {
//                        let href: URL?
//                    }
//
//                    struct Streaming: Codable {
//                        let href: URL?
//                    }
//
//                    struct ProgressiveDownload: Codable {
//                        let href: URL?
//                    }
//
//                    let alert: Alert?
//                    let source: Source?
//                    let href: URL?
//                    let streaming: Streaming?
//                    let progressiveDownload: ProgressiveDownload?
//                }
//
//                let api: Api?
//                let web: Web?
//                let source: Source?
//                let mobile: Mobile?
//            }
//
//            let source: String?
//            let id: Int?
//            let headline: String?
//            let caption: String?
//            let description: String?
//            let premium: Bool?
//            let ad: Ad?
//            let tracking: Tracking?
//            let cerebroID: String?
//            let contributingPartner: String?
//            let contributingSystem: String?
//            let lastModified: Date?
//            let originalPublishDate: Date?
//            let timeRestrictions: TimeRestriction?
//            let deviceRestrictions: DeviceRestriction?
//            let geoRestrictions: GeoRestriction?
//            let syndicatable: Bool?
//            let duration: Int?
//            let categories: [Category]?
//            let keywords: [Any]?
//            let posterImages: PosterImage?
//            let images: [Image]?
//            let thumbnail: URL?
//            let links: Link?
//            let title: String?
//
//            private enum CodingKeys: String, CodingKey {
//                case source
//                case id
//                case headline
//                case caption
//                case description
//                case premium
//                case ad
//                case tracking
//                case cerebroID = "cerebroId"
//                case contributingPartner
//                case contributingSystem
//                case lastModified
//                case originalPublishDate
//                case timeRestrictions
//                case deviceRestrictions
//                case geoRestrictions
//                case syndicatable
//                case duration
//                case categories
//                case keywords
//                case posterImages
//                case images
//                case thumbnail
//                case links
//                case title
//            }
//        }
//
//        struct Link: Codable {
//            struct Api: Codable {
//                struct News: Codable {
//                    let href: URL?
//                }
//
//                struct Event: Codable {
//                    let href: URL?
//                }
//
//                let news: News?
//                let events: Event?
//            }
//
//            struct Web: Codable {
//                struct Short: Codable {
//                }
//
//                let href: URL?
//                let short: Short?
//            }
//
//            struct App: Codable {
//                struct Sportscenter: Codable {
//                    let href: URL?
//                }
//
//                let sportscenter: Sportscenter?
//            }
//
//            struct Mobile: Codable {
//                let href: URL?
//            }
//
//            let api: Api?
//            let web: Web?
//            let app: App?
//            let mobile: Mobile?
//        }
//
//        struct Category: Codable {
//            struct League: Codable {
//                struct Link: Codable {
//                    struct Api: Codable {
//                        struct League: Codable {
//                            let href: URL?
//                        }
//
//                        let leagues: League?
//                    }
//
//                    struct Web: Codable {
//                        struct League: Codable {
//                            let href: URL?
//                        }
//
//                        let leagues: League?
//                    }
//
//                    struct Mobile: Codable {
//                        struct League: Codable {
//                            let href: URL?
//                        }
//
//                        let leagues: League?
//                    }
//
//                    let api: Api?
//                    let web: Web?
//                    let mobile: Mobile?
//                }
//
//                let id: Int?
//                let description: String?
//                let links: Link?
//            }
//
//            struct Team: Codable {
//                struct Link: Codable {
//                    struct Api: Codable {
//                        struct Team: Codable {
//                            let href: URL?
//                        }
//
//                        let teams: Team?
//                    }
//
//                    struct Web: Codable {
//                        struct Team: Codable {
//                            let href: URL?
//                        }
//
//                        let teams: Team?
//                    }
//
//                    struct Mobile: Codable {
//                        struct Team: Codable {
//                            let href: URL?
//                        }
//
//                        let teams: Team?
//                    }
//
//                    let api: Api?
//                    let web: Web?
//                    let mobile: Mobile?
//                }
//
//                let id: Int?
//                let description: String?
//                let links: Link?
//            }
//
//            let id: Int?
//            let description: String?
//            let type: String?
//            let sportID: Int?
//            let leagueID: Int?
//            let league: League?
//            let uid: String?
//            let teamID: Int?
//            let team: Team?
//
//            private enum CodingKeys: String, CodingKey {
//                case id
//                case description
//                case type
//                case sportID = "sportId"
//                case leagueID = "leagueId"
//                case league
//                case uid
//                case teamID = "teamId"
//                case team
//            }
//        }
//
//        struct Image: Codable {
//            let name: String?
//            let width: Int?
//            let alt: String?
//            let caption: String?
//            let url: URL?
//            let height: Int?
//        }
//
//        struct Metric: Codable {
//            let count: Int?
//            let type: String?
//        }
//
//        let keywords: [Any]?
//        let description: String?
//        let source: String?
//        let video: [Video]?
//        let type: String?
//        let nowID: String?
//        let premium: Bool?
//        let related: [Any]?
//        let allowSearch: Bool?
//        let links: Link?
//        let id: Int?
//        let categories: [Category]?
//        let headline: String?
//        let gameID: String?
//        let images: [Image]?
//        let linkText: String?
//        let published: Date?
//        let allowComments: Bool?
//        let lastModified: Date?
//        let metrics: [Metric]?
//        let inlines: [Any]?
//        let story: String?
//
//        private enum CodingKeys: String, CodingKey {
//            case keywords
//            case description
//            case source
//            case video
//            case type
//            case nowID = "nowId"
//            case premium
//            case related
//            case allowSearch
//            case links
//            case id
//            case categories
//            case headline
//            case gameID = "gameId"
//            case images
//            case linkText
//            case published
//            case allowComments
//            case lastModified
//            case metrics
//            case inlines
//            case story
//        }
//    }
//
//    struct Video: Codable {
//        struct Ad: Codable {
//            let sport: String?
//            let bundle: String?
//        }
//
//        struct Tracking: Codable {
//            let sportName: String?
//            let leagueName: String?
//            let coverageType: String?
//            let trackingName: String?
//            let trackingID: String?
//
//            private enum CodingKeys: String, CodingKey {
//                case sportName
//                case leagueName
//                case coverageType
//                case trackingName
//                case trackingID = "trackingId"
//            }
//        }
//
//        struct TimeRestriction: Codable {
//            let embargoDate: Date?
//            let expirationDate: Date?
//        }
//
//        struct DeviceRestriction: Codable {
//            let type: String?
//            let devices: [String]?
//        }
//
//        struct GeoRestriction: Codable {
//            let type: String?
//            let countries: [String]?
//        }
//
//        struct Link: Codable {
//            struct Api: Codable {
//                struct `Self`: Codable {
//                    let href: URL?
//                }
//
//                struct Artwork: Codable {
//                    let href: URL?
//                }
//
//                let `self`: `Self`?
//                let artwork: Artwork?
//            }
//
//            struct Web: Codable {
//                struct Short: Codable {
//                    let href: URL?
//                }
//
//                struct `Self`: Codable {
//                    let href: URL?
//                }
//
//                let href: URL?
//                let short: Short?
//                let `self`: `Self`?
//            }
//
//            struct Source: Codable {
//                struct Mezzanine: Codable {
//                    let href: URL?
//                }
//
//                struct Flash: Codable {
//                    let href: URL?
//                }
//
//                struct Hd: Codable {
//                    let href: URL?
//                }
//
//                struct HL: Codable {
//                    struct HD: Codable {
//                        let href: URL?
//                    }
//
//                    let href: URL?
//                    let hD: HD?
//
//                    private enum CodingKeys: String, CodingKey {
//                        case href
//                        case hD = "HD"
//                    }
//                }
//
//                struct HD: Codable {
//                    let href: URL?
//                }
//
//                struct Full: Codable {
//                    let href: URL?
//                }
//
//                let mezzanine: Mezzanine?
//                let flash: Flash?
//                let hds: Hd?
//                let hLS: HL?
//                let hD: HD?
//                let full: Full?
//                let href: URL?
//
//                private enum CodingKeys: String, CodingKey {
//                    case mezzanine
//                    case flash
//                    case hds
//                    case hLS = "HLS"
//                    case hD = "HD"
//                    case full
//                    case href
//                }
//            }
//
//            struct Mobile: Codable {
//                struct Alert: Codable {
//                    let href: URL?
//                }
//
//                struct Source: Codable {
//                    let href: URL?
//                }
//
//                struct Streaming: Codable {
//                    let href: URL?
//                }
//
//                struct ProgressiveDownload: Codable {
//                    let href: URL?
//                }
//
//                let alert: Alert?
//                let source: Source?
//                let href: URL?
//                let streaming: Streaming?
//                let progressiveDownload: ProgressiveDownload?
//            }
//
//            let api: Api?
//            let web: Web?
//            let source: Source?
//            let mobile: Mobile?
//        }
//
//        let source: String?
//        let id: Int?
//        let headline: String?
//        let description: String?
//        let ad: Ad?
//        let tracking: Tracking?
//        let cerebroID: String?
//        let lastModified: Date?
//        let originalPublishDate: Date?
//        let timeRestrictions: TimeRestriction?
//        let deviceRestrictions: DeviceRestriction?
//        let geoRestrictions: GeoRestriction?
//        let duration: Int?
//        let thumbnail: URL?
//        let links: Link?
//
//        private enum CodingKeys: String, CodingKey {
//            case source
//            case id
//            case headline
//            case description
//            case ad
//            case tracking
//            case cerebroID = "cerebroId"
//            case lastModified
//            case originalPublishDate
//            case timeRestrictions
//            case deviceRestrictions
//            case geoRestrictions
//            case duration
//            case thumbnail
//            case links
//        }
//    }
//
//    struct Play: Codable {
//        struct `Type`: Codable {
//            let id: String?
//            let text: String?
//        }
//
//        struct Period: Codable {
//            let number: Int?
//            let displayValue: String?
//        }
//
//        struct Clock: Codable {
//            let displayValue: String?
//        }
//
//        struct Team: Codable {
//            let id: String?
//        }
//
//        struct Participant: Codable {
//            struct Athlete: Codable {
//                let id: String?
//            }
//
//            let athlete: Athlete?
//        }
//
//        struct Coordinate: Codable {
//            let x: Int?
//            let y: Int?
//        }
//
//        let id: String?
//        let sequenceNumber: String?
//        let type: `Type`?
//        let text: String?
//        let awayScore: Int?
//        let homeScore: Int?
//        let period: Period?
//        let clock: Clock?
//        let scoringPlay: Bool?
//        let scoreValue: Int?
//        let team: Team?
//        let participants: [Participant]?
//        let wallclock: Date?
//        let shootingPlay: Bool?
//        let coordinate: Coordinate?
//    }
//
//    struct Standing: Codable {
//        struct FullViewLink: Codable {
//            let text: String?
//            let href: URL?
//        }
//
//        struct Group: Codable {
//            struct Standing: Codable {
//                struct Entry: Codable {
//                    struct Stat: Codable {
//                        let name: String?
//                        let displayName: String?
//                        let shortDisplayName: String?
//                        let description: String?
//                        let abbreviation: String?
//                        let type: String?
//                        let value: Double?
//                        let displayValue: String?
//                    }
//
//                    struct Logo: Codable {
//                        let href: URL?
//                        let width: Int?
//                        let height: Int?
//                        let alt: String?
//                        let rel: [String]?
//                        let lastUpdated: String?
//                    }
//
//                    let team: String?
//                    let link: URL?
//                    let id: String?
//                    let uid: String?
//                    let stats: [Stat]?
//                    let logo: [Logo]?
//                }
//
//                let entries: [Entry]?
//            }
//
//            let standings: Standing?
//            let header: String?
//            let href: URL?
//        }
//
//        let fullViewLink: FullViewLink?
//        let groups: [Group]?
//    }

    let boxscore: Boxscore
//    let format: Format?
//    let gameInfo: GameInfo?
//    let leaders: [Leader]?
//    let seasonseries: [Seasonseries]?
//    let broadcasts: [Any]?
//    let predictor: Predictor?
//    let pickcenter: [Pickcenter]?
//    let againstTheSpread: [AgainstTheSpread]?
//    let odds: [Any]?
//    let winprobability:
    
//    let article: Article?
//    let videos: [Video]?
//    let plays: [Play]?
//    let standings: Standing?
}

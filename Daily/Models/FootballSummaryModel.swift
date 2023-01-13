//
//  FootballSummaryModel.swift
//  Daily
//
//  Created by Michael Gillund on 1/8/23.
//

import Foundation

struct FootballSummaryModel: Codable {
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

            let id: String
            let uid: String?
            let guid: String?
            let firstName: String?
            let lastName: String?
            let displayName: String?
            let links: [Link]?
          }

            let id: UUID = UUID()
          let athlete: Athlete?
          let stats: [String]
        }
          let id: UUID = UUID()
        let name: String?
        let keys: [String]?
        let text: String?
        let labels: [String]
        let descriptions: [String]?
        let athletes: [Athlete]?
        let totals: [String]?
      }

      let team: Team?
      let statistics: [Statistic]?
    }

    let teams: [Team]?
    let players: [Player]?
  }

//  struct Format: Codable {
//    struct Regulation: Codable {
//      let periods: Int?
//      let displayName: String?
//      let slug: String?
//      let clock: String?
//    }
//
//    struct Overtime: Codable {
//      let periods: Int?
//      let displayName: String?
//      let slug: String?
//      let clock: String?
//    }
//
//    let regulation: Regulation?
//    let overtime: Overtime?
//  }
//
//  struct GameInfo: Codable {
//    struct Venue: Codable {
//      struct Address: Codable {
//        let city: String?
//        let state: String?
//        let zipCode: String?
//      }
//
//      struct Image: Codable {
//        let href: URL?
//        let width: Int?
//        let height: Int?
//        let alt: String?
//        let rel: [String]?
//      }
//
//      let id: String?
//      let fullName: String?
//      let address: Address?
//      let capacity: Int?
//      let grass: Bool?
//      let images: [Image]?
//    }
//
//    struct Official: Codable {
//      struct Position: Codable {
//        let name: String?
//        let displayName: String?
//        let id: String?
//      }
//
//      let fullName: String?
//      let displayName: String?
//      let position: Position?
//      let order: Int?
//    }
//
//    let venue: Venue?
//    let attendance: Int?
//    let officials: [Official]?
//  }
//
//  struct Drife: Codable {
//    struct Previou: Codable {
//      struct Team: Codable {
//        struct Logo: Codable {
//          let href: URL?
//          let width: Int?
//          let height: Int?
//          let alt: String?
//          let rel: [String]?
//          let lastUpdated: String?
//        }
//
//        let name: String?
//        let abbreviation: String?
//        let displayName: String?
//        let shortDisplayName: String?
//        let logos: [Logo]?
//      }
//
//      struct Start: Codable {
//        struct Period: Codable {
//          let type: String?
//          let number: Int?
//        }
//
//        struct Clock: Codable {
//          let displayValue: String?
//        }
//
//        let period: Period?
//        let clock: Clock?
//        let yardLine: Int?
//        let text: String?
//      }
//
//      struct End: Codable {
//        struct Period: Codable {
//          let type: String?
//          let number: Int?
//        }
//
//        struct Clock: Codable {
//          let displayValue: String?
//        }
//
//        let period: Period?
//        let clock: Clock?
//        let yardLine: Int?
//        let text: String?
//      }
//
//      struct TimeElapsed: Codable {
//        let displayValue: String?
//      }
//
//      struct Play: Codable {
//        struct `Type`: Codable {
//          let id: String?
//          let text: String?
//          let abbreviation: String?
//        }
//
//        struct Period: Codable {
//          let number: Int?
//        }
//
//        struct Clock: Codable {
//          let displayValue: String?
//        }
//
//        struct Start: Codable {
//          struct Team: Codable {
//            let id: String?
//          }
//
//          let down: Int?
//          let distance: Int?
//          let yardLine: Int?
//          let yardsToEndzone: Int?
//          let team: Team?
//          let downDistanceText: String?
//          let shortDownDistanceText: String?
//          let possessionText: String?
//        }
//
//        struct End: Codable {
//          struct Team: Codable {
//            let id: String?
//          }
//
//          let down: Int?
//          let distance: Int?
//          let yardLine: Int?
//          let yardsToEndzone: Int?
//          let downDistanceText: String?
//          let shortDownDistanceText: String?
//          let possessionText: String?
//          let team: Team?
//        }
//
//        struct ScoringType: Codable {
//          let name: String?
//          let displayName: String?
//          let abbreviation: String?
//        }
//
//        struct PointAfterAttempt: Codable {
//          let id: Int?
//          let text: String?
//          let abbreviation: String?
//          let value: Int?
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
//        let priority: Bool?
//        let modified: String?
//        let wallclock: Date?
//        let start: Start?
//        let end: End?
//        let statYardage: Int?
//        let scoringType: ScoringType?
//        let pointAfterAttempt: PointAfterAttempt?
//      }
//
//      let id: String?
//      let description: String?
//      let team: Team?
//      let start: Start?
//      let end: End?
//      let timeElapsed: TimeElapsed?
//      let yards: Int?
//      let isScore: Bool?
//      let offensivePlays: Int?
//      let result: String?
//      let shortDisplayResult: String?
//      let displayResult: String?
//      let plays: [Play]?
//    }
//
//    let previous: [Previou]?
//  }
//
//  struct Leader: Codable {
//    struct Team: Codable {
//      struct Link: Codable {
//        let href: URL?
//        let text: String?
//      }
//
//      let id: String?
//      let uid: String?
//      let displayName: String?
//      let abbreviation: String?
//      let links: [Link]?
//      let logo: URL?
//    }
//
//    struct Leader: Codable {
//      struct Leader: Codable {
//        struct Athlete: Codable {
//          struct Link: Codable {
//            let rel: [String]?
//            let href: URL?
//            let text: String?
//          }
//
//          struct Headshot: Codable {
//            let href: URL?
//            let alt: String?
//          }
//
//          struct Position: Codable {
//            let abbreviation: String?
//          }
//
//          struct Team: Codable {
//            let _$ref: URL?
//
//            private enum CodingKeys: String, CodingKey {
//              case _$ref = "$ref"
//            }
//          }
//
//          let id: String?
//          let uid: String?
//          let guid: String?
//          let lastName: String?
//          let fullName: String?
//          let displayName: String?
//          let shortName: String?
//          let links: [Link]?
//          let headshot: Headshot?
//          let jersey: String?
//          let position: Position?
//          let team: Team?
//        }
//
//        let displayValue: String?
//        let athlete: Athlete?
//      }
//
//      let name: String?
//      let displayName: String?
//      let leaders: [Leader]?
//    }
//
//    let team: Team?
//    let leaders: [Leader]?
//  }
//
//  struct Predictor: Codable {
//    struct HomeTeam: Codable {
//      let id: String?
//      let gameProjection: String?
//      let teamChanceLoss: String?
//      let teamChanceTie: String?
//    }
//
//    struct AwayTeam: Codable {
//      let id: String?
//      let gameProjection: String?
//      let teamChanceLoss: String?
//      let teamChanceTie: String?
//    }
//
//    let header: String?
//    let homeTeam: HomeTeam?
//    let awayTeam: AwayTeam?
//  }
//
//  struct Pickcenter: Codable {
//    struct Provider: Codable {
//      let id: String?
//      let name: String?
//      let priority: Int?
//    }
//
//    struct AwayTeamOdd: Codable {
//      struct SpreadRecord: Codable {
//        let wins: Int?
//        let losses: Int?
//        let pushes: Int?
//        let summary: String?
//      }
//
//      let favorite: Bool?
//      let underdog: Bool?
//      let moneyLine: Int?
//      let spreadOdds: String?
//      let teamID: String?
//      let winPercentage: String?
//      let averageScore: Double?
//      let spreadRecord: SpreadRecord?
//
//      private enum CodingKeys: String, CodingKey {
//        case favorite
//        case underdog
//        case moneyLine
//        case spreadOdds
//        case teamID = "teamId"
//        case winPercentage
//        case averageScore
//        case spreadRecord
//      }
//    }
//
//    struct HomeTeamOdd: Codable {
//      struct SpreadRecord: Codable {
//        let wins: Int?
//        let losses: Int?
//        let pushes: Int?
//        let summary: String?
//      }
//
//      let favorite: Bool?
//      let underdog: Bool?
//      let moneyLine: Int?
//      let spreadOdds: String?
//      let teamID: String?
//      let winPercentage: String?
//      let averageScore: Double?
//      let spreadRecord: SpreadRecord?
//
//      private enum CodingKeys: String, CodingKey {
//        case favorite
//        case underdog
//        case moneyLine
//        case spreadOdds
//        case teamID = "teamId"
//        case winPercentage
//        case averageScore
//        case spreadRecord
//      }
//    }
//
//    let provider: Provider?
//    let details: String?
//    let overUnder: String?
//    let spread: Double?
//    let awayTeamOdds: AwayTeamOdd?
//    let homeTeamOdds: HomeTeamOdd?
//    let links: [Any]?
//  }
//
//  struct AgainstTheSpread: Codable {
//    struct Team: Codable {
//      struct Link: Codable {
//        let href: URL?
//        let text: String?
//      }
//
//      let id: String?
//      let uid: String?
//      let displayName: String?
//      let abbreviation: String?
//      let links: [Link]?
//      let logo: URL?
//    }
//
//    let team: Team?
//    let records: [Any]?
//  }
//
//  struct Winprobability: Codable {
//    let tiePercentage: String?
//    let homeWinPercentage: Any?
//    let secondsLeft: Int?
//    let playID: String?
//
//    private enum CodingKeys: String, CodingKey {
//      case tiePercentage
//      case homeWinPercentage
//      case secondsLeft
//      case playID = "playId"
//    }
//  }
//
//  struct ScoringPlay: Codable {
//    struct `Type`: Codable {
//      let id: String?
//      let text: String?
//      let abbreviation: String?
//    }
//
//    struct Period: Codable {
//      let number: Int?
//    }
//
//    struct Clock: Codable {
//      let value: String?
//      let displayValue: String?
//    }
//
//    struct Team: Codable {
//      struct Link: Codable {
//        let href: URL?
//        let text: String?
//      }
//
//      let id: String?
//      let uid: String?
//      let displayName: String?
//      let abbreviation: String?
//      let links: [Link]?
//      let logo: URL?
//    }
//
//    struct ScoringType: Codable {
//      let name: String?
//      let displayName: String?
//      let abbreviation: String?
//    }
//
//    let id: String?
//    let type: `Type`?
//    let text: String?
//    let awayScore: Int?
//    let homeScore: Int?
//    let period: Period?
//    let clock: Clock?
//    let team: Team?
//    let scoringType: ScoringType?
//  }
//
//  struct Header: Codable {
//    struct Season: Codable {
//      let year: Int?
//      let type: Int?
//    }
//
//    struct Competition: Codable {
//      struct Competitor: Codable {
//        struct Team: Codable {
//          struct Logo: Codable {
//            let href: URL?
//            let width: Int?
//            let height: Int?
//            let alt: String?
//            let rel: [String]?
//            let lastUpdated: String?
//          }
//
//          struct Link: Codable {
//            let rel: [String]?
//            let href: URL?
//            let text: String?
//          }
//
//          let id: String?
//          let uid: String?
//          let location: String?
//          let name: String?
//          let nickname: String?
//          let abbreviation: String?
//          let displayName: String?
//          let color: String?
//          let alternateColor: String?
//          let logos: [Logo]?
//          let links: [Link]?
//        }
//
//        struct Linescore: Codable {
//          let displayValue: String?
//        }
//
//        struct Record: Codable {
//          let type: String?
//          let summary: String?
//          let displayValue: String?
//        }
//
//        let id: String?
//        let uid: String?
//        let order: Int?
//        let homeAway: String?
//        let winner: Bool?
//        let team: Team?
//        let score: String?
//        let linescores: [Linescore]?
//        let record: [Record]?
//        let possession: Bool?
//      }
//
//      struct Status: Codable {
//        struct `Type`: Codable {
//          let id: String?
//          let name: String?
//          let state: String?
//          let completed: Bool?
//          let description: String?
//          let detail: String?
//          let shortDetail: String?
//        }
//
//        let type: `Type`?
//      }
//
//      struct Broadcast: Codable {
//        struct `Type`: Codable {
//          let id: String?
//          let shortName: String?
//        }
//
//        struct Market: Codable {
//          let id: String?
//          let type: String?
//        }
//
//        struct Medium: Codable {
//          let shortName: String?
//        }
//
//        let type: `Type`?
//        let market: Market?
//        let media: Medium?
//        let lang: String?
//        let region: String?
//      }
//
//      let id: String?
//      let uid: String?
//      let date: String?
//      let neutralSite: Bool?
//      let conferenceCompetition: Bool?
//      let boxscoreAvailable: Bool?
//      let commentaryAvailable: Bool?
//      let liveAvailable: Bool?
//      let onWatchESPN: Bool?
//      let recent: Bool?
//      let boxscoreSource: String?
//      let playByPlaySource: String?
//      let competitors: [Competitor]?
//      let status: Status?
//      let broadcasts: [Broadcast]?
//    }
//
//    struct Link: Codable {
//      let rel: [String]?
//      let href: URL?
//      let text: String?
//      let shortText: String?
//      let isExternal: Bool?
//      let isPremium: Bool?
//    }
//
//    struct League: Codable {
//      struct Link: Codable {
//        let rel: [String]?
//        let href: URL?
//        let text: String?
//      }
//
//      let id: String?
//      let uid: String?
//      let name: String?
//      let abbreviation: String?
//      let slug: String?
//      let isTournament: Bool?
//      let links: [Link]?
//    }
//
//    let id: String?
//    let uid: String?
//    let season: Season?
//    let timeValid: Bool?
//    let competitions: [Competition]?
//    let links: [Link]?
//    let week: Int?
//    let league: League?
//  }
//
//  struct News: Codable {
//    struct Link: Codable {
//      let language: String?
//      let rel: [String]?
//      let href: URL?
//      let text: String?
//      let shortText: String?
//      let isExternal: Bool?
//      let isPremium: Bool?
//    }
//
//    struct Article: Codable {
//      struct Image: Codable {
//        let name: String?
//        let type: String?
//        let url: URL?
//        let width: Int?
//        let ratio: String?
//        let height: Int?
//        let caption: String?
//        let alt: String?
//      }
//
//      struct Link: Codable {
//        struct Api: Codable {
//          struct News: Codable {
//            let href: URL?
//          }
//
//          struct `Self`: Codable {
//            let href: URL?
//          }
//
//          let news: News?
//          let `self`: `Self`?
//        }
//
//        struct Web: Codable {
//          struct Short: Codable {
//            let href: URL?
//          }
//
//          let href: URL?
//          let short: Short?
//        }
//
//        struct Mobile: Codable {
//          let href: URL?
//        }
//
//        let api: Api?
//        let web: Web?
//        let mobile: Mobile?
//      }
//
//      struct Category: Codable {
//        struct League: Codable {
//          struct Link: Codable {
//            struct Api: Codable {
//              struct League: Codable {
//                let href: URL?
//              }
//
//              let leagues: League?
//            }
//
//            struct Web: Codable {
//              struct League: Codable {
//                let href: URL?
//              }
//
//              let leagues: League?
//            }
//
//            struct Mobile: Codable {
//              struct League: Codable {
//                let href: URL?
//              }
//
//              let leagues: League?
//            }
//
//            let api: Api?
//            let web: Web?
//            let mobile: Mobile?
//          }
//
//          let id: Int?
//          let description: String?
//          let links: Link?
//        }
//
//        struct Team: Codable {
//          struct Link: Codable {
//            struct Api: Codable {
//              struct Team: Codable {
//                let href: URL?
//              }
//
//              let teams: Team?
//            }
//
//            struct Web: Codable {
//              struct Team: Codable {
//                let href: URL?
//              }
//
//              let teams: Team?
//            }
//
//            struct Mobile: Codable {
//              struct Team: Codable {
//                let href: URL?
//              }
//
//              let teams: Team?
//            }
//
//            let api: Api?
//            let web: Web?
//            let mobile: Mobile?
//          }
//
//          let id: Int?
//          let description: String?
//          let links: Link?
//        }
//
//        struct Athlete: Codable {
//          struct Link: Codable {
//            struct Api: Codable {
//              struct Athlete: Codable {
//                let href: URL?
//              }
//
//              let athletes: Athlete?
//            }
//
//            struct Web: Codable {
//              struct Athlete: Codable {
//                let href: URL?
//              }
//
//              let athletes: Athlete?
//            }
//
//            struct Mobile: Codable {
//              struct Athlete: Codable {
//                let href: URL?
//              }
//
//              let athletes: Athlete?
//            }
//
//            let api: Api?
//            let web: Web?
//            let mobile: Mobile?
//          }
//
//          let id: Int?
//          let description: String?
//          let links: Link?
//        }
//
//        let id: Int?
//        let description: String?
//        let type: String?
//        let sportID: Int?
//        let leagueID: Int?
//        let league: League?
//        let uid: String?
//        let createDate: Date?
//        let teamID: Int?
//        let team: Team?
//        let guid: String?
//        let topicID: Int?
//        let athleteID: Int?
//        let athlete: Athlete?
//
//        private enum CodingKeys: String, CodingKey {
//          case id
//          case description
//          case type
//          case sportID = "sportId"
//          case leagueID = "leagueId"
//          case league
//          case uid
//          case createDate
//          case teamID = "teamId"
//          case team
//          case guid
//          case topicID = "topicId"
//          case athleteID = "athleteId"
//          case athlete
//        }
//      }
//
//      let images: [Image]?
//      let description: String?
//      let published: Date?
//      let type: String?
//      let premium: Bool?
//      let links: Link?
//      let lastModified: Date?
//      let categories: [Category]?
//      let headline: String?
//    }
//
//    let header: String?
//    let link: Link?
//    let articles: [Article]?
//  }
//
//  struct Video: Codable {
//    struct Ad: Codable {
//      let sport: String?
//      let bundle: String?
//    }
//
//    struct Tracking: Codable {
//      let sportName: String?
//      let leagueName: String?
//      let coverageType: String?
//      let trackingName: String?
//      let trackingID: String?
//
//      private enum CodingKeys: String, CodingKey {
//        case sportName
//        case leagueName
//        case coverageType
//        case trackingName
//        case trackingID = "trackingId"
//      }
//    }
//
//    struct TimeRestriction: Codable {
//      let embargoDate: Date?
//      let expirationDate: Date?
//    }
//
//    struct DeviceRestriction: Codable {
//      let type: String?
//      let devices: [String]?
//    }
//
//    struct Link: Codable {
//      struct Api: Codable {
//        struct `Self`: Codable {
//          let href: URL?
//        }
//
//        struct Artwork: Codable {
//          let href: URL?
//        }
//
//        let `self`: `Self`?
//        let artwork: Artwork?
//      }
//
//      struct Web: Codable {
//        struct Short: Codable {
//          let href: URL?
//        }
//
//        struct `Self`: Codable {
//          let href: URL?
//        }
//
//        let href: URL?
//        let short: Short?
//        let `self`: `Self`?
//      }
//
//      struct Source: Codable {
//        struct Mezzanine: Codable {
//          let href: URL?
//        }
//
//        struct Flash: Codable {
//          let href: URL?
//        }
//
//        struct Hd: Codable {
//          let href: URL?
//        }
//
//        struct HL: Codable {
//          struct HD: Codable {
//            let href: URL?
//          }
//
//          let href: URL?
//          let hD: HD?
//
//          private enum CodingKeys: String, CodingKey {
//            case href
//            case hD = "HD"
//          }
//        }
//
//        struct HD: Codable {
//          let href: URL?
//        }
//
//        struct Full: Codable {
//          let href: URL?
//        }
//
//        let mezzanine: Mezzanine?
//        let flash: Flash?
//        let hds: Hd?
//        let hLS: HL?
//        let hD: HD?
//        let full: Full?
//        let href: URL?
//
//        private enum CodingKeys: String, CodingKey {
//          case mezzanine
//          case flash
//          case hds
//          case hLS = "HLS"
//          case hD = "HD"
//          case full
//          case href
//        }
//      }
//
//      struct Mobile: Codable {
//        struct Alert: Codable {
//          let href: URL?
//        }
//
//        struct Source: Codable {
//          let href: URL?
//        }
//
//        struct Streaming: Codable {
//          let href: URL?
//        }
//
//        struct ProgressiveDownload: Codable {
//          let href: URL?
//        }
//
//        let alert: Alert?
//        let source: Source?
//        let href: URL?
//        let streaming: Streaming?
//        let progressiveDownload: ProgressiveDownload?
//      }
//
//      let api: Api?
//      let web: Web?
//      let source: Source?
//      let mobile: Mobile?
//    }
//
//    let source: String?
//    let id: Int?
//    let headline: String?
//    let description: String?
//    let ad: Ad?
//    let tracking: Tracking?
//    let cerebroID: String?
//    let lastModified: Date?
//    let originalPublishDate: Date?
//    let timeRestrictions: TimeRestriction?
//    let deviceRestrictions: DeviceRestriction?
//    let duration: Int?
//    let thumbnail: URL?
//    let links: Link?
//
//    private enum CodingKeys: String, CodingKey {
//      case source
//      case id
//      case headline
//      case description
//      case ad
//      case tracking
//      case cerebroID = "cerebroId"
//      case lastModified
//      case originalPublishDate
//      case timeRestrictions
//      case deviceRestrictions
//      case duration
//      case thumbnail
//      case links
//    }
//  }
//
//  struct Standing: Codable {
//    struct FullViewLink: Codable {
//      let text: String?
//      let href: URL?
//    }
//
//    struct Group: Codable {
//      struct Standing: Codable {
//        struct Entry: Codable {
//          struct Stat: Codable {
//            let name: String?
//            let displayName: String?
//            let shortDisplayName: String?
//            let description: String?
//            let abbreviation: String?
//            let type: String?
//            let value: String?
//            let displayValue: String?
//            let id: String?
//            let summary: String?
//          }
//
//          struct Logo: Codable {
//            let href: URL?
//            let width: Int?
//            let height: Int?
//            let alt: String?
//            let rel: [String]?
//            let lastUpdated: String?
//          }
//
//          let team: String?
//          let link: URL?
//          let id: String?
//          let uid: String?
//          let stats: [Stat]?
//          let logo: [Logo]?
//        }
//
//        let entries: [Entry]?
//      }
//
//      let standings: Standing?
//      let header: String?
//      let href: URL?
//    }
//
//    let fullViewLink: FullViewLink?
//    let groups: [Group]?
//  }

  let boxscore: Boxscore
//  let format: Format?
//  let gameInfo: GameInfo?
//  let drives: Drife?
//  let leaders: [Leader]?
//  let broadcasts: [Any]?
//  let predictor: Predictor?
//  let pickcenter: [Pickcenter]?
//  let againstTheSpread: [AgainstTheSpread]?
//  let odds: [Any]?
//  let winprobability: [Winprobability]?
//  let scoringPlays: [ScoringPlay]?
//  let header: Header?
//  let news: News?
//  let videos: [Video]?
//  let standings: Standing?
}

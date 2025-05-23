//
//  Time.swift
//  Porchfest
//
//  Created by Jeff Candell on 5/22/25.
//

import Foundation

public struct Time {
    public let hours: Int
    public let minutes: Int
    public let seconds: Int

    public init(hours: Int, minutes: Int = 0, seconds: Int = 0) {
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }
}

extension Time: Equatable { }

extension Time: Identifiable {
    public var id: Int {
        seconds + (60 * minutes) + (60 * 60 * hours)
    }
}

extension Time: Hashable { }

extension Time: Sendable { }

extension Time {
    nonisolated(unsafe)
    private static let amPmRegex = /^((1[0-2]|0?[0-9]):([0-5][0-9]))(:([0-5][0-9]))? ?([ap][m])$/.ignoresCase()
    nonisolated(unsafe)
    private static let militaryRegex = /^((1[0-9]|0?[0-9]|2[0-3]):([0-5][0-9]))(:([0-5][0-9]))?$/

    public init?(from string: String) {
        let trimmed = string.trimmingCharacters(in: .whitespacesAndNewlines)
        if let match = trimmed.wholeMatch(of: Self.amPmRegex),
           var hours = Int(match.output.2),
           let minutes = Int(match.output.3),
           let seconds = Int(match.output.5 ?? "0") {
            if match.output.6.lowercased() == "pm" && hours < 12 {
                hours += 12
            } else if match.output.6.lowercased() == "am" && hours == 12 {
                hours -= 12
            }
            self.init(hours: hours, minutes: minutes, seconds: seconds)
        } else if let match = trimmed.wholeMatch(of: Self.militaryRegex),
                  let hours = Int(match.output.2),
                  let minutes = Int(match.output.3),
                  let seconds = Int(match.output.5 ?? "0") {
            self.init(hours: hours, minutes: minutes, seconds: seconds)
        } else {
            return nil
        }
    }
}

extension Time {
    public enum FormatStyle {
        case military, amPm
    }

    public func formatted(as format: FormatStyle) -> String {
        switch format {
        case .military:
            let base = String(format: "%02d:%02d", hours, minutes)
            return seconds == 0 ? base : String(format: "%@:%02d", base, seconds)
        case .amPm:
            var suffix = "AM"
            var formedHours: Int = hours
            if hours >= 12 {
                suffix = "PM"
            }
            if hours == 0 {
                formedHours = 12
            } else if hours > 13 {
                formedHours -= 12
            }
            let base = String(format: "%d:%02d", formedHours, minutes)
            return seconds == 0 ? "\(base) \(suffix)" : String(format: "%@:%02d %@", base, seconds, suffix)
        }
    }
}

extension Time: CustomStringConvertible {
    public var description: String {
        formatted(as: .military)
    }
}

extension Time: Codable {
    public init(from decoder: any Decoder) throws {
        let string = try decoder.singleValueContainer().decode(String.self)
        guard let time = Time(from: string) else {
            throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "String could not be parsed to a valid time"))
        }

        self.init(hours: time.hours, minutes: time.minutes, seconds: time.seconds)
    }

    public enum CodingKeys: CodingKey {
        case hours
        case minutes
        case seconds
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(formatted(as: .military))
    }
}

extension Time {
    public func toTimeToday() -> Date? {
        Calendar.current.date(bySettingHour: hours, minute: minutes, second: seconds, of: .now)
    }
}

extension Time: Comparable {
    public static func < (lhs: Time, rhs: Time) -> Bool {
        if lhs.hours < rhs.hours {
            return true
        } else if lhs.hours > rhs.hours {
            return false
        }

        if lhs.minutes < rhs.minutes {
            return true
        } else if lhs.minutes > rhs.minutes {
            return false
        }

        return lhs.seconds < rhs.seconds
    }
}

extension Time {
    public static let noon: Time = .init(hours: 12, minutes: 0, seconds: 0)

    public static let twoPm: Time = .init(hours: 14, minutes: 0, seconds: 0)

    public static let fourPm: Time = .init(hours: 16, minutes: 0, seconds: 0)

    public static let sixPm: Time = .init(hours: 18, minutes: 0, seconds: 0)
}

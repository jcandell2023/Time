//
//  TimeTests.swift
//  Porchfest
//
//  Created by Jeff Candell on 5/22/25.
//

import Time
import Testing

let militaryCases = [
    TimeTestCase(string: "01:11", time: Time(hours: 1, minutes: 11)),
    TimeTestCase(string: "11:33:55", time: Time(hours: 11, minutes: 33, seconds: 55)),
    TimeTestCase(string: "12:30:11", time: Time(hours: 12, minutes: 30, seconds: 11)),
    TimeTestCase(string: "00:57", time: Time(hours: 0, minutes: 57)),
    TimeTestCase(string: "15:45", time: Time(hours: 15, minutes: 45)),
    TimeTestCase(string: "00:00", time: Time(hours: 0)),
    TimeTestCase(string: "01:01:01", time: Time(hours: 1, minutes: 1, seconds: 1)),
    TimeTestCase(string: "02:02:02", time: Time(hours: 2, minutes: 2, seconds: 2)),
    TimeTestCase(string: "03:03:03", time: Time(hours: 3, minutes: 3, seconds: 3)),
    TimeTestCase(string: "04:04:04", time: Time(hours: 4, minutes: 4, seconds: 4)),
    TimeTestCase(string: "05:05:05", time: Time(hours: 5, minutes: 5, seconds: 5)),
    TimeTestCase(string: "06:06:06", time: Time(hours: 6, minutes: 6, seconds: 6)),
    TimeTestCase(string: "07:07:07", time: Time(hours: 7, minutes: 7, seconds: 7)),
    TimeTestCase(string: "08:08:08", time: Time(hours: 8, minutes: 8, seconds: 8)),
    TimeTestCase(string: "09:09:09", time: Time(hours: 9, minutes: 9, seconds: 9)),
    TimeTestCase(string: "10:10:10", time: Time(hours: 10, minutes: 10, seconds: 10)),
    TimeTestCase(string: "11:11:11", time: Time(hours: 11, minutes: 11, seconds: 11)),
    TimeTestCase(string: "12:12:12", time: Time(hours: 12, minutes: 12, seconds: 12)),
    TimeTestCase(string: "13:13:13", time: Time(hours: 13, minutes: 13, seconds: 13)),
    TimeTestCase(string: "14:14:14", time: Time(hours: 14, minutes: 14, seconds: 14)),
    TimeTestCase(string: "15:15:15", time: Time(hours: 15, minutes: 15, seconds: 15)),
    TimeTestCase(string: "16:16:16", time: Time(hours: 16, minutes: 16, seconds: 16)),
    TimeTestCase(string: "17:17:17", time: Time(hours: 17, minutes: 17, seconds: 17)),
    TimeTestCase(string: "18:18:18", time: Time(hours: 18, minutes: 18, seconds: 18)),
    TimeTestCase(string: "19:19:19", time: Time(hours: 19, minutes: 19, seconds: 19)),
    TimeTestCase(string: "20:20:20", time: Time(hours: 20, minutes: 20, seconds: 20)),
    TimeTestCase(string: "21:21:21", time: Time(hours: 21, minutes: 21, seconds: 21)),
    TimeTestCase(string: "22:22:22", time: Time(hours: 22, minutes: 22, seconds: 22)),
    TimeTestCase(string: "23:23:23", time: Time(hours: 23, minutes: 23, seconds: 23))
]

let amPmCases = [
    TimeTestCase(string: "1:11 AM", time: Time(hours: 1, minutes: 11)),
    TimeTestCase(string: "11:33:55 AM", time: Time(hours: 11, minutes: 33, seconds: 55)),
    TimeTestCase(string: "3:45 PM", time: Time(hours: 15, minutes: 45)),
    TimeTestCase(string: "12:30:11 PM", time: Time(hours: 12, minutes: 30, seconds: 11)),
    TimeTestCase(string: "12:57 AM", time: Time(hours: 0, minutes: 57)),
    TimeTestCase(string: "12:00 AM", time: Time(hours: 0)),
    TimeTestCase(string: "1:01:01 AM", time: Time(hours: 1, minutes: 1, seconds: 1)),
    TimeTestCase(string: "2:02:02 AM", time: Time(hours: 2, minutes: 2, seconds: 2)),
    TimeTestCase(string: "3:03:03 AM", time: Time(hours: 3, minutes: 3, seconds: 3)),
    TimeTestCase(string: "4:04:04 AM", time: Time(hours: 4, minutes: 4, seconds: 4)),
    TimeTestCase(string: "5:05:05 AM", time: Time(hours: 5, minutes: 5, seconds: 5)),
    TimeTestCase(string: "6:06:06 AM", time: Time(hours: 6, minutes: 6, seconds: 6)),
    TimeTestCase(string: "7:07:07 AM", time: Time(hours: 7, minutes: 7, seconds: 7)),
    TimeTestCase(string: "8:08:08 AM", time: Time(hours: 8, minutes: 8, seconds: 8)),
    TimeTestCase(string: "9:09:09 AM", time: Time(hours: 9, minutes: 9, seconds: 9)),
    TimeTestCase(string: "10:10:10 AM", time: Time(hours: 10, minutes: 10, seconds: 10)),
    TimeTestCase(string: "11:11:11 AM", time: Time(hours: 11, minutes: 11, seconds: 11)),
    TimeTestCase(string: "12:12:12 PM", time: Time(hours: 12, minutes: 12, seconds: 12)),
    TimeTestCase(string: "1:13:13 PM", time: Time(hours: 13, minutes: 13, seconds: 13)),
    TimeTestCase(string: "2:14:14 PM", time: Time(hours: 14, minutes: 14, seconds: 14)),
    TimeTestCase(string: "3:15:15 PM", time: Time(hours: 15, minutes: 15, seconds: 15)),
    TimeTestCase(string: "4:16:16 PM", time: Time(hours: 16, minutes: 16, seconds: 16)),
    TimeTestCase(string: "5:17:17 PM", time: Time(hours: 17, minutes: 17, seconds: 17)),
    TimeTestCase(string: "6:18:18 PM", time: Time(hours: 18, minutes: 18, seconds: 18)),
    TimeTestCase(string: "7:19:19 PM", time: Time(hours: 19, minutes: 19, seconds: 19)),
    TimeTestCase(string: "8:20:20 PM", time: Time(hours: 20, minutes: 20, seconds: 20)),
    TimeTestCase(string: "9:21:21 PM", time: Time(hours: 21, minutes: 21, seconds: 21)),
    TimeTestCase(string: "10:22:22 PM", time: Time(hours: 22, minutes: 22, seconds: 22)),
    TimeTestCase(string: "11:23:23 PM", time: Time(hours: 23, minutes: 23, seconds: 23))
]

let extraParseCases = [
    TimeTestCase(string: "3:45 pm", time: Time(hours: 15, minutes: 45)),
    TimeTestCase(string: "12:30:11 Pm", time: Time(hours: 12, minutes: 30, seconds: 11)),
    TimeTestCase(string: "", time: nil)
]

struct TimeTests {
    @Test("String parsing to time", arguments: militaryCases + amPmCases + extraParseCases)
    func testTimeInitFromString(_ testCase: TimeTestCase) {
        let time = Time(from: testCase.string)

        #expect(time == testCase.time)
    }

    @Test("Formatting as military time", arguments: militaryCases)
    func testMilitaryStringFormat(_ testCase: TimeTestCase) {
        let formatted = testCase.time?.formatted(as: .military)

        #expect(formatted == testCase.string)
    }

    @Test("Formatting as am/pm time", arguments: amPmCases)
    func testAmPmStringFormat(_ testCase: TimeTestCase) {
        let formatted = testCase.time?.formatted(as: .amPm)

        #expect(formatted == testCase.string)
    }
}

struct TimeTestCase {
    let string: String
    let time: Time?
}

//
//  TimeTests.swift
//  Porchfest
//
//  Created by Jeff Candell on 5/22/25.
//

import Time
import Testing

struct TimeTests {
    @Test("String parsing to time", arguments: [
        TimeTestCase(string: "1:11", time: Time(hours: 1, minutes: 11)),
        TimeTestCase(string: "11:33:55", time: Time(hours: 11, minutes: 33, seconds: 55)),
        TimeTestCase(string: "3:45 pm", time: Time(hours: 15, minutes: 45)),
        TimeTestCase(string: "12:30:11 Pm", time: Time(hours: 12, minutes: 30, seconds: 11)),
        TimeTestCase(string: "12:57 AM", time: Time(hours: 0, minutes: 57)),
        TimeTestCase(string: "", time: nil)
    ])
    func testTimeInitFromString(_ testCase: TimeTestCase) {
        let time = Time(from: testCase.string)

        #expect(time == testCase.time)
    }

    @Test("Formatting as military time", arguments: [
        TimeTestCase(string: "01:11", time: Time(hours: 1, minutes: 11)),
        TimeTestCase(string: "11:33:55", time: Time(hours: 11, minutes: 33, seconds: 55)),
        TimeTestCase(string: "12:30:11", time: Time(hours: 12, minutes: 30, seconds: 11)),
        TimeTestCase(string: "00:57", time: Time(hours: 0, minutes: 57)),
        TimeTestCase(string: "15:45", time: Time(hours: 15, minutes: 45)),
        TimeTestCase(string: "01:01:01", time: Time(hours: 1, minutes: 1, seconds: 1))
    ])
    func testMilitaryStringFormat(_ testCase: TimeTestCase) {
        let formatted = testCase.time?.formatted(as: .military)

        #expect(formatted == testCase.string)
    }

    @Test("Formatting as am/pm time", arguments: [
        TimeTestCase(string: "1:11 AM", time: Time(hours: 1, minutes: 11)),
        TimeTestCase(string: "11:33:55 AM", time: Time(hours: 11, minutes: 33, seconds: 55)),
        TimeTestCase(string: "3:45 PM", time: Time(hours: 15, minutes: 45)),
        TimeTestCase(string: "12:30:11 PM", time: Time(hours: 12, minutes: 30, seconds: 11)),
        TimeTestCase(string: "12:57 AM", time: Time(hours: 0, minutes: 57)),
        TimeTestCase(string: "1:01:01 AM", time: Time(hours: 1, minutes: 1, seconds: 1))
    ])
    func testAmPmStringFormat(_ testCase: TimeTestCase) {
        let formatted = testCase.time?.formatted(as: .amPm)

        #expect(formatted == testCase.string)
    }
}

struct TimeTestCase {
    let string: String
    let time: Time?
}

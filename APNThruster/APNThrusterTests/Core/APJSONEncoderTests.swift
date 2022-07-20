//
//  APJSONEncoderTests.swift
//  APNThrusterTests
//
//  Created by Alexander Martirosov on 20/07/2022.
//

import XCTest
@testable import APNThruster

class APJSONEncoderTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEncode() throws {
        // Arrange
        let sut = APJSONEncoder()
        let notification = APNotification(
            aps: APNotification.Aps(
                alert: APNotification.Aps.Alert(
                    title: "Test",
                    subtitle: "subtest",
                    body: nil
                )
            ),
            badge: "1",
            sound: nil
        )
        let expected = "{\"aps\":{\"alert\":{\"title\":\"Test\",\"subtitle\":\"subtest\"}},\"badge\":\"1\"}"
        
        // Act
        let encodedNotification = try? sut.encode(notification)
        
        // Assert
        XCTAssertNotNil(encodedNotification)
        XCTAssertEqual(encodedNotification, expected)
    }
    
    func testDecode() throws {
        // Arrange
        let sut = APJSONEncoder()
        let encodedNotification = "{\"aps\":{\"alert\":{\"title\":\"Test\",\"subtitle\":\"subtest\"}},\"badge\":\"1\"}"
        let expected = APNotification(
            aps: APNotification.Aps(
                alert: APNotification.Aps.Alert(
                    title: "Test",
                    subtitle: "subtest",
                    body: nil
                )
            ),
            badge: "1",
            sound: nil
        )
        
        // Act
        let notification: APNotification? = try? sut.decode(encodedNotification)
        
        // Assert
        XCTAssertNotNil(notification)
        XCTAssertEqual(notification, expected)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension APNotification.Aps.Alert: Equatable {
    public static func == (lhs: APNotification.Aps.Alert, rhs: APNotification.Aps.Alert) -> Bool {
        lhs.title == rhs.title && lhs.subtitle == rhs.subtitle && lhs.body == rhs.body
    }
}
extension APNotification.Aps: Equatable {
    public static func == (lhs: APNotification.Aps, rhs: APNotification.Aps) -> Bool {
        lhs.alert == rhs.alert
    }
}
extension APNotification: Equatable {
    public static func == (lhs: APNotification, rhs: APNotification) -> Bool {
        lhs.aps == rhs.aps
    }
}

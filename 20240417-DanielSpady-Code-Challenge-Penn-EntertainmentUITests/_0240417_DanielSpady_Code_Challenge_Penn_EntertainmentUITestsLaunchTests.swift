//
//  _0240417_DanielSpady_Code_Challenge_Penn_EntertainmentUITestsLaunchTests.swift
//  20240417-DanielSpady-Code-Challenge-Penn-EntertainmentUITests
//
//  Created by Daniel Spady on 2024-04-17.
//

import XCTest

final class _0240417_DanielSpady_Code_Challenge_Penn_EntertainmentUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

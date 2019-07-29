//
//  Springboard.swift
//  evcashUITests
//
//  Created by Kaique de Souza Monteiro on 21/07/19.
//  Copyright © 2019 Kaique de Souza Monteiro. All rights reserved.
//

import XCTest

/// Classe necessária para realizar a exclusão do app ao final de um teste
class Springboard {
    static let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")

    /**
     Terminate and delete the app via springboard
     */
    class func deleteMyApp() {
        XCUIApplication().terminate()

        // Resolve the query for the springboard rather than launching it
        springboard.activate()

        // Force delete the app from the springboard
        let icon = springboard.icons["RandomImages"]
        if icon.exists {
            let iconFrame = icon.frame
            let springboardFrame = springboard.frame
            icon.press(forDuration: 1.3)

            // Tap the little "X" button at approximately where it is. The X is not exposed directly
            springboard.coordinate(withNormalizedOffset: CGVector(dx: (iconFrame.minX + 3 * UIScreen.main.scale) / springboardFrame.maxX, dy: (iconFrame.minY + 3 * UIScreen.main.scale) / springboardFrame.maxY)).tap()

            if springboard.alerts.buttons["Apagar"].exists {
                springboard.alerts.buttons["Apagar"].tap()
            } else {
                springboard.alerts.buttons["Delete"].tap()
            }


            // Press home once make the icons stop wiggling
            XCUIDevice.shared.press(.home)
            // Press home again to go to the first page of the springboard
            XCUIDevice.shared.press(.home)
            // Wait some time for the animation end
            Thread.sleep(forTimeInterval: 0.5)


        }
    }
}

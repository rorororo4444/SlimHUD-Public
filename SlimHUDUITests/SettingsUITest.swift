//
//  SlimHUDUITests.swift
//  SlimHUDUITests
//
//  Created by Alex Perathoner on 22/12/22.
//  Copyright © 2022 Alex Perathoner. All rights reserved.
//

import XCTest

final class SettingsUITest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOpenSettingsWindow() throws {
        let app = XCUIApplication()
        app.launch()
        
        let menuBarsQuery = app.menuBars
        menuBarsQuery.statusItems["SlimHUD"].click()
        menuBarsQuery/*@START_MENU_TOKEN@*/.menuItems["Preferences...."]/*[[".menuBarItems[\"SlimHUD\"]",".menus.menuItems[\"Preferences....\"]",".menuItems[\"Preferences....\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.click()
        
        sleep(2)
        
        XCTAssertEqual(app.windows.count, 2)
        
        let settingsWindow = app.windows["Settings"]
        settingsWindow.click()
        
        let attachment = XCTAttachment(screenshot: settingsWindow.screenshot())
        attachment.name = "Settings screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

//
//  SimpleTestUITests.swift
//  SimpleTestUITests
//
//  Created by IRFAN TRIHANDOKO on 03/07/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import XCTest

class SimpleTestUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // Since UI tests are more expensive to run, it's usually a good idea to exit if a failure was encountered
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        // We send a command line argument to our app, to enable it to reset its state
        app.launchArguments.append("--uitesting")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func waiting(time: Int) {
        for _ in 0..<time {
            let wait = app.waitForExistence(timeout: 60.0)
            debugPrint(wait)
        }
    }
    
    func launch() {
        app.launch()
    }
    
    func scroll(time: Int) {
        for _ in 0..<time {
            app.swipeUp()
            app.swipeDown()
        }
    }
    
    func swipeCollection(id: String, time: Int, isTopDown: Bool) {
        for _ in 0..<time {
            if isTopDown == true {
                app.collectionViews[id].swipeUp()
                app.collectionViews[id].swipeDown()
            } else {
                app.collectionViews[id].swipeLeft()
                app.collectionViews[id].swipeRight()
            }
        }
    }
    
    func tap() {
        app.tap()
    }
    
    func tapButton(id: String) {
        app.buttons[id].tap()
    }
    
    func dismissAlert(title: String, button: String) {
        app.alerts[title].buttons[button].tap()
    }
    
    func returnKeyButton() {
        app.buttons["return"].tap()
    }
    
    func typeSearchList(id: String, time: Int, list: [String]) {
        var input: String?
        app.textFields[id].tap()
        for _ in 0..<time {
            let i = Int.random(in: 0 ..< 10)
            input = list[i].components(separatedBy: " - ").first
            waiting(time: 1)
            app.textFields[id].typeText(input ?? "")
            app.textFields[id].clearAndEnterText(text: list[i])
        }
        app.textFields[id].typeText(input ?? "")
        returnKeyButton()
    }
    
    func typeTextField(id: String, text: String) {
        app.textFields[id].tap()
        app.textFields[id].typeText(text)
        returnKeyButton()
    }
    
    func typeTextView(id: String, text: String) {
        app.textViews[id].tap()
        app.textViews[id].typeText(text)
        returnKeyButton()
    }
    
    func adjustingASlider(value: CGFloat) {
        app.sliders.element.adjust(toNormalizedSliderPosition: value)
    }

}

//
//  SimpleTestUITestCase.swift
//  SimpleTestUITests
//
//  Created by IRFAN TRIHANDOKO on 03/07/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import XCTest

extension SimpleTestUITests {
    
    
    func doSearch() {
        scroll(time: 1)
        let list = ["Mirazur Dining Room - Menton, France", "Noma - Copenhgagen, Denmark", "Asador Etxebarri - Atxondo, Spain", "Gaggan - Bangkok, Thailand", "Geranium - Copenhagen, Denmark", "Central - Lima, Peru", "Mugaritz - San Sebastian, Spain", "Arpège - Paris, France", "Disfrutar - Barcelona, Spain", "Maido - Lima, Peru"].sorted(by: {$0 < $1})
        typeSearchList(id: "searchField", time: 3, list: list)
    }
    
    func getDetail() {
        tap()
        dismissAlert(title: "Open the Restaurant", button: "Open")
        swipeCollection(id: "collectionView", time: 1, isTopDown: false)
        scroll(time: 1)
    }
    
    func doWrite() {
        tapButton(id: "Write")
        tapButton(id: "Send")
        waiting(time: 1)
        dismissAlert(title: "Ojo kesusu!", button: "Close")
        adjustingASlider(value: 0.9)
        adjustingASlider(value: 0.3)
        adjustingASlider(value: 0.8)
        typeTextField(id: "titleField", text: "Good Service")
        typeTextView(id: "reviewField", text: "I ate it this place all the time. It's always very clean and the help there are very friendly.")
        scroll(time: 1)
        tapButton(id: "Send")
    }
    
    func testFull() {
        launch()
        doSearch()
        getDetail()
        doWrite()
    }
    
}

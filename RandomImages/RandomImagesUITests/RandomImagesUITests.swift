//
//  TransactionsUITest.swift
//  evcashUITests
//
//  Created by Kaique de Souza Monteiro on 21/07/19.
//  Copyright © 2019 Kaique de Souza Monteiro. All rights reserved.
//

import XCTest

@available(iOS 9.0, *)
class TransactionsUITest: XCTestCase {

    /// Aplicação
    var app: XCUIApplication!

    /// Mock das chamadas ao servidor
    let dynamicStubs = HTTPDynamicStubs()

    /// Rotina executada antes de cada caso de teste
    override func setUp() {
        super.setUp()
        dynamicStubs.setUp()
        app = XCUIApplication()
        setupTests(app: app)
    }

    /// Rotina executada após o fim de cada teste
    override func tearDown() {
        super.tearDown()
        Springboard.deleteMyApp()
        dynamicStubs.tearDown()
    }

    
    /// Realiza a verificação dos itens da tela de detalhes da venda
    fileprivate func assertAuthor() {
        XCTAssert(app.staticTexts["Adam Willoughby-Knox"].exists)
        XCTAssert(app.staticTexts["William Hook"].exists)
        XCTAssert(app.staticTexts["Christopher Campbell"].exists)
        XCTAssert(app.staticTexts["Andrew Ridley"].exists)
        XCTAssert(app.staticTexts["Frances Gunn"].exists)
    }
    
    /// Inicia a aplicação e navega até a tela de transações
    func testTransactionsScreen() {
        wait(forElement: app.staticTexts["Adam Willoughby-Knox"])
        assertAuthor()
    }
}

//
//  UITesteExtension.swift
//  evcashUITests
//
//  Created by Kaique de Souza Monteiro on 21/07/19.
//  Copyright © 2019 Kaique de Souza Monteiro. All rights reserved.
//

import Foundation
import XCTest

/// Extensão para facilitar a chamada de rotinas que são comuns a testes
extension XCTestCase {

    /// Aguarda um elemento aparecer na tela
    /// - Parameters:
    ///     - forElement: elemento que será verificado
    func wait(forElement: Any?) {
        let predicate = NSPredicate(format: "exists == 1")
        self.expectation(for: predicate, evaluatedWith: forElement, handler: nil)
        self.waitForExpectations(timeout: 10, handler: nil)
    }

    /// Setup padrão para os testes de UI
    /// - Parameters:
    ///     - app: aplicação testada
    ///     - dynamicStubs: servidor mock que responderá as requisições
    func setupTests(app: XCUIApplication) {
        app.launchEnvironment = ["UITEST_DISABLE_ANIMATIONS" : "YES"]
        app.launch()
        continueAfterFailure = false
        XCUIDevice.shared.orientation = .portrait
    }

}

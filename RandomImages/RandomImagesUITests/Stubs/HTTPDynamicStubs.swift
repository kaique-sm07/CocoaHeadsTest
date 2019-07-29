//
//  HTTPDynamicStubs.swift
//  evcashUITests
//
//  Created by Kaique de Souza Monteiro on 21/07/19.
//  Copyright © 2019 Kaique de Souza Monteiro. All rights reserved.
//

import Foundation
import Swifter

enum HTTPMethod {
    case POST
    case GET
}

/// Classe responsavel por criar um mock do servidor para os testes de integração
class HTTPDynamicStubs {

    /// Servidor mock
    var server = HttpServer()

    /// Inicia o servidor mock
    func setUp() {
        try! server.start()
    }

    /// Finaliza o servidor mock
    func tearDown() {
        server.stop()
    }

    /// Mapeia uma url para responder um json fixo
    /// - Parameters:
    ///     - url: url mapeada
    ///     - filename: nome do arquivo que contém a resposta da requisição
    ///     - method: método, que pode ser GET ou POST
    public func setupStub(url: String, filename: String, method: HTTPMethod = .POST) {
        let testBundle = Bundle(for: type(of: self))
        let filePath = testBundle.path(forResource: filename, ofType: "json")
        let fileUrl = URL(fileURLWithPath: filePath!)
        let data = try! Data(contentsOf: fileUrl, options: .uncached)
        let json = dataToJSON(data: data)
        let response: ((HttpRequest) -> HttpResponse) = { _ in
            return HttpResponse.ok(.json(json as AnyObject))
        }
        switch method  {
        case .GET : server.GET[url] = response
        case .POST: server.POST[url] = response
        }
    }

    /// Função auxiliar que converte data para json
    func dataToJSON(data: Data) -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }
}

struct HTTPStubInfo {
    let url: String
    let jsonFilename: String
    let method: HTTPMethod
}


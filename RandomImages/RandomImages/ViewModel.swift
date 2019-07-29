//
//  ViewModel.swift
//  RandomImages
//
//  Created by Kaique de Souza Monteiro on 21/07/19.
//  Copyright © 2019 Kaique de Souza Monteiro. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ViewModel {

    var objects:[Image] = []
    func getImages(success: @escaping () -> Void) {
        let url = (Bundle.main.infoDictionary?["URL_BASE"] as? String)! + "api/test"
        let request = Alamofire.request(url, method: .get)
        request.responseJSON { response in
            let json = JSON(response.result.value)
            for (_,subJson):(String, JSON) in json {
                let image = Image(imageUrl: subJson["download_url"].stringValue,
                                  author: subJson["author"].stringValue)
                self.objects.append(image)
                print(subJson)

            }
            success()
        }

    }
}

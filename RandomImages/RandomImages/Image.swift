//
//  Image.swift
//  RandomImages
//
//  Created by Kaique de Souza Monteiro on 23/07/19.
//  Copyright © 2019 Kaique de Souza Monteiro. All rights reserved.
//

import Foundation

struct Image {
    var imageUrl: String?

    var author: String?

    init(imageUrl: String?, author: String?) {
        self.imageUrl = imageUrl
        self.author = author
    }

}

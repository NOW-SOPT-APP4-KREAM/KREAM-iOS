//
//  InfoModel.swift
//  KREAM
//
//  Created by 송여경 on 5/23/24.
//

import UIKit

struct InfoModel {
    let price: String
}

extension InfoModel {
    static func dummy() -> [InfoModel] {
        return [InfoModel(price: "129,000")]
    }
}

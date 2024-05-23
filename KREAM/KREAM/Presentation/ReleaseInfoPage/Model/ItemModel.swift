//
//  ItemModel.swift
//  KREAM
//
//  Created by 박신영 on 5/23/24.
//

import UIKit

struct ItemModel {
   let itemImg: UIImage
   let brandTitle: String
   let engTitle: String
   var isScrap: Bool
   var isUpdate: Bool
   var isNew: Bool
}

extension ItemModel {
   static func dummy() -> [ItemModel] {
      return [
         ItemModel(
            itemImg: UIImage(resource: .icnShop),
            brandTitle: "Adidas",
            engTitle: "Adidas Samba OG Cloud White",
            isScrap: false,
            isUpdate: false,
            isNew: true
         ),
         ItemModel(
            itemImg: UIImage(resource: .icnShop),
            brandTitle: "Adidas",
            engTitle: "Adidas Samba OG Black White Gum",
            isScrap: true,
            isUpdate: true,
            isNew: false
         ),
         ItemModel(itemImg: UIImage(resource: .icnShop),
            brandTitle: "Adidas",
            engTitle: "Adidas Samba OG Cloud White",
            isScrap: false,
            isUpdate: false,
            isNew: true
         ),
         ItemModel(itemImg: UIImage(resource: .icnShop),
            brandTitle: "Adidas",
            engTitle: "Adidas Samba OG Black White Gum",
            isScrap: false,
            isUpdate: false,
            isNew: true
         ),
         ItemModel(
            itemImg: UIImage(resource: .icnShop),
            brandTitle: "Adidas",
            engTitle: "Adidas Samba OG Cloud White",
            isScrap: false,
            isUpdate: false,
            isNew: true
         ),
         ItemModel(
            itemImg: UIImage(resource: .icnShop),
            brandTitle: "Adidas",
            engTitle: "Adidas Samba OG Black White Gum",
            isScrap: false,
            isUpdate: false,
            isNew: true
         ),
         ItemModel(
            itemImg: UIImage(resource: .icnShop),
            brandTitle: "Adidas",
            engTitle: "Adidas Samba OG Cloud White",
            isScrap: false,
            isUpdate: false,
            isNew: true
         ),
         ItemModel(
            itemImg: UIImage(resource: .icnShop),
            brandTitle: "Adidas",
            engTitle: "Adidas Samba OG Black White Gum",
            isScrap: false,
            isUpdate: false,
            isNew: true
         ),
         ItemModel(
            itemImg: UIImage(resource: .icnShop),
            brandTitle: "Adidas",
            engTitle: "Adidas Samba OG Cloud White",
            isScrap: false,
            isUpdate: false,
            isNew: true
         ),
         ItemModel(
            itemImg: UIImage(resource: .icnShop),
            brandTitle: "Adidas",
            engTitle: "Adidas Samba OG Black White Gum",
            isScrap: false,
            isUpdate: false,
            isNew: true
         ),
         ItemModel(
            itemImg: UIImage(resource: .icnShop),
            brandTitle: "Adidas",
            engTitle: "Adidas Samba OG Cloud White",
            isScrap: false,
            isUpdate: false,
            isNew: true
         ),
         ItemModel(
            itemImg: UIImage(resource: .icnShop),
            brandTitle: "Adidas",
            engTitle: "Adidas Samba OG Black White Gum",
            isScrap: false,
            isUpdate: false,
            isNew: true
         )
      ]
   }
}

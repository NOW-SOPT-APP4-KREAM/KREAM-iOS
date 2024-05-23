//
//  KreamTargetType.swift
//  KREAM
//
//  Created by 박민서 on 5/24/24.
//

import Foundation
import Moya

enum KreamTargetType {
    case getProducts(query: String)
    case getProductDetail(memberId: Int, productId: Int)
    case getProductReleaseInfo(memberId: Int)
    case getRecommendedProducts(memberId: Int)
    case postScrap(memberId: Int, productId: Int)
    case deleteScrap(memberId: Int, productId: Int)
}

extension KreamTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
       switch self {
       case .getProducts:
           return "/product"
       case .getProductDetail(_, let productId):
           return "/product/\(productId)"
       case .getProductReleaseInfo:
           return "/product/release"
       case .getRecommendedProducts:
           return "/product/recommend"
       case .postScrap:
           return "/scrap"
       case .deleteScrap:
           return "/scrap"
       }
    }
    
    var method: Moya.Method {
       switch self {
       case .getProducts, .getProductDetail, .getProductReleaseInfo, .getRecommendedProducts:
           return .get
       case .postScrap:
           return .post
       case .deleteScrap:
           return .delete
       }
    }
    
    var task: Moya.Task {
        switch self {
        case .getProducts(query: let query):
            return .requestParameters(parameters: ["findName": query], encoding: URLEncoding.default)
        case .postScrap(memberId: let memberId, productId: let productId):
            return .requestJSONEncodable(ScrapRequestBody(productID: productId))
        case .deleteScrap(memberId: let memberId, productId: let productId):
            return .requestJSONEncodable(ScrapRequestBody(productID: productId))
        default:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getProducts(query: let query):
            return .none
        case 
            .postScrap(memberId: let memberId, _),
            .deleteScrap(memberId: let memberId, _),
            .getRecommendedProducts(memberId: let memberId),
            .getProductReleaseInfo(memberId: let memberId),
            .getProductDetail(memberId: let memberId, _):
            return ["memberId": "\(memberId)"]
        }
    }
}

//
//  BaseTargetType.swift
//  KREAM
//
//  Created by 박신영 on 5/21/24.
//

import Foundation
import Moya

enum BaseTargetType: TargetType {
   
}

extension BaseTargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
       switch self {
       }
    }
    
    var method: Moya.Method {
       switch self {
       }
    }
    
    var requestBody: [String: Any]? {
       switch self {
       }
    }
    
    var task: Moya.Task {
        switch self {
        }
    }
    
    var headers: [String: String]? {
        switch self {
        }
        
    }
}

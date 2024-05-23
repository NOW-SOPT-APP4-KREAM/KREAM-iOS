//
//  APIService.swift
//  KREAM
//
//  Created by 박민서 on 5/24/24.
//

import Foundation
import Moya
import os

final class APIService<Provider: TargetType>: MoyaProvider<Provider> {
    
    /// ErrorHandler에서 사용하는 Logger입니다.
    /// Error를 특정 타입의 로그로 남기는데 사용됩니다.
    private let logger = Logger(
            subsystem: Bundle.main.bundleIdentifier!,
            category: String(describing: APIService.self))
    
    func sendRequest<Model: Decodable> (target: Provider, instance: Model.Type, completion: @escaping(Result<Model, MoyaError>) -> Void) {
        self.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let stringData = String(data: response.data, encoding: .utf8) ?? "" // Data를 String으로 변환 - 디버깅
                    print("-----\(stringData)------")
                    try self.validateStatusCode(with: response)
                    let decodedData = try JSONDecoder().decode(Model.self, from: response.data)
                    completion(.success(decodedData))
                } catch let error as MoyaError {
                    completion(.failure(error)) // status validating에서 발생한 에러가 빠집니다
                } catch {
                    completion(.failure(.underlying(error, response))) // 디코딩 에러는 여기로 빠집니다
                }
               
            case .failure(let error):
                completion(.failure(error))
                self.logger.error("\(error.localizedDescription)")
            }
        }
    }
    
    private func validateStatusCode(with response: Response) throws {
        switch response.statusCode {
        case 200..<300:
            return
        case 400...500:
            throw MoyaError.statusCode(response)
        default:
            throw MoyaError.underlying(URLError(.networkConnectionLost), response)
        }
    }
}

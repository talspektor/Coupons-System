//
//  ResponseHandler.swift
//  Coupons
//
//  Created by Tal talspektor on 03/02/2021.
//

import Foundation

struct ResponseHandler {
    static func handle(_ responseItem: NetworkResponseItem, completion: (Result<Bool, Error>) -> Void) {
        guard responseItem.error == nil else {
            completion(.failure(responseItem.error!))
            return
        }
        guard let response = responseItem.response as? HTTPURLResponse else {
            completion(.failure(responseItem.error!))
            return
        }
        
        let result = NetworkResponseHandler.handleNetworkResponse(response)
        switch result {
        case .success:
            completion(.success(true))
        case .failure(let nenworkFailureError):
            completion(.failure(nenworkFailureError))
        }
    }
    
    static func handleWithDecoding<T: Decodable>(_ type: T.Type, _ responseItem: NetworkResponseItem, completion: (Result<T, Error>) -> Void) {
        guard responseItem.error == nil else {
            debugPrint("\n<<<<< Error: \(responseItem.error!)\n")
            completion(.failure(responseItem.error!))
            return
        }
        guard let response = responseItem.response as? HTTPURLResponse else {
            debugPrint("\n<<<<< Error: \(responseItem.error!)\n")
            completion(.failure(responseItem.error!))
            return
        }
        let result = NetworkResponseHandler.handleNetworkResponse(response)
        guard let responseData = responseItem.data else {
            completion(.failure(NetworkError.nissingData))
            return
        }
        switch result {
        case .success:
            do {
                let apiResponse = try JSONDecoder().decode(with: T.self, from: responseData)
                debugPrint("\n<<<<< Response JSON: \(apiResponse)\n")
                completion(.success(apiResponse))
            } catch {
                debugPrint(error)
                completion(.failure(error))
            }
        case .failure(let error):
            do {
                let apiResponse = try JSONDecoder().decode(with: ResponseErrorModel.self, from: responseData)
                debugPrint("\n<<<<< Response JSON: \(apiResponse) \(error)\n")
                completion(.failure(HTTPError.httpError(apiResponse)))
            } catch {
                debugPrint(error)
                completion(.failure(error))
            }
        }
    }
}

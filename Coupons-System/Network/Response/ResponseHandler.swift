//
//  ResponseHandler.swift
//  Coupons
//
//  Created by Tal talspektor on 03/02/2021.
//

import Foundation
import Combine

struct ResponseHandler {
    
    static func handleWithDecoding<T: Decodable>(_ type: T.Type, _ responseItem: NetworkResponseItem) -> Result<T, Error> {
        
        guard let response = responseItem.response as? HTTPURLResponse else {
            debugPrint("\n<<<<< Error: \(responseItem.error!)\n")
            return .failure(responseItem.error!)
        }
        let result = NetworkResponseHandler.handleNetworkResponse(response)
        guard let responseData = responseItem.data else {
            return .failure(NetworkError.nissingData)
        }
        switch result {
        case .success:
            do {
                let decodedItem = try JSONDecoder().decode(with: T.self, from: responseItem.data!)
                debugPrint("\n<<<<< Response JSON: \(decodedItem)\n")
                return .success(decodedItem)
            } catch {
                debugPrint(error)
                return .failure(error)
            }
        case .failure(let error):
            do {
                let apiResponse = try JSONDecoder().decode(with: ResponseErrorModel.self, from: responseData)
                debugPrint("\n<<<<< Response JSON: \(apiResponse) \(error)\n")
                return .failure(HTTPError.httpError(apiResponse))
            } catch {
                debugPrint(error)
                return .failure(error)
            }
        }
    }
}

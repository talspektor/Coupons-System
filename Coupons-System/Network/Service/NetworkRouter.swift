//
//  NetworkRouter.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation
import Combine

struct NetworkResponseItem {
    let data: Data?
    let response: URLResponse?
    let error: Error?
}
typealias NetworkRouterCompletion = (_ responseItem: NetworkResponseItem) -> Void
protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request<T: Decodable>(_ route: EndPoint, type: T.Type) throws -> URLSession.DataTaskPublisher
    func cansel()
}

//
//  Router.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation
import Combine

//extension Publisher {
//    func asFuture() -> Future<Output, Failure> {
//        return Future { promise in
//            var ticket: AnyCancellable? = nil
//            ticket = self.sink(
//                receiveCompletion: {
//                    ticket?.cancel()
//                    ticket = nil
//                    switch $0 {
//                    case .failure(let error):
//                        promise(.failure(error))
//                    case .finished:
//                        promise(.success(Output($0)))
//                    }
//            },
//                receiveValue: {
//                    ticket?.cancel()
//                    ticket = nil
//                    promise(.success($0))
//            })
//        }
//    }
//}

struct Response<T> { // 1
    let value: T
    let response: URLResponse
}

class Router<EndPoint: EndPointType>: NetworkRouter {

    private var task: URLSessionTask?
    private var cancelables = Set<AnyCancellable>()
    
    func request<T: Decodable>(_ route: EndPoint, type: T.Type) throws -> URLSession.DataTaskPublisher {
//        do {
            let request = self.buildRequest(from: route)
        switch request {
        case .success(let urlRequest):
            return URLSession.DataTaskPublisher(request: urlRequest, session: .shared)
        case .failure(let error):
            throw error
        }
//            return URLSession.DataTaskPublisher(request: request, session: .shared)
//                .map({ (data, response) -> (Data, URLResponse) in
//                    print(">>>>> URL: \(String(describing: response.url))")
//                    print(">>>>> REQUEST BODY \(String(describing: request.httpBody))")
//                    print(">>>>> REQUEST Method \(String(describing: request.httpMethod))")
//                    print(">>>>> REQUEST HEADERS \(String(describing: request.allHTTPHeaderFields))")
//                    let networkResponseItem = NetworkResponseItem(data: data, response: response, error: nil)
//                    let result = ResponseHandler.handleWithDecoding(T.self, networkResponseItem)
//                    switch result {
//                    case .success(let response):
//                        debugPrint(response)
//                    case .failure(let error):
//                        debugPrint(error)
//                    }
//                    return (data, response)
//                })
//                .mapError { (error) -> Error in
//                    print(">>>>> Error: \(String(describing: error))")
//                    return error
//                }
//            .eraseToAnyPublisher()
//            .asFuture()
//        } catch {
//            debugPrint(">>>>> Error: \(String(describing: error))")
//            throw error
//        }
    }
    
    func cansel() {
        self.task?.cancel()
    }
    
    private func buildRequest(from route: EndPoint) -> Result<URLRequest, Error> {
        
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParametest(let bodyParameters, let urlParameters):

                try self.configurePrameters(bodyParameters: bodyParameters,
                                            urlParameters: urlParameters,
                                            request: &request)
            case .requestParametersAnyHeaders(let bodyParameters, let urlParameters, let additionalHeaders):

                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configurePrameters(bodyParameters: bodyParameters,
                                            urlParameters: urlParameters,
                                            request: &request)
            }
            return .success(request)
        } catch {
            return .failure(error)
        }
    }

    private func configurePrameters(bodyParameters: Parameters?, urlParameters: QueryParams?, request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encoder(urlRequest: &request, with: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encoder(urlRequest: &request, with: urlParameters)
            }
        } catch {
            throw error
        }
    }
    
    private func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}

//
//  Router.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation
import Combine

struct Response<T> { // 1
    let value: T
    let response: URLResponse
}

class Router<EndPoint: EndPointType>: NetworkRouter {

    private var task: URLSessionTask?
    private var cancelables = Set<AnyCancellable>()
    
    func request<T: Decodable>(_ route: EndPoint, type: T.Type) -> AnyPublisher<T, Error> {
        let request = self.buildRequest(from: route)
        switch request {
        case .success(let urlRequest):
            debugPrint(">>>>> URL: \(String(describing: urlRequest.url))")
            debugPrint(">>>>> REQUEST BODY \(String(describing: urlRequest.httpBody))")
            debugPrint(">>>>> REQUEST Method \(String(describing: urlRequest.httpMethod))")
            debugPrint(">>>>> REQUEST HEADERS \(String(describing: urlRequest.allHTTPHeaderFields))")
            
            return URLSession.DataTaskPublisher(request: urlRequest, session: .shared)
//                .tryMap {
//                    print(">>>>> URL: \(String(describing: $0.response.url))")
//                    let networkResponseItem = NetworkResponseItem(data: $0.data, response: $0.response, error: nil)
//                    let result = ResponseHandler.handleWithDecoding(T.self, networkResponseItem)
//                    switch result {
//                    case .success(let response):
//                        debugPrint(response)
//                    case .failure(let error):
//                        debugPrint(error)
//                    }
//                    return $0.data
//            }
//            .map({ data, response in
//                let networkResponseItem = NetworkResponseItem(data: data, response: response, error: nil)
//                ResponseHandler.handleWithDecoding(T.self, networkResponseItem)
//                return data
                //            })
                .map(\.data)
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { error in
                    return error
            }
                //            .receive(on: queue)
                //            .retry(retries)
            .eraseToAnyPublisher()
        case .failure(let error):
            return AnyPublisher(Fail(error: error))
        }
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

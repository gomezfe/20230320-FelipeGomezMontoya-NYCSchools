//
//  RetryInterceptor.swift
//  20230320-FelipeGomezMontoya-NYCSchools
//
//  Created by Felipe Gomez on 3/20/23.
//

import Foundation
import Alamofire

class RetryInterceptor: RequestInterceptor {
    
    static let maxAttempts = 5
    var attemptCount = 0
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        completion(.success(urlRequest))
    }

    public func retry(_ request: Request,
                      for session: Session,
                      dueTo error: Error,
                      completion: @escaping (RetryResult) -> Void) {
        
        guard attemptCount < Self.maxAttempts else {
            completion(.doNotRetry)
            return
        }
        
        guard error._code != NSURLErrorTimedOut else {
            print("Request timed out, retrying in 2.0 seconds.")
            completion(.retryWithDelay(2.0))
            return
        }
        
        guard let response = request.task?.response as? HTTPURLResponse else {
            print("Not an HTTPURLResponse, not retrying.")
            completion(.doNotRetry)
            return
        }
        
        guard response.statusCode == 404 || response.statusCode == 503 else {
            print("Status code \(response.statusCode) is not retriable.")
            completion(.doNotRetry)
            return
        }
        
        completion(.retryWithDelay(2.0))
    }
}

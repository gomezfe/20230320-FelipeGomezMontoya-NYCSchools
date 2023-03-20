//
//  NetworkController.swift
//  20230320-FelipeGomezMontoya-NYCSchools
//
//  Created by Felipe Gomez on 3/20/23.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case badURL
    case badData
    case badParse
    case wrapped(Error)
}

protocol NetworkControllerRepresenting {
    func downloadSchools(completion: @escaping (Result<[NYCSchool], NetworkError>) -> Void)
    func downloadTestScores(completion: @escaping (Result<[NYCTestScore], NetworkError>) -> Void)
}

class NetworkController: NetworkControllerRepresenting {
    
    lazy var session: Session = {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.timeoutIntervalForRequest = 20.0
        return Session(configuration: configuration)
    }()
    
    private lazy var decoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
    
    func downloadSchools(completion: @escaping (Result<[NYCSchool], NetworkError>) -> Void) {
        let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        download(urlString: urlString,
                 type: NYCSchool.self,
                 completion: completion)
    }
    
    func downloadTestScores(completion: @escaping (Result<[NYCTestScore], NetworkError>) -> Void) {
        let urlString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
        download(urlString: urlString,
                 type: NYCTestScore.self,
                 completion: completion)
    }
    
    private func download<Model>(urlString: String, type: Model.Type, completion: @escaping (Result<[Model], NetworkError>) -> Void) where Model: Decodable {
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                completion(.failure(NetworkError.badURL))
            }
            return
        }
        
        session
            .download(url, interceptor: RetryInterceptor())
            .downloadProgress { progress in
                print("download progress = \(progress)")
            }
            .responseDecodable(of: [Model].self, decoder: decoder) { a in
                switch a.result {
                case .success(let array):
                    DispatchQueue.main.async {
                        completion(.success(array))
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        print("error: \(error)")
                        completion(.failure(.wrapped(error)))
                    }
                }
            }
    }
    
}

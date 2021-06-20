//
//  Request.swift
//  qdha
//
//  Created by 10 on 5/14/20.
//  Copyright © 2020 com.kamal. All rights reserved.
//

import Foundation
import Alamofire
import fancyloader

enum Result<T> {
    case success(T,String)
    case failure(Error)
}
enum Upload<T> {
    case success(T)
    case failure(Error)
}

class Network {
    
    func request<T: Codable>(_ request: mainModel, decodeToType type: T.Type, completionHandler: @escaping (Result<T>, _: Error?) -> ()) {
        Loader.shared.showLoader("logoIcon", UIColor(red:0.11, green:0.21, blue:0.34, alpha:0.7))
        Alamofire.request(request.path, method: request.method, parameters: request.parameters, encoding: request.encoding, headers: request.headers).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    if response.response?.statusCode ?? 0 > 199 && response.response?.statusCode ?? 0 < 301 {
                        completionHandler(.success(decoded, "success"),nil)
                    }else{
                        completionHandler(.success(decoded,"failure"),nil)
                    }
                } catch {
                    completionHandler(.failure(error),nil)
                }
            case .failure(let error):
                completionHandler(.failure(error), error)
            }
            Loader.shared.hideLoader()
        }
    }
    func request<T: Codable>(_ request: mainModel,_ loading: Bool, decodeToType type: T.Type, completionHandler: @escaping (Result<T>, _: Error?) -> ()) {
        if loading {
            Loader.shared.showLoader("logoIcon", UIColor(red:0.1, green:0.1, blue:0.1, alpha:0.1))
        }
        Alamofire.request(request.path, method: request.method, parameters: request.parameters, encoding: request.encoding, headers: request.headers).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    if response.response?.statusCode ?? 0 > 199 && response.response?.statusCode ?? 0 < 301 {
                        completionHandler(.success(decoded, "success"),nil)
                    }else{
                        completionHandler(.success(decoded,"failure"),nil)
                    }
                } catch {
                    completionHandler(.failure(error),nil)
                }
            case .failure(let error):
                completionHandler(.failure(error), error)
            }
            Loader.shared.hideLoader()
        }
    }
    func upload<T: Codable>(_ request: mainModel, decodeToType type: T.Type, completionHandler: @escaping (Upload<T>, _: Error?) -> ()){
        Loader.shared.showLoader("logoIcon", UIColor(red:0.11, green:0.21, blue:0.34, alpha:0.7))
        Alamofire.upload(multipartFormData: { encode in
            
            request.images.forEach { // images encoded ...
                if let data = $1.jpegData(compressionQuality: 1.0) {
                    encode.append(data, withName: "image", fileName: "image.png", mimeType: "image/png")
                }
            }
            request.parameters.forEach {
                if let value = $1 as? String, let data = value.data(using: .utf8) {
                    encode.append( data , withName: $0)
                }
            }
            
        }, to: request.path) { result in
            switch result {
            case .success(let response, _, _) :
                response.responseData { response in
                    switch response.result {
                    case .success(let data):
                        print(data)
                        do {
                            let decoded = try JSONDecoder().decode(T.self, from: data)
                            completionHandler(.success(decoded), nil)
                        } catch {
                            completionHandler(.failure(error), nil)
                        }
                    case .failure(let error):
                        completionHandler(.failure(error), nil)
                    }
                    
                }
                break
            case .failure(let error) :
                completionHandler(.failure(error), error)
                break
            }
            Loader.shared.hideLoader()
        }
    }
}

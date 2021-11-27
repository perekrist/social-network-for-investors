//
//  NetworkService.swift
//  Investment
//

import Foundation
import Alamofire

struct AuthResult: Decodable {
  var message: String?
  var status: Bool?
  var token: String?
  var user_id: Int?
}

class NetworkService {
  static let baseURL = "http://invest.somnoynadno.ru/api/"
  
  func baseRequest<T: Decodable>(url: String, method: HTTPMethod, completion: @escaping ((T) -> Void)) {
    AF.request(NetworkService.baseURL + url, method: method).responseData { response in
      switch response.result {
      case .success(let data):
        let decoder = JSONDecoder()
        do {
          let decodedData = try decoder.decode(T.self, from: data)
          completion(decodedData)
        } catch (let error) {
          BannerShowing.shared.showErrorBanner("catch:" + error.localizedDescription)
        }
      case .failure(let error):
        BannerShowing.shared.showErrorBanner(error.localizedDescription)
      }
    }
  }
  
  func baseRequest<T: Decodable>(request: URLRequest, completion: @escaping ((T) -> Void)) {
    AF.request(request).responseData { response in
      switch response.result {
      case .success(let data):
        let decoder = JSONDecoder()
        do {
          let decodedData = try decoder.decode(T.self, from: data)
          completion(decodedData)
        } catch (let error) {
          BannerShowing.shared.showErrorBanner("catch:" + error.localizedDescription)
        }
      case .failure(let error):
        BannerShowing.shared.showErrorBanner(error.localizedDescription)
      }
    }
  }
  
  func loginRequest(email: String, password: String, completion: @escaping ((AuthResult) -> Void)) {
    //baseRequest(url: "auth/login", method: .post) { result in
    guard let url = URL(string: NetworkService.baseURL + "auth/login") else {
      return
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    
    let parameterDictionary = ["email" : email,
                               "password" : password] as [String : Any]
    
    urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
    
    
    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
      return
    }
    urlRequest.httpBody = httpBody
    
    self.baseRequest(request: urlRequest) { (result: AuthResult) in
      completion(result)
    }
  }
  
  func registerRequest(email: String, password: String, name: String, surname: String, nickname: String, completion: @escaping ((AuthResult) -> Void)) {
    //baseRequest(url: "auth/login", method: .post) { result in
    guard let url = URL(string: NetworkService.baseURL + "auth/register") else {
      return
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    
    let parameterDictionary = ["email" : email,
                               "password" : password,
                               "name" : name,
                               "surname" : surname,
                               "username" : nickname
    ] as [String : Any]
    
    urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
    
    
    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
      return
    }
    urlRequest.httpBody = httpBody
    
    self.baseRequest(request: urlRequest) { (result: AuthResult) in
      completion(result)
    }
    
  }
  
}

//
//  NetworkService.swift
//  Investment
//

import Foundation
import Alamofire

extension NetworkService {
  func sendThreadComment(text: String, authorID: Int = 1, commentID: Int, completion: @escaping ((Comment) -> ())) {
    let params: Parameters = ["text": text,
                              "authorID": authorID,
                              "commentID": commentID]
    baseRequest(url: "/thread_comment", method: .post, params: params) { comment in
      completion(comment)
    }
  }
  
  func sendComment(text: String, authorID: Int = 1, blogPostID: Int, completion: @escaping ((Comment) -> ())) {
    let params: Parameters = ["text": text,
                              "authorID": authorID,
                              "blogPostID": blogPostID]
    baseRequest(url: "/comment", method: .post, params: params) { comment in
      completion(comment)
    }
  }
  
  func getPost(id: Int, completion: @escaping ((Post) -> ())) {
    baseRequest(url: "/blog_post/\(id)", method: .get) { post in
      completion(post)
    }
  }
  
  func getPosts(completion: @escaping ([Post]) -> ()) {
    baseRequest(url: "/blog_post?_start=0&_end=-1", method: .get) { posts in
      completion(posts)
    }
  }
}

struct AuthResult: Decodable {
  var message: String?
  var status: Bool?
  var token: String?
  var user_id: Int?
}

class NetworkService {
  static let baseURL = "http://invest.somnoynadno.ru/api/v1"
  
  func baseRequest<T: Decodable>(url: String, method: HTTPMethod, params: Parameters? = nil,
                                 completion: @escaping ((T) -> Void)) {
    AF.request(NetworkService.baseURL + url, method: method, parameters: params,
               encoding: JSONEncoding.default).responseData { response in
      print(response.request)
      print(response.request?.httpBody)
      
      switch response.result {
      case .success(let data):
        let decoder = JSONDecoder()
        do {
          let decodedData = try decoder.decode(T.self, from: data)
          completion(decodedData)
        } catch (let error) {
          print(String(describing: error))
          BannerShowing.shared.showErrorBanner("catch:" + error.localizedDescription)
        }
      case .failure(let error):
        print(String(describing: error))
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

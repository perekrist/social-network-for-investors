//
//  NetworkService.swift
//  Investment
//

import Foundation
import Alamofire

extension NetworkService {
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

class NetworkService {
  static let baseURL = "http://invest.somnoynadno.ru/api/v1"
  
  func baseRequest<T: Decodable>(url: String, method: HTTPMethod, params: Parameters? = nil,
                                 completion: @escaping ((T) -> Void)) {
    AF.request(NetworkService.baseURL + url, method: method, parameters: params).responseData { response in
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
}

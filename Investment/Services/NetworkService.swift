//
//  NetworkService.swift
//  Investment
//

import Foundation
import Alamofire

class NetworkService {
  static let baseURL = ""
  
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
}

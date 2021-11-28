//
//  NetworkService.swift
//  Investment
//

import Foundation
import Alamofire

class NetworkService {
  static let baseAuthURL = "http://invest.somnoynadno.ru/api"
  static let baseURL = NetworkService.baseAuthURL + "/v1"
  
  func baseRequest<T: Decodable>(isAuth: Bool = false, url: String, method: HTTPMethod, params: Parameters? = nil,
                                 encoding: ParameterEncoding = JSONEncoding.default,
                                 completion: @escaping ((T) -> Void)) {
    let baseURL = isAuth ? NetworkService.baseAuthURL : NetworkService.baseURL
    AF.request(baseURL + url, method: method, parameters: params,
               encoding:encoding).responseData { response in
      print(response.request)
      
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

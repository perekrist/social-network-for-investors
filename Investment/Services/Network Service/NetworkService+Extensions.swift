//
//  NetworkService+Extensions.swift
//  Investment
//

import Foundation
import Alamofire

// MARK: - Bot
extension NetworkService {
  func sendToBot(text: String, completion: @escaping (BotResponse) -> ()) {
    let params: Parameters = ["text": text]
    baseRequest(isAuth: true, url: "/bot/balaboba", method: .get, params: params, encoding: URLEncoding.default) { response in
      completion(response)
    }
  }
}


// MARK: - Profile
extension NetworkService {
  func getAuthor(id: Int, completion: @escaping (Author) -> ()) {
    baseRequest(url: "/user/\(id)", method: .get) { author in
      completion(author)
    }
  }
}

// MARK: - Instrument
extension NetworkService {
  func getInstruments(completion: @escaping ([Instrument]) -> ()) {
    baseRequest(url: "/financial_instrument?_start=0&_end=-1", method: .get) { instruments in
      completion(instruments)
    }
  }
  
  func getInstrument(id: Int, completion: @escaping (Instrument) -> ()) {
    baseRequest(url: "/financial_instrument/\(id)", method: .get) { instruments in
      completion(instruments)
    }
  }
}

// MARK: - Comments
extension NetworkService {
  func getComment(id: Int, completion: @escaping (Comment) -> ()) {
    baseRequest(url: "/comment/\(id)", method: .get) { comment in
      completion(comment)
    }
  }
  
  func sendThreadComment(text: String, authorID: Int, commentID: Int, completion: @escaping ((Comment) -> ())) {
    let params: Parameters = ["text": text,
                              "authorID": authorID,
                              "commentID": commentID]
    baseRequest(url: "/thread_comment", method: .post, params: params) { comment in
      completion(comment)
    }
  }
  
  func sendComment(text: String, authorID: Int, blogPostID: Int, completion: @escaping ((Comment) -> ())) {
    let params: Parameters = ["text": text,
                              "authorID": authorID,
                              "blogPostID": blogPostID]
    baseRequest(url: "/comment", method: .post, params: params) { comment in
      completion(comment)
    }
  }
}

// MARK: - Posts
extension NetworkService {
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
  
  func createPost(authorID: Int, text: String, instruments: [Int], completion: @escaping ((CreatedPost) -> ())) {
    
    var safeInstruments: [Parameters] = [[:]]
    for instrumentID in instruments {
      safeInstruments.append(["id": instrumentID])
    }
    let params: Parameters = ["text" : text,
                              "authorID" : authorID,
                              "instruments" : safeInstruments]
    baseRequest(url: "/blog_post", method: .post, params: params) { createdPost in
      completion(createdPost)
    }
  }
  
}

// MARK: - Auth
extension NetworkService {
  func login(email: String, password: String, completion: @escaping ((AuthResult) -> Void)) {
    let params: Parameters = ["email" : email,
                              "password" : password]
    baseRequest(isAuth: true, url: "/auth/login", method: .post, params: params) { response in
      completion(response)
    }
  }
  
  func register(email: String, password: String, name: String,
                surname: String, nickname: String, completion: @escaping ((AuthResult) -> Void)) {
    let params: Parameters = ["email" : email,
                              "password" : password,
                              "name" : name,
                              "surname" : surname,
                              "username" : nickname]
    baseRequest(isAuth: true, url: "/auth/register", method: .post, params: params) { response in
      completion(response)
    }
  }
}

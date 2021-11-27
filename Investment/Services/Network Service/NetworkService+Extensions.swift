//
//  NetworkService+Extensions.swift
//  Investment
//

import Foundation
import Alamofire

// MARK: - Comments
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

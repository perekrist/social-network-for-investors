//
//  Author.swift
//  Investment
//

import Foundation

struct Author: Codable, Identifiable {
  let id: Int
  let email: String
  let name: String
  let surname: String
  let isVerified: Bool
  let blogPosts: [Post]?
  let comments: [Comment]?
  
  var commentsCount: Int {
    return comments?.count ?? 0
  }
  
  var postsCount: Int {
    return blogPosts?.count ?? 0
  }
  
  init() {
    id = 0
    email = ""
    name = ""
    surname = ""
    isVerified = false
    blogPosts = nil
    comments = nil
  }
}

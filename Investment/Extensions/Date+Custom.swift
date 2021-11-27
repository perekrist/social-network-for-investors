//
//  Date+Custom.swift
//  Investment
//

import Foundation

private let yearFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "yyyy M d"
  return formatter
}()

private let timeFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "HH:mm"
  return formatter
}()

extension Date {
  func formatString(isShort: Bool = false) -> String {
    let date = Date()
    if Calendar.autoupdatingCurrent.isDateInYesterday(date) && isShort {
      return "Вчера"
    } else if Calendar.autoupdatingCurrent.isDateInToday(date) && isShort {
      return "Сегодня"
    } else {
      return timeFormatter.string(from: self)
    }
  }
  
  func fullFormatString() -> String {
    let date = Date()
    if Calendar.autoupdatingCurrent.isDateInToday(date) {
      return "Сегодня \(timeFormatter.string(from: self))"
    } else if Calendar.autoupdatingCurrent.isDateInYesterday(date) {
      return "Вчера \(timeFormatter.string(from: self))"
    } else {
      return timeFormatter.string(from: self)
    }
  }
}

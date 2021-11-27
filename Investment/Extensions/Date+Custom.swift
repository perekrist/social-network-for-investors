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
    let components = Calendar.current.dateComponents([.year, .month, .day], from: self, to: date)
    
    if (components.year! >= 1 || components.month! >= 1 || components.day! > 1) && isShort {
      return "\(yearFormatter.string(from: self)) \(timeFormatter.string(from: self))"
    } else if components.day == 1 && isShort {
      return "Вчера"
    } else if components.day == 0 && isShort {
      return "Сегодня"
    } else {
      return timeFormatter.string(from: self)
    }
  }
}

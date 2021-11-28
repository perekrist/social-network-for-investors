//
//  CustomAccessoryView.swift
//  Investment
//
//  Created by Daniil on 28.11.2021.
//

import SZMentionsSwift
import UIKit

struct InstrumentForMention: CreateMention {
  var name: String
  var id: Int
}


class CustomMentionsTableViewDataManager: NSObject {
  private let cellIdentifier = "Cell"
  private let listener: MentionListener
  var mentions: [InstrumentForMention] = []
  
  private var mentionsList: [InstrumentForMention] {
    guard !mentions.isEmpty, filterString != "" else { return mentions }
    return mentions.filter {
      $0.name.lowercased().contains(filterString.lowercased())
    }
  }
  
  private let tableView: UITableView
  private var filterString: String = ""
  
  init(mentionTableView: UITableView, mentionsListener: MentionListener) {
    tableView = mentionTableView
    tableView.register(
      UITableViewCell.self,
      forCellReuseIdentifier: cellIdentifier
    )
    listener = mentionsListener
    super.init()
    let service = NetworkService()
    service.getInstruments { instruments in
      for instrument in instruments {
        self.mentions.append(InstrumentForMention(name: instrument.name, id: instrument.id))
      }
    }
    
  }
  
  func filter(_ string: String) {
    filterString = string
    tableView.reloadData()
  }
}

extension CustomMentionsTableViewDataManager: UITableViewDelegate {
  func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
    listener.addMention(mentionsList[indexPath.row])
  }
}

extension CustomMentionsTableViewDataManager: UITableViewDataSource {
  func numberOfSections(in _: UITableView) -> Int {
    return 1
  }
  
  func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return mentionsList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else { return UITableViewCell() }
    cell.textLabel?.text = mentionsList[indexPath.row].name
    
    return cell
  }
}


class CustomAccessoryView: UIView {
  struct Attribute: AttributeContainer {
    var name: NSAttributedString.Key
    var value: Any
  }
  
  
  var textView: UITextView = UITextView()
  private let mentionsTableView = UITableView()
  private let mentionAttributes: [AttributeContainer] = [
    Attribute(
      name: .foregroundColor,
      value: UIColor.primary
    ),
    Attribute(
      name: .font,
      value: UIFont.bold(18)
    ),
    Attribute(
      name: .backgroundColor,
      value: UIColor.accent
    ),
  ]
  private let defaultAttributes: [AttributeContainer] = [
    Attribute(
      name: .foregroundColor,
      value: UIColor.black
    ),
    Attribute(
      name: .font,
      value: UIFont.regular(18)
    ),
    Attribute(
      name: .backgroundColor,
      value: UIColor.white
    ),
    
  ]
  var dataManager: CustomMentionsTableViewDataManager?
  var mentionListenerr: MentionListener?
  
  let fakeView = UITextView()
  func setup(delegate _: UITextViewDelegate) {
    autoresizingMask = .flexibleHeight
    fakeView.isSelectable = false
    fakeView.isEditable = false
    let mentionsListener = MentionListener(mentionsTextView: textView,
                                           mentionTextAttributes: { _ in self.mentionAttributes },
                                           defaultTextAttributes: defaultAttributes,
                                           spaceAfterMention: false,
                                           triggers: ["#"], hideMentions: hideMentions,
                                           didHandleMentionOnReturn: didHandleMentionOnReturn,
                                           showMentionsListWithString: showMentionsListWithString
                                        )
    mentionListenerr = mentionsListener
    textView.delegate = mentionsListener
    fakeView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(fakeView)
    addConstraintsToTextView(fakeView)
    
    //let mention = InstrumentForMention(name: "APPLE", id: 60)
    //mentionsListener.insertExistingMentions([(mention, NSRange(location: 5, length: 13))])
    
    dataManager = CustomMentionsTableViewDataManager(
      mentionTableView: mentionsTableView,
      mentionsListener: mentionsListener
    )
    
    setupTableView(mentionsTableView, dataManager: dataManager)
    backgroundColor = .gray
  }
  
  init(delegate: UITextViewDelegate) {
    super.init(frame: .zero)
    setup(delegate: delegate)
  }
  
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupTableView(_: UITableView, dataManager: CustomMentionsTableViewDataManager?) {
    mentionsTableView.translatesAutoresizingMaskIntoConstraints = false
    mentionsTableView.backgroundColor = .blue
    mentionsTableView.delegate = dataManager
    mentionsTableView.dataSource = dataManager
  }
  
      private func addConstraintsToTextView(_ textView: UITextView) {
          removeConstraints(constraints)
          addConstraints(
              NSLayoutConstraint.constraints(
                  withVisualFormat: "|-5-[fakeView]-5-|",
                  options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                  metrics: nil,
                  views: ["fakeView": fakeView]
              ) +
                  NSLayoutConstraint.constraints(
                      withVisualFormat: "V:|-5-[fakeView(30)]-5-|",
                      options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                      metrics: nil,
                      views: ["fakeView": fakeView]
                  )
          )
      }
  
  private func setupTextView(_ textView: UITextView, delegate: MentionListener) {
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.delegate = delegate
  }
  
  override var intrinsicContentSize: CGSize {
    return CGSize(width: frame.size.width, height: mentionsTableView.superview == nil ? 40 : 140)
  }
}

extension CustomAccessoryView {
  func hideMentions() {
    if mentionsTableView.superview != nil {
      mentionsTableView.removeFromSuperview()
      addConstraints(NSLayoutConstraint.constraints(
        withVisualFormat: "V:|-5-[fakeView(30)]-5-|",
        options: NSLayoutConstraint.FormatOptions(rawValue: 0),
        metrics: nil,
        views: ["fakeView": fakeView]
      )
      )
    }
    dataManager?.filter("")
  }
  
  func didHandleMentionOnReturn() -> Bool { return false }
  func showMentionsListWithString(mentionsString: String, trigger _: String) {
    if mentionsTableView.superview == nil {
      removeConstraints(constraints)
      addSubview(mentionsTableView)
      addConstraints(
        NSLayoutConstraint.constraints(
          withVisualFormat: "|-5-[tableview]-5-|",
          options: NSLayoutConstraint.FormatOptions(rawValue: 0),
          metrics: nil,
          views: ["tableview": mentionsTableView]
        ) +
        NSLayoutConstraint.constraints(
          withVisualFormat: "|-5-[fakeView]-5-|",
          options: NSLayoutConstraint.FormatOptions(rawValue: 0),
          metrics: nil,
          views: ["fakeView": fakeView]
        ) +
        NSLayoutConstraint.constraints(
          withVisualFormat: "V:|-5-[tableview(100)][fakeView(30)]-5-|",
          options: NSLayoutConstraint.FormatOptions(rawValue: 0),
          metrics: nil,
          views: ["fakeView": fakeView, "tableview": mentionsTableView]
        )
      )
    }
    
    dataManager?.filter(mentionsString)
  }
}

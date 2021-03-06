//
//  CreatePostViewController.swift
//  Investment
//
//  Created by Daniil on 28.11.2021.
//

import UIKit
import SZMentionsSwift

class CreatePostViewController: UIViewController, UITextViewDelegate {
  
  private var myInputAccessoryView: CustomAccessoryView!

  init(nibName: String, bundle: Bundle?) {
      super.init(nibName: nibName, bundle: bundle)
    myInputAccessoryView = CustomAccessoryView(delegate: self)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    myInputAccessoryView = CustomAccessoryView(delegate: self)
  }
  
  
  override var inputAccessoryView: UIView {
      return myInputAccessoryView
  }
  
  @IBAction func backButtonPressed() {
    self.navigationController?.popViewController(animated: true)
  }
  
  
  @IBOutlet weak var textView: UITextView!
  private let networkService = NetworkService()
  private let userDefaultsService = UserDefaultsService()
  
  private var instrumentsIDs: [Int] = []
  var onDidCreatePost: (() -> ())?
  
  @IBAction func createPostPressed() {
    var authorID = userDefaultsService.getUserID() ?? 1
    if authorID == 0 {
      authorID = 1
    }
    var instruments: [Int] = []
    var finalText = NSString(string: textView.text ?? "")
    
    if let safeArray = myInputAccessoryView.mentionListenerr?.mentions {
      for mention in safeArray {
        guard let temp = mention.object as? InstrumentForMention else { continue }
        instruments.append(temp.id)
        finalText = finalText.replacingOccurrences(of: temp.name, with:"#" + temp.name) as NSString
      }
    }
  


    print(finalText)
    
    networkService.createPost(authorID: authorID, text: finalText as String, instruments: instrumentsIDs) { result in
      print(result)
      if result.id != nil {
        BannerShowing().showInfoBanner("Success!")
        self.onDidCreatePost?()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textView.layer.cornerRadius = 5
    self.myInputAccessoryView.textView = self.textView
    myInputAccessoryView.setup(delegate: self)
    
    // Do any additional setup after loading the view.
  }
  
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      self.view.endEditing(true)
      return true
  }
  
}

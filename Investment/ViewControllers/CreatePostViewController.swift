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
  
  @IBAction func createPostPressed() {
    let authorID = userDefaultsService.getUserID() ?? 1
    var instruments: [Int] = []
    
    if let safeArray = myInputAccessoryView.mentionListenerr?.mentions {
      for mention in safeArray {
        guard let temp = mention.object as? InstrumentForMention else { continue }
        instruments.append(temp.id)
      }
    }
  


    print(instruments)
    
    networkService.createPost(authorID: authorID, text: textView.text, instruments: instrumentsIDs) { result in
      print(result)
      if result.id != nil {
        BannerShowing().showInfoBanner("Success!")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
          self.navigationController?.popViewController(animated: true)
        }
        
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

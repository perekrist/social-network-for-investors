//
//  CreatePostViewController.swift
//  Investment
//
//  Created by Daniil on 28.11.2021.
//

import UIKit

class CreatePostViewController: UIViewController {
  
  
  @IBAction func backButtonPressed() {
    self.navigationController?.popViewController(animated: true)
  }
  
  
  @IBOutlet weak var textView: UITextView!
  private let networkService = NetworkService()
  private let userDefaultsService = UserDefaultsService()
  
  private var instrumentsIDs: [Int] = []
  
  @IBAction func createPostPressed() {
    let authorID = userDefaultsService.getUserID() ?? 1
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
    // Do any additional setup after loading the view.
  }
  
  
  
  
}

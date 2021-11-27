//
//  SelfUserUpperInfoView.swift
//  Investment
//
//  Created by Daniil on 28.11.2021.
//

import UIKit

class UserUpperInfoView: UIView {
  @IBOutlet weak var profileDetailsView: ProfileDetailsView!
  
  @IBOutlet weak var userNicknameLabel: UILabel!
  
  @IBOutlet weak var userDescriptionLabel: UILabel!
  @IBOutlet weak var bellButton: UIButton!
  @IBOutlet weak var settingsButton: UIButton!
  
  @IBOutlet weak var subscribeButton: UIButton!
  
  func setup(isSelf: Bool) {
    if isSelf {
      subscribeButton.isHidden = true
    } else {
      bellButton.isHidden = true
      settingsButton.isHidden = true
    }
    
  }
 
  @IBAction func subscribeButtonPressed() {
  }
  
  @IBAction func settingsButtonPressed() {
  }
  
  @IBAction func bellButtonPressed() {
  }
  
  @IBAction func backButtonPressed() {
  }
  
  

}

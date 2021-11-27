//
//  ProfileDetailsView.swift
//  Investment
//

import UIKit
import SnapKit

class ProfileDetailsView: UIView {
  
  
  
  let containerView = UIView()
  let imageView = UIImageView()
  let fullNameLabel = UILabel()
  let redactButton = UIButton()
  let onlineLabel = UILabel()
  
  let subscribersTitleLabel = UILabel()
  let subscribersAmountLabel = UILabel()
  
  let subscriptionsTitleLabel = UILabel()
  let subscriptionsAmountLabel = UILabel()
  
  let likesTitleLabel = UILabel()
  let likesAmountLabel = UILabel()
  
  let separatorView1 = UIView()
  let separatorView2 = UIView()
  
  
  
  override func willMove(toSuperview newSuperview: UIView?) {
    super.willMove(toSuperview: newSuperview)
    let labels = [fullNameLabel,
                  onlineLabel,
                  subscribersTitleLabel,
                  subscribersAmountLabel,
                  subscriptionsTitleLabel,
                  subscriptionsAmountLabel,
                  likesTitleLabel,
                  likesAmountLabel]
    
    containerView.layer.cornerRadius = 20
    containerView.layer.borderWidth = 3
    containerView.layer.borderColor = UIColor.white.cgColor
    containerView.layer.backgroundColor = UIColor(named: "ProfileDetailsBackgroundColor")?.cgColor
    
    redactButton.setImage(UIImage(named: "Pencil"), for: .normal)
    
    imageView.layer.borderWidth = 3
    imageView.layer.cornerRadius = 20
    imageView.layer.borderColor = UIColor.white.cgColor
    
    separatorView1.backgroundColor = UIColor(named: "SeparatorColor")
    separatorView2.backgroundColor = UIColor(named: "SeparatorColor")
    
    imageView.image = UIImage(named: "AvatarPlaceholder")
    
    subscribersTitleLabel.text = "Подписчики"
    subscriptionsTitleLabel.text = "Подписки"
    likesTitleLabel.text = "Реакции"
    
    for label in labels {
      label.font = UIFont(name: "Poppins-Bold.ttf", size: 18)
      label.textColor = .black
    }
    
    onlineLabel.font = UIFont(name: "Poppins-Medium.ttf", size: 18)
    onlineLabel.textColor = .gray
    
    fullNameLabel.font = UIFont(name: "Poppins-Medium.ttf", size: 20)
    fullNameLabel.numberOfLines = 2
    
    addSubview(containerView)
    containerView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    imageView.snp.makeConstraints {  make in
      make.leading.equalToSuperview().inset(20)
      make.top.equalToSuperview().inset(20)
      make.size.equalTo(50)
    }
    
    fullNameLabel.snp.makeConstraints { make in
      
    }
    
  }
  
  private func setupViews() {
    
  }
  
  
  
  func setup(avatar: UIImage? = nil, name: String, surname: String, isOnline: Bool, followers: Int, following: Int, isEditable: Bool) {
    
  }
  
}

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
  
  
  
  func setup(avatar: UIImage? = nil, name: String, surname: String, isOnline: Bool, followers: Int, following: Int, likes: Int, isEditable: Bool) {
    
    
    fullNameLabel.text = name + " " + surname
    subscribersAmountLabel.text = String(followers)
    subscriptionsAmountLabel.text = String(following)
    likesAmountLabel.text = String(likes)
    
    redactButton.isHidden = !isEditable
    
    if isOnline {
      onlineLabel.text = "online"
      onlineLabel.textColor = .isOnlineColor
    } else {
      onlineLabel.text = "offline"
      onlineLabel.textColor = .isOfflineColor
    }
    
    guard avatar != nil else { return }
    imageView.image = avatar
    
  }
  
  @objc func redactButtonPressed() {
    
  }
  
  override func willMove(toSuperview newSuperview: UIView?) {
    super.willMove(toSuperview: newSuperview)
    redactButton.addTarget(self,
                           action: #selector(redactButtonPressed),
                           for: .touchDown)
    setupViews()
  }
  
  private func setupViews() {
    let labels = [fullNameLabel,
                  onlineLabel,
                  subscribersTitleLabel,
                  subscribersAmountLabel,
                  subscriptionsTitleLabel,
                  subscriptionsAmountLabel,
                  likesTitleLabel,
                  likesAmountLabel]
    
    containerView.layer.cornerRadius = 25
    containerView.layer.borderWidth = 3
    containerView.layer.borderColor = UIColor.white.cgColor
    containerView.layer.backgroundColor = UIColor(named: "ProfileDetailsBackgroundColor")?.cgColor
    
    redactButton.setImage(UIImage(named: "Pencil"), for: .normal)
    
    imageView.layer.borderWidth = 3
    imageView.layer.cornerRadius = 25
    imageView.layer.borderColor = UIColor.white.cgColor
    imageView.layer.masksToBounds = true
    
    separatorView1.backgroundColor = .separatorColor
    separatorView2.backgroundColor = .separatorColor
    
    imageView.image = UIImage(named: "AvatarPlaceholder")
    
    subscribersTitleLabel.text = "Подписчики"
    subscriptionsTitleLabel.text = "Подписки"
    likesTitleLabel.text = "Реакции"
    
    
    for label in labels {
      label.font = .bold(18)
      label.textColor = .neutral
    }
    
    onlineLabel.font = .medium(18)
    onlineLabel.textColor = .gray
    
    fullNameLabel.textColor = .black
    fullNameLabel.font = .medium(20)
    fullNameLabel.numberOfLines = 2
    
    likesAmountLabel.textColor = .primary
    subscriptionsAmountLabel.textColor = .primary
    subscribersAmountLabel.textColor = .primary
    
    likesAmountLabel.textAlignment = .center
    subscriptionsAmountLabel.textAlignment = .center
    subscribersAmountLabel.textAlignment = .center
    
    likesTitleLabel.textAlignment = .center
    subscribersTitleLabel.textAlignment = .center
    subscriptionsTitleLabel.textAlignment = .center
    
    likesTitleLabel.font = UIFont.bold(18)
    
    addSubview(containerView)
    containerView.addSubview(onlineLabel)
    containerView.addSubview(fullNameLabel)
    containerView.addSubview(likesTitleLabel)
    containerView.addSubview(likesAmountLabel)
    containerView.addSubview(subscribersTitleLabel)
    containerView.addSubview(subscribersAmountLabel)
    containerView.addSubview(subscriptionsTitleLabel)
    containerView.addSubview(subscriptionsAmountLabel)
    containerView.addSubview(separatorView1)
    containerView.addSubview(separatorView2)
    containerView.addSubview(redactButton)
    containerView.addSubview(imageView)
    
    containerView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    imageView.snp.makeConstraints {  make in
      make.leading.equalToSuperview().inset(30)
      make.top.equalToSuperview().inset(30)
      make.size.equalTo(75)
    }
    
    redactButton.snp.makeConstraints { make in
      make.top.trailing.equalToSuperview().inset(30)
      make.size.equalTo(30)
    }
    
    fullNameLabel.snp.makeConstraints { make in
      make.leading.equalTo(imageView.snp.trailing).inset(-7)
      make.top.equalTo(imageView).inset(5)
      make.trailing.lessThanOrEqualTo(redactButton.snp.leading).offset(-5)
    }
    
    onlineLabel.snp.makeConstraints { make in
      make.top.equalTo(fullNameLabel.snp.bottom).offset(3)
      make.leading.equalTo(fullNameLabel)
    }
    
    separatorView1.snp.makeConstraints { make in
      make.top.equalTo(imageView.snp.bottom).inset(-15)
      make.bottom.equalToSuperview().inset(15)
      make.height.equalTo(45)
      make.width.equalTo(2)
      make.centerX.equalToSuperview().multipliedBy(0.7)
    }
    
    separatorView2.snp.makeConstraints { make in
      make.top.equalTo(imageView.snp.bottom).inset(-15)
      make.bottom.equalToSuperview().inset(15)
      make.height.equalTo(45)
      make.width.equalTo(2)
      make.centerX.equalToSuperview().multipliedBy(1.3)
    }
    
    subscribersAmountLabel.snp.makeConstraints { make in
      make.top.equalTo(separatorView1)
      make.leading.equalToSuperview().inset(6)
      make.trailing.equalTo(separatorView1).inset(6)
    }
    
    subscriptionsAmountLabel.snp.makeConstraints { make in
      make.top.equalTo(separatorView1)
      make.leading.equalTo(separatorView1).inset(6)
      make.trailing.equalTo(separatorView2).inset(6)
    }
    
    likesAmountLabel.snp.makeConstraints { make in
      make.top.equalTo(separatorView1)
      make.leading.equalTo(separatorView2).inset(6)
      make.trailing.equalToSuperview().inset(6)
    }
    
    subscribersTitleLabel.snp.makeConstraints { make in
      make.bottom.equalTo(separatorView1)
      make.leading.equalToSuperview()
      make.trailing.equalTo(separatorView1)
    }
    
    subscriptionsTitleLabel.snp.makeConstraints { make in
      make.bottom.equalTo(separatorView1)
      make.leading.equalTo(separatorView1)
      make.trailing.equalTo(separatorView2)
    }
    
    likesTitleLabel.snp.makeConstraints { make in
      make.bottom.equalTo(separatorView1)
      make.leading.equalTo(separatorView2)
      make.trailing.equalToSuperview()
    }
  }
  
}

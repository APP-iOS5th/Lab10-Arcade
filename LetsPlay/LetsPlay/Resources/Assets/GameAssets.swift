//
//  GameButton.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/5/24.
//

import UIKit

extension UIViewController {
    // 시작 버튼 설정
    func customButton(title: String) -> UIButton {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        let customFont = UIFont(name: "DNFBitBitv2", size: 24) ?? UIFont.systemFont(ofSize: 24)
        
        configuration.baseBackgroundColor = UIColor(named: "color-button")
        configuration.background.strokeColor = .black
        configuration.background.strokeWidth = 3
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        configuration.attributedTitle = AttributedString(title, attributes: AttributeContainer([.font: customFont, .kern: 1]))
        
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -130),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        return button
    }
    
    // 배경 이미지 설정
    func setBackground() {
        let backgroundImageView = UIImageView()
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        backgroundImageView.image = UIImage(named: BACKGROUND_IMAGE)
        backgroundImageView.contentMode = .scaleAspectFit
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.widthAnchor.constraint(
                equalTo: view.widthAnchor),
            backgroundImageView.heightAnchor.constraint(
                equalTo: backgroundImageView.widthAnchor,
                multiplier: 2.5),
            backgroundImageView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            backgroundImageView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor),
        ])
    }
    
    func splashBackground() {
        let splashBackgroundImageView = UIImageView()
        view.addSubview(splashBackgroundImageView)
        view.sendSubviewToBack(splashBackgroundImageView)
        splashBackgroundImageView.image = UIImage(named: "splash")
        splashBackgroundImageView.contentMode = .scaleAspectFill
        splashBackgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(splashBackgroundImageView)
        
        // 이미지 뷰 제약 조건 설정
        NSLayoutConstraint.activate([
            splashBackgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            splashBackgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            splashBackgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            splashBackgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // 게임 설명 설정
    func setDescription(title: String, body: String) {
        let cornerView = UIView()
        let titleLabel = UILabel()
        let bodyTextView = UITextView()
        
        
        cornerView.backgroundColor = .white.withAlphaComponent(0.95)
        cornerView.layer.cornerRadius = 40
        cornerView.layer.borderColor = UIColor.black.cgColor
        cornerView.layer.borderWidth = 3
        cornerView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "DNFBitBitv2", size: 24) ?? UIFont.systemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "NeoDunggeunmoPro-Regular", size: 17) ?? UIFont.systemFont(ofSize: 17), .paragraphStyle: paragraphStyle]
        let attributedString = NSAttributedString(
            string: body, attributes: attributes)
        bodyTextView.attributedText = attributedString
        bodyTextView.isEditable = false
        bodyTextView.isScrollEnabled = false
        bodyTextView.backgroundColor = .white.withAlphaComponent(0)
        bodyTextView.textAlignment = .center
        bodyTextView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(cornerView)
        cornerView.addSubview(titleLabel)
        cornerView.addSubview(bodyTextView)
        
        NSLayoutConstraint.activate([
            cornerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cornerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -110),
            cornerView.widthAnchor.constraint(equalToConstant: 298),
            cornerView.heightAnchor.constraint(equalToConstant: 208),
            titleLabel.centerXAnchor.constraint(equalTo: cornerView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: cornerView.topAnchor, constant: 40),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            bodyTextView.centerXAnchor.constraint(equalTo: cornerView.centerXAnchor),
            bodyTextView.trailingAnchor.constraint(equalTo: cornerView.trailingAnchor, constant: -10),
            bodyTextView.leadingAnchor.constraint(equalTo: cornerView.leadingAnchor, constant: 10),
            bodyTextView.bottomAnchor.constraint(equalTo: cornerView.bottomAnchor, constant: -40),
            
        ])
    }
}

extension UINavigationController {
    func setupBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .white
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.isTranslucent = false
        navigationBar.tintColor = .black
    }
}

extension UILabel {
    func addStroke(text: String, strokeColor: UIColor, strokeWidth: CGFloat) {
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.strokeColor : strokeColor,
            NSAttributedString.Key.strokeWidth : -strokeWidth,
            NSAttributedString.Key.foregroundColor : self.textColor ?? UIColor.black
        ]
        
        self.attributedText = NSAttributedString(string: text, attributes: strokeTextAttributes)
    }
}

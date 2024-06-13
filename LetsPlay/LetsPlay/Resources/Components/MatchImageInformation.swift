//
//  GameInformation.swift
//  MatchImage
//
//  Created by Jungjin Park on 2024-06-05.
//

import UIKit

struct MatchImageInformation {
    
    var gameTitle: UILabel {
        let label = UILabel()
        label.text = "짝꿍 찾기"
        label.font = CustomFonts().dNFBitBitv2
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    var gameDescription: UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = CustomFonts().neoDunggeunmoPro
        
        let attrString = NSMutableAttributedString(string: label.text ?? "게임 설명")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        paragraphStyle.alignment = .center
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        label.attributedText = attrString
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    var gamePlayTime: UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.font = CustomFonts().dNFBitBitv2
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    var gameInfoContainer: UIView {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(white: 1, alpha: 0.95)
        uiView.layer.borderWidth = 3
        uiView.layer.borderColor = UIColor.black.cgColor
        uiView.layer.cornerRadius = 40
        
        uiView.translatesAutoresizingMaskIntoConstraints = false
        
        return uiView
    }
}

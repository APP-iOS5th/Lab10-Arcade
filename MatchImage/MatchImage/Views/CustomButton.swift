//
//  CustomButton.swift
//  MatchImage
//
//  Created by Jungjin Park on 2024-06-05.
//

import UIKit

struct CustomButton {
    var button: UIButton {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 1, green: 0.48, blue: 0.11, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = CustomFonts().dNFBitBitv2
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
}

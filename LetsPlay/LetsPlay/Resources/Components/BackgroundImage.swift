//
//  BackgroundImage.swift
//  MatchImage
//
//  Created by Jungjin Park on 2024-06-05.
//

import UIKit

struct BackgroundImage {
    var backgroundImage: UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: BACKGROUND_IMAGE)
        imageView.contentMode = .scaleAspectFill
        
        imageView.alpha = 0.1

        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }
}

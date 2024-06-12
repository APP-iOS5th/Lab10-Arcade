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
        imageView.image = UIImage(named: "image-background")
        imageView.contentMode = .scaleAspectFill
        
        // 이미지 뷰의 투명도 설정
        imageView.alpha = 0.1

        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }
}

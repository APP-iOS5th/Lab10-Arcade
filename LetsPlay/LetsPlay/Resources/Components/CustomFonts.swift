//
//  Fonts.swift
//  MatchImage
//
//  Created by Jungjin Park on 2024-06-05.
//

import UIKit

struct CustomFonts {
    var dNFBitBitv2: UIFont {
        guard let font = UIFont(name: "DNFBitBitv2", size: 24) else { return UIFont.systemFont(ofSize: 24) }
        return font
    }
    var neoDunggeunmoPro: UIFont {
        guard let font = UIFont(name: "NeoDunggeunmoPro-Regular", size: 17) else { return UIFont.systemFont(ofSize: 17) }
        return font
    }
    
}

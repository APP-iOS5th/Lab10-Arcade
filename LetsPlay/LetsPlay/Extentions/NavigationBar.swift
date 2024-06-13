//
//  NavigationBar.swift
//  LetsPlay
//
//  Created by John Yun on 6/11/24.
//

import UIKit

extension UIViewController {
    
    func setupNavigationBar(title: String, leftButtonTitle: String, leftButtonAction: Selector) {
        self.title = title
        let leftButton = UIBarButtonItem(title: leftButtonTitle, style: .plain, target: self, action: leftButtonAction)
        
        // 텍스트 색 변경
        let textAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black]
        leftButton.setTitleTextAttributes(textAttributes, for: .normal)
        
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func leftButtonTappedToStart() {
        navigationController?.pushViewController(StartViewController(), animated: true)
    }
    
    @objc func leftButtonTappedToList() {
        if let viewControllers = self.navigationController?.viewControllers {
            for viewController in viewControllers {
                if let vc = viewController as? ViewController {
                    navigationController?.popToViewController(vc, animated: true)
                    break
                }
            }
        }
    }
}

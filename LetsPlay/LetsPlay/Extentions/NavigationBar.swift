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
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func leftButtonTappedToList() {
        navigationController?.popToRootViewController(animated: true)
    }
}

//
//  SplashView.swift
//  LetsPlay
//
//  Created by John Yun on 6/12/24.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    
    private var animationView: LottieAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSplashView()
    }
    
    private func setupSplashView() {
        view.backgroundColor = .white
        
        // Lottie 애니메이션 뷰 설정
        animationView = .init(name: "splash")
        animationView?.frame = view.bounds
        animationView?.contentMode = .scaleAspectFit
        animationView?.loopMode = .playOnce
        animationView?.animationSpeed = 1.5
        
        if let animationView = animationView {
            view.addSubview(animationView)
        }
        
        // 애니메이션 재생 후 메인 화면으로 전환
        animationView?.play { [weak self] (finished) in
            self?.navigateToMainViewController()
        }
    }
    
    private func navigateToMainViewController() {
        let mainViewController = MainViewController() // 메인 뷰 컨트롤러
        let navigationController = UINavigationController(rootViewController: mainViewController)
        navigationController.modalTransitionStyle = .crossDissolve
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}

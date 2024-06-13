import UIKit

// MARK: - setup - viewGroup0 - GameBackground
extension RockPaperScissorsViewController {
	func setupViewGroup0() {
		setupNavigationBar(title: "가위바위보 대결", leftButtonTitle: "게임목록", leftButtonAction: #selector(leftButtonNavigationPop))
		setBackground()
	}
	
	@objc func leftButtonNavigationPop() {
		navigationController?.popViewController(animated: true)
	}
}

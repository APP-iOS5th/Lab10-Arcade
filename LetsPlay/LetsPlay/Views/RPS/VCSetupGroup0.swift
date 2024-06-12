import UIKit

// MARK: - setup - viewGroup0 - GameBackground
extension RockPaperScissorsViewController {
	func setupViewGroup0() {
		setupNavigationBar()
		setupCommonBackgroundImage(view: view, backgroundImageView: backgroundImage)
	}
	
	func setupNavigationBar() {
		self.title = "RockPaperScissors"
	}
}

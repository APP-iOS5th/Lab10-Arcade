import UIKit

// MARK: - setup - viewGroup0 - GameBackground
extension RockPaperScissorsViewController {
	func setupViewGroup0() {
		setupNavigationBar()
		setupCommonBackgroundImage(view: view, backgroundImageView: backgroundImage)
	}
	
	func setupNavigationBar() {
		self.title = "RockPaperScissors"
//		let appearance = UINavigationBarAppearance()
//		appearance.titleTextAttributes = [
//			NSAttributedString.Key.foregroundColor: UIColor.white]
//		appearance.backgroundColor = .systemGreen
//		self.navigationController?.navigationBar
//			.scrollEdgeAppearance = appearance
	}
	
//	func setupBackgroundImage(_ background: UIImageView) {
//		view.addSubview(background)
//		view.sendSubviewToBack(background)
//		background.image = UIImage(named: BACKGROUND_IMAGE)
//		background.contentMode = .scaleAspectFit
//		background.translatesAutoresizingMaskIntoConstraints = false
//		
//		NSLayoutConstraint.activate([
//			background.widthAnchor.constraint(
//				equalTo: view.widthAnchor),
//			background.heightAnchor.constraint(
//				equalTo: background.widthAnchor,
//				multiplier: 2.5),
//			background.centerXAnchor.constraint(
//				equalTo: view.centerXAnchor),
//			background.bottomAnchor.constraint(
//				equalTo: view.bottomAnchor),
//		])
//	}
}

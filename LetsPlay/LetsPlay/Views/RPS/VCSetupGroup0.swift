import UIKit

// MARK: - setup - viewGroup0 - GameBackground
extension RockPaperScissorsViewController {
	func setupViewGroup0() {
		setupNavigationBar()
		setupBackgroundImage()
	}
	
	func setupNavigationBar() {
		self.title = "RockPaperScissors"
		let appearance = UINavigationBarAppearance()
		appearance.titleTextAttributes = [
			NSAttributedString.Key.foregroundColor: UIColor.white]
		appearance.backgroundColor = .systemGreen
		self.navigationController?.navigationBar
			.scrollEdgeAppearance = appearance
	}
	
	func setupBackgroundImage() {
		view.addSubview(backgroundImage)
		view.sendSubviewToBack(backgroundImage)
		backgroundImage.image = UIImage(named: BACKGROUND_IMAGE)
		backgroundImage.contentMode = .scaleAspectFit
		backgroundImage.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			backgroundImage.widthAnchor.constraint(
				equalTo: view.widthAnchor),
			backgroundImage.heightAnchor.constraint(
				equalTo: backgroundImage.widthAnchor,
				multiplier: 2.5),
			backgroundImage.centerXAnchor.constraint(
				equalTo: view.centerXAnchor),
			backgroundImage.bottomAnchor.constraint(
				equalTo: view.bottomAnchor),
		])
	}
}

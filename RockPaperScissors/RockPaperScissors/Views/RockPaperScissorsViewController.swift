import UIKit

#Preview { RockPaperScissorsViewController() }

class RockPaperScissorsViewController: UIViewController {
	let backgroundImage = UIImageView()
}

// MARK: - LifeCycle
extension RockPaperScissorsViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		setupNavigationBar()
		setupBackgroundImage()
	}
}

// MARK: - setup
extension RockPaperScissorsViewController {
	func setupNavigationBar() {
		self.title = "RockPaperScissors"
		let appearence = UINavigationBarAppearance()
		appearence.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		appearence.backgroundColor = .systemBrown
		self.navigationController?.navigationBar.scrollEdgeAppearance = appearence
	}
	
	func setupBackgroundImage() {
		backgroundImage.image = UIImage(
			named: "background_multiplier_2.5")
		backgroundImage.contentMode = .scaleAspectFit
		backgroundImage.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(backgroundImage)
		view.sendSubviewToBack(backgroundImage)
		
		NSLayoutConstraint.activate([
			backgroundImage.widthAnchor.constraint(
				equalTo: view.widthAnchor),
			backgroundImage.heightAnchor.constraint(
				equalTo: backgroundImage.widthAnchor,
				multiplier: 2.5),
			backgroundImage.bottomAnchor.constraint(
				equalTo: view.bottomAnchor),
		])
	}
}

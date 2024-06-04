import UIKit

#Preview { ViewController() }

class ViewController: UIViewController {
	let button = UIButton(type: .system)
}

extension ViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		setupNavigationBar()
		setupButton()
	}
}

extension ViewController {
	func setupNavigationBar() {
		self.title = "Main"
		let appearence = UINavigationBarAppearance()
		appearence.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		appearence.backgroundColor = .systemBrown
		self.navigationController?.navigationBar.scrollEdgeAppearance = appearence
	}
	
	func setupButton() {
		button.setTitle("Go to Game", for: .normal)
		button.addTarget(self, action: #selector(goNext), for: .touchUpInside)
		view.addSubview(button)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}
}

extension ViewController {
	@objc func goNext() {
		let nextVC = RockPaperScissorsViewController()
		navigationController?.pushViewController(nextVC, animated: true)
	}
}


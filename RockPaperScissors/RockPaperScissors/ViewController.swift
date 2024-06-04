import UIKit

#Preview { ViewController() }

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		self.title = "Main"
		
		let appearence = UINavigationBarAppearance()
		appearence.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		appearence.backgroundColor = .systemBrown
		self.navigationController?.navigationBar.scrollEdgeAppearance = appearence
		
		let button = UIButton(type: .system)
		button.setTitle("Go to Game", for: .normal)
		button.addTarget(self, action: #selector(goNext), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(button)
		
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


import UIKit

#Preview { RockPaperScissorsViewController() }

let FONT_DNF = "DNFBitBitv2"
let FONT_NEO = "NeoDunggeunmoPro-Regular"

class RockPaperScissorsViewController: UIViewController {
	let backgroundImage = UIImageView()
	let startButton = UIButton()
	let optionWindow = UIView()
	let optionWindowSegmentedControl = UISegmentedControl()
	let optionWindowImage0 = UIImageView()
	let optionWindowImage1 = UIImageView()
	let descriptionWindow = UIView()
	let descriptionWindowTitle = UITextView()
	let descriptionWindowContent = UITextView()
}

// MARK: - LifeCycle
extension RockPaperScissorsViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		setupNavigationBar()
		setupBackgroundImage()
		setupStartButton()
		setupOptionWindow()
		setupDescriptionWindow()
	}
}

// MARK: - Setup01 GameSetting
extension RockPaperScissorsViewController {
	func setupNavigationBar() {
		self.title = "RockPaperScissors"
		let appearance = UINavigationBarAppearance()
		appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		appearance.backgroundColor = .systemBrown
		self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
	}
	
	func setupBackgroundImage() {
		view.addSubview(backgroundImage)
		view.sendSubviewToBack(backgroundImage)
		backgroundImage.image = UIImage(
			named: "background_multiplier_2.5")
		backgroundImage.contentMode = .scaleAspectFit
		backgroundImage.translatesAutoresizingMaskIntoConstraints = false
		
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
	
	func setupStartButton() {
		view.addSubview(startButton)
		let config = configGameStyledButton("START")
		startButton.configuration = config
		startButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			startButton.centerXAnchor.constraint(
				equalTo: view.centerXAnchor),
			startButton.bottomAnchor.constraint(
				equalTo: view.bottomAnchor,
				constant: -100),
		])
	}
	
	func setupOptionWindow() {
		// MARK: optionWindow
		view.addSubview(optionWindow)
		optionWindow.backgroundColor = .white
		optionWindow.layer.borderWidth = 2
		optionWindow.layer.borderColor = UIColor.black.cgColor
		optionWindow.layer.cornerRadius = 30
		optionWindow.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			optionWindow.leadingAnchor.constraint(
				equalTo: view.leadingAnchor,
				constant: 20),
			optionWindow.trailingAnchor.constraint(
				equalTo: view.trailingAnchor,
				constant: -20),
			optionWindow.heightAnchor.constraint(
				equalToConstant: 100),
			optionWindow.bottomAnchor.constraint(
				equalTo: startButton.topAnchor,
				constant: -50),
		])
		
		// MARK: optionWindowSegmentedControl
		view.addSubview(optionWindowSegmentedControl)
		optionWindowSegmentedControl.insertSegment(withTitle: "튜나", at: 0, animated: false)
		optionWindowSegmentedControl.insertSegment(withTitle: "만두", at: 1, animated: false)
		optionWindowSegmentedControl.selectedSegmentIndex = 0
		optionWindowSegmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
		
		optionWindowSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			optionWindowSegmentedControl.widthAnchor.constraint(equalToConstant: 280),
			optionWindowSegmentedControl.centerXAnchor.constraint(equalTo: optionWindow.centerXAnchor),
			optionWindowSegmentedControl.centerYAnchor.constraint(equalTo: optionWindow.centerYAnchor, constant: 20),
		])
		
		// MARK: optionWindowImage
		view.addSubview(optionWindowImage0)
		view.addSubview(optionWindowImage1)
		optionWindowImage0.image = UIImage(named: "PePe")
		optionWindowImage1.image = UIImage(named: "Mandu")
		optionWindowImage0.contentMode = .scaleAspectFit
		optionWindowImage1.contentMode = .scaleAspectFit
		optionWindowImage0.translatesAutoresizingMaskIntoConstraints = false
		optionWindowImage1.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			optionWindowImage0.heightAnchor.constraint(equalToConstant: 30),
			optionWindowImage1.heightAnchor.constraint(equalToConstant: 30),
			
			optionWindowImage0.centerXAnchor.constraint(equalTo: optionWindow.centerXAnchor, constant: -70),
			optionWindowImage0.centerYAnchor.constraint(equalTo: optionWindow.centerYAnchor, constant: -20),
			
			optionWindowImage1.centerXAnchor.constraint(equalTo: optionWindow.centerXAnchor, constant: 70),
			optionWindowImage1.centerYAnchor.constraint(equalTo: optionWindow.centerYAnchor, constant: -20),
		])
		
	}
	
	func setupDescriptionWindow() {
		// MARK: descriptionWindow
		view.addSubview(descriptionWindow)
		descriptionWindow.backgroundColor = .white
		descriptionWindow.layer.borderWidth = 2
		descriptionWindow.layer.borderColor = UIColor.black.cgColor
		descriptionWindow.layer.cornerRadius = 30
		descriptionWindow.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			descriptionWindow.leadingAnchor.constraint(
				equalTo: view.leadingAnchor,
				constant: 20),
			descriptionWindow.trailingAnchor.constraint(
				equalTo: view.trailingAnchor,
				constant: -20),
			descriptionWindow.heightAnchor.constraint(
				equalToConstant: 200),
			descriptionWindow.bottomAnchor.constraint(
				equalTo: optionWindow.topAnchor,
				constant: -50),
		])
		
		// MARK: descriptionWindowTitle
		view.addSubview(descriptionWindowTitle)
		descriptionWindowTitle.text = "가위바위보 대결"
		descriptionWindowTitle.font = UIFont(
			name: FONT_DNF, size: 30)
		descriptionWindowTitle.isScrollEnabled = false
		descriptionWindowTitle.isEditable = false
		descriptionWindowTitle.textAlignment = .center
		
		descriptionWindowTitle.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			descriptionWindowTitle.centerXAnchor.constraint(
				equalTo: view.centerXAnchor),
			descriptionWindowTitle.centerYAnchor.constraint(
				equalTo: descriptionWindow.centerYAnchor,
				constant: -30),
		])
		
		// MARK: descriptionWindowContent
		view.addSubview(descriptionWindowContent)
		descriptionWindowContent.text = "플레이어를 선택 후\n대결을 시작해보세요!"
		descriptionWindowContent.isScrollEnabled = false
		descriptionWindowContent.isEditable = false
		descriptionWindowContent.textAlignment = .center
		descriptionWindowContent.font = UIFont(
			name: FONT_NEO, size: 20)
		descriptionWindowContent.textContainer
			.lineBreakMode = .byTruncatingTail
		
		descriptionWindowContent.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			descriptionWindowContent.centerXAnchor.constraint(
				equalTo: view.centerXAnchor),
			descriptionWindowContent.centerYAnchor.constraint(
				equalTo: descriptionWindow.centerYAnchor,
				constant: 30),
		])
		
	}
}

// MARK: - Setup02 GameReady
extension RockPaperScissorsViewController {
	
}

// MARK: - Configuration Style
extension RockPaperScissorsViewController {
	func configGameStyledButton(_ title:String) -> UIButton.Configuration {
		var config = UIButton.Configuration.filled()
		config.title = title
		config.baseForegroundColor = .white
		config.baseBackgroundColor = .systemOrange
		config.background.strokeWidth = 2
		config.background.strokeColor = .black
		config.cornerStyle = .large
		config.contentInsets = NSDirectionalEdgeInsets(
			top: 10, leading: 20,
			bottom: 10, trailing: 20)
		config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer {
			var attribute = $0
			attribute.font = UIFont(
				name: FONT_DNF, size: 25)
			return attribute
		}
		
		return config
	}
}

extension RockPaperScissorsViewController {
	@objc func segmentChanged(_ sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
			case 0:
				print("첫 번째 세그먼트 선택됨")
			case 1:
				print("두 번째 세그먼트 선택됨")
			default:
				break
		}
	}
}

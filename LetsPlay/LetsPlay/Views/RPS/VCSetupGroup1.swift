import UIKit

// MARK: - setup - viewGroup1 - ReadyToStart
extension RockPaperScissorsViewController {
	func setupViewGroup1() {
		setupStartButton()
		setupOptionWindow()
		setupOptionWindowSegmentedControl()
		setupOptionWindowImages()
		setupDescriptionWindow()
		setupDescriptionWindowTitle()
		setupDescriptionWindowContent()
	}
	
	func setupStartButton() {
		view.addSubview(startButton)
		let config = configGameStyledButton("START")
		startButton.configuration = config
		startButton.addTarget(self, action: #selector(touchStartButton), for: .touchUpInside)
		startButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			startButton.centerXAnchor.constraint(
				equalTo: view.centerXAnchor),
			startButton.bottomAnchor.constraint(
				equalTo: view.bottomAnchor,
				constant: -130),
		])
	}
	
	func setupOptionWindow() {
		view.addSubview(optionWindow)
		optionWindow.backgroundColor = .white
		optionWindow.layer.borderWidth = 2
		optionWindow.layer.borderColor = UIColor.black.cgColor
		optionWindow.layer.cornerRadius = 30
		optionWindow.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			optionWindow.widthAnchor.constraint(
				equalToConstant: 298),
			optionWindow.heightAnchor.constraint(
				equalToConstant: 100),
			optionWindow.centerXAnchor.constraint(
				equalTo: view.centerXAnchor),
			optionWindow.bottomAnchor.constraint(
				equalTo: startButton.topAnchor,
				constant: -((view.bounds.height - 450) / 5)),
		])
	}
	
	func setupOptionWindowSegmentedControl(){
		view.addSubview(optionWindowSegControl)
		optionWindowSegControl.insertSegment(
			withTitle: "튜나", at: 0, animated: false)
		optionWindowSegControl.insertSegment(
			withTitle: "만두", at: 1, animated: false)
		optionWindowSegControl.selectedSegmentIndex = 0
		optionWindowSegControl.backgroundColor = .white
		optionWindowSegControl.selectedSegmentTintColor = UIColor(
			named: "color-button")
		let normalTextAttributes: [NSAttributedString.Key: Any] = [
			.font: CustomFonts().neoDunggeunmoPro
		]
		let selectedTextAttributes: [NSAttributedString.Key: Any] = [
			.foregroundColor: UIColor.white
		]
		optionWindowSegControl.setTitleTextAttributes(
			normalTextAttributes, for: .normal)
		optionWindowSegControl.setTitleTextAttributes(
			selectedTextAttributes, for: .selected)
		optionWindowSegControl.addTarget(
			self, action: #selector(playerSelect(_:)),
			for: .valueChanged)
		
		optionWindowSegControl.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			optionWindowSegControl.widthAnchor.constraint(
				equalToConstant: 260),
			optionWindowSegControl.centerXAnchor.constraint(
				equalTo: optionWindow.centerXAnchor),
			optionWindowSegControl.centerYAnchor.constraint(
				equalTo: optionWindow.centerYAnchor, 
				constant: 20),
		])
	}
	
	func setupOptionWindowImages() {
		view.addSubview(optionWindowImage0)
		view.addSubview(optionWindowImage1)
		optionWindowImage0.image = UIImage(
			named: Character.tuna.imageName)
		optionWindowImage1.image = UIImage(
			named: Character.mandu.imageName)
		optionWindowImage0.contentMode = .scaleAspectFit
		optionWindowImage1.contentMode = .scaleAspectFit
		optionWindowImage0.translatesAutoresizingMaskIntoConstraints = false
		optionWindowImage1.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			optionWindowImage0.heightAnchor.constraint(
				equalToConstant: 30),
			optionWindowImage1.heightAnchor.constraint(
				equalToConstant: 30),
			
			optionWindowImage0.centerXAnchor.constraint(
				equalTo: optionWindow.centerXAnchor, 
				constant: -65),
			optionWindowImage1.centerXAnchor.constraint(
				equalTo: optionWindow.centerXAnchor, 
				constant: 65),
			
			optionWindowImage0.centerYAnchor.constraint(
				equalTo: optionWindow.centerYAnchor,
				constant: -20),
			optionWindowImage1.centerYAnchor.constraint(
				equalTo: optionWindow.centerYAnchor, 
				constant: -20),
		])
	}
	
	func setupDescriptionWindow() {
		view.addSubview(descriptionWindow)
		descriptionWindow.backgroundColor = .white
		descriptionWindow.layer.borderWidth = 2
		descriptionWindow.layer.borderColor = UIColor.black.cgColor
		descriptionWindow.layer.cornerRadius = 30
		descriptionWindow.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			descriptionWindow.widthAnchor.constraint(
				equalToConstant: 298),
			descriptionWindow.heightAnchor.constraint(
				equalToConstant: 208),
			descriptionWindow.centerXAnchor.constraint(
				equalTo: view.centerXAnchor),
			descriptionWindow.bottomAnchor.constraint(
				equalTo: optionWindow.topAnchor,
				constant: -((view.bounds.height - 450) / 5)),
		])
	}
	
	func setupDescriptionWindowTitle() {
		view.addSubview(descriptionWindowTitle)
		descriptionWindowTitle.text = "가위바위보 대결"
		descriptionWindowTitle.font = UIFont(
			name: FONT_DNF, size: 24)
		descriptionWindowTitle.isScrollEnabled = false
		descriptionWindowTitle.isEditable = false
		descriptionWindowTitle.textAlignment = .center
		
		descriptionWindowTitle.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			descriptionWindowTitle.centerXAnchor.constraint(
				equalTo: view.centerXAnchor),
			descriptionWindowTitle.centerYAnchor.constraint(
				equalTo: descriptionWindow.centerYAnchor,
				constant: -35),
		])
	}
	
	func setupDescriptionWindowContent() {
		view.addSubview(descriptionWindowContent)
		
		let text = "플레이어를 선택 후\n대결을 시작해보세요!"
		let font = UIFont(name: FONT_NEO, size: 17) ?? UIFont.systemFont(ofSize: 17)
		
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 10
		let attributes: [NSAttributedString.Key: Any] = [
			.font: font, .paragraphStyle: paragraphStyle]
		let attributedString = NSAttributedString(
			string: text, attributes: attributes)
		descriptionWindowContent.attributedText = attributedString
		descriptionWindowContent.isScrollEnabled = false
		descriptionWindowContent.isEditable = false
		descriptionWindowContent.textAlignment = .center
		
		descriptionWindowContent.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			descriptionWindowContent.centerXAnchor.constraint(
				equalTo: view.centerXAnchor),
			descriptionWindowContent.centerYAnchor.constraint(
				equalTo: descriptionWindow.centerYAnchor,
				constant: 35),
		])
	}
}


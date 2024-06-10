import UIKit

// MARK: - setup - viewGroup1 - GameSetting
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
		startButton.addTarget(self, action: #selector(gameStart), for: .touchUpInside)
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
		optionWindowSegControl.addTarget(
			self, action: #selector(playerSelect(_:)),
			for: .valueChanged)
		
		optionWindowSegControl.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			optionWindowSegControl.widthAnchor.constraint(equalToConstant: 280),
			optionWindowSegControl.centerXAnchor.constraint(equalTo: optionWindow.centerXAnchor),
			optionWindowSegControl.centerYAnchor.constraint(equalTo: optionWindow.centerYAnchor, constant: 20),
		])
	}
	
	func setupOptionWindowImages() {
		view.addSubview(optionWindowImage0)
		view.addSubview(optionWindowImage1)
		optionWindowImage0.image = UIImage(named: IMAGE_TUNA)
		optionWindowImage1.image = UIImage(named: IMAGE_MANDU)
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
				constant: -70),
			optionWindowImage0.centerYAnchor.constraint(
				equalTo: optionWindow.centerYAnchor, 
				constant: -20),
			
			optionWindowImage1.centerXAnchor.constraint(
				equalTo: optionWindow.centerXAnchor, 
				constant: 70),
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
				constant: -((view.bounds.height - 450) / 5)),
		])
	}
	
	func setupDescriptionWindowTitle() {
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
	}
	
	func setupDescriptionWindowContent() {
		view.addSubview(descriptionWindowContent)
		
		let text = "플레이어를 선택 후\n대결을 시작해보세요!"
		let font = UIFont(name: FONT_NEO, size: 20) ?? UIFont.systemFont(ofSize: 20)
		
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 6
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
				constant: 30),
		])
	}
}


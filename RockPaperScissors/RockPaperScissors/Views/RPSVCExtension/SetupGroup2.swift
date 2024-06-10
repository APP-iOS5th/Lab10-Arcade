import UIKit

// MARK: - setup - viewGroup2 - GameReady
extension RockPaperScissorsViewController {
	func setupViewGroup2() {
		setupSelectButton()
		setupGameBoardWindow()
		setupGameBoardDescription()
		setupComImages()
		setupYouImages()
		setupComPlayerLabel()
		setupYouPlayerLabel()
	}
	
	func setupSelectButton() {
		view.addSubview(selectButton)
		let config = configGameStyledButton("SELECT")
		selectButton.configuration = config
		selectButton.addTarget(self, action: #selector(gameRpsSelect), 
							   for: .touchUpInside)
		selectButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			selectButton.centerXAnchor.constraint(
				equalTo: view.centerXAnchor,
				constant: view.bounds.width),
			selectButton.bottomAnchor.constraint(
				equalTo: view.bottomAnchor,
				constant: -100),
		])
	}
	
	func setupGameBoardWindow() {
		view.addSubview(gameBoardWindow)
		gameBoardWindow.backgroundColor = .white
		gameBoardWindow.layer.borderWidth = 2
		gameBoardWindow.layer.borderColor = UIColor.black.cgColor
		gameBoardWindow.layer.cornerRadius = 30
		gameBoardWindow.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			gameBoardWindow.widthAnchor.constraint(
				equalTo: view.widthAnchor, constant: -40),
			gameBoardWindow.heightAnchor.constraint(
				equalToConstant: 380),
			gameBoardWindow.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor),
			gameBoardWindow.bottomAnchor.constraint(
				equalTo: selectButton.topAnchor,
				constant: -((view.bounds.height - 450) / 5)),
		])
	}
	
	func setupGameBoardDescription() {
		view.addSubview(gameBoardDescription)
		let text = "당신의 가위바위보를\n선택해주세요"
		let font = UIFont(name: FONT_NEO, size: 20) ?? UIFont.systemFont(ofSize: 20)
		
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 8
		let attributes: [NSAttributedString.Key: Any] = [
			.font: font, .paragraphStyle: paragraphStyle]
		let attributedString = NSAttributedString(
			string: text, attributes: attributes)
		gameBoardDescription.attributedText = attributedString
		gameBoardDescription.isScrollEnabled = false
		gameBoardDescription.isEditable = false
		gameBoardDescription.textAlignment = .center
		
		gameBoardDescription.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			gameBoardDescription.centerXAnchor.constraint(
				equalTo: gameBoardWindow.centerXAnchor),
			gameBoardDescription.centerYAnchor.constraint(
				equalTo: gameBoardWindow.centerYAnchor),
		])
	}
	
	func setupComImages() {
		view.addSubview(comCharacterImage)
		comCharacterImage.contentMode = .scaleAspectFit
		comCharacterImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comCharacterImage.widthAnchor.constraint(
				equalToConstant: 50),
			comCharacterImage.heightAnchor.constraint(
				equalToConstant: 50),
			comCharacterImage.topAnchor.constraint(
				equalTo: gameBoardWindow.topAnchor,
				constant: 20),
			comCharacterImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor),
		])
		
		view.addSubview(comRockImage)
		comRockImage.image = UIImage(named: RPS.rock.imageNameDown)
		comRockImage.contentMode = .scaleAspectFit
		comRockImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comRockImage.widthAnchor.constraint(
				equalToConstant: 50),
			comRockImage.heightAnchor.constraint(
				equalToConstant: 50),
			comRockImage.topAnchor.constraint(
				equalTo: gameBoardWindow.topAnchor,
				constant: 90),
			comRockImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: -80),
		])
		
		view.addSubview(comPaperImage)
		comPaperImage.image = UIImage(named: RPS.paper.imageNameDown)
		comPaperImage.contentMode = .scaleAspectFit
		comPaperImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comPaperImage.widthAnchor.constraint(
				equalToConstant: 50),
			comPaperImage.heightAnchor.constraint(
				equalToConstant: 50),
			comPaperImage.topAnchor.constraint(
				equalTo: gameBoardWindow.topAnchor,
				constant: 90),
			comPaperImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: 0),
		])
		
		view.addSubview(comScissorsImage)
		comScissorsImage.image = UIImage(named: RPS.scissors.imageNameDown)
		comScissorsImage.contentMode = .scaleAspectFit
		comScissorsImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comScissorsImage.widthAnchor.constraint(
				equalToConstant: 50),
			comScissorsImage.heightAnchor.constraint(
				equalToConstant: 50),
			comScissorsImage.topAnchor.constraint(
				equalTo: gameBoardWindow.topAnchor,
				constant: 90),
			comScissorsImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: 80),
		])
	}
	
	func setupYouImages() {
		view.addSubview(youCharacterImage)
		youCharacterImage.contentMode = .scaleAspectFit
		youCharacterImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youCharacterImage.widthAnchor.constraint(
				equalToConstant: 50),
			youCharacterImage.heightAnchor.constraint(
				equalToConstant: 50),
			youCharacterImage.bottomAnchor.constraint(
				equalTo: gameBoardWindow.bottomAnchor,
				constant: -20),
			youCharacterImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor),
		])
		
		view.addSubview(youRockImage)
		youRockImage.image = UIImage(named: RPS.rock.imageNameUp)
		youRockImage.contentMode = .scaleAspectFit
		youRockImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youRockImage.widthAnchor.constraint(
				equalToConstant: 50),
			youRockImage.heightAnchor.constraint(
				equalToConstant: 50),
			youRockImage.bottomAnchor.constraint(
				equalTo: gameBoardWindow.bottomAnchor,
				constant: -90),
			youRockImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: -80),
		])
		
		view.addSubview(youPaperImage)
		youPaperImage.image = UIImage(named: RPS.paper.imageNameUp)
		youPaperImage.contentMode = .scaleAspectFit
		youPaperImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youPaperImage.widthAnchor.constraint(
				equalToConstant: 50),
			youPaperImage.heightAnchor.constraint(
				equalToConstant: 50),
			youPaperImage.bottomAnchor.constraint(
				equalTo: gameBoardWindow.bottomAnchor,
				constant: -90),
			youPaperImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: 0),
		])
		
		view.addSubview(youScissorsImage)
		youScissorsImage.image = UIImage(named: RPS.scissors.imageNameUp)
		youScissorsImage.contentMode = .scaleAspectFit
		youScissorsImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youScissorsImage.widthAnchor.constraint(
				equalToConstant: 50),
			youScissorsImage.heightAnchor.constraint(
				equalToConstant: 50),
			youScissorsImage.bottomAnchor.constraint(
				equalTo: gameBoardWindow.bottomAnchor,
				constant: -90),
			youScissorsImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: 80),
		])
		
		// MARK: - TapGesture
		youRockImage.tag = RPS.rock.tag
		youPaperImage.tag = RPS.paper.tag
		youScissorsImage.tag = RPS.scissors.tag
		
		let tapGestureRock = UITapGestureRecognizer(
			target: self, action: #selector(rpsTap(_:)))
		let tapGesturePaper = UITapGestureRecognizer(
			target: self, action: #selector(rpsTap(_:)))
		let tapGestureScissors = UITapGestureRecognizer(
			target: self, action: #selector(rpsTap(_:)))
		
		youRockImage.isUserInteractionEnabled = true
		youPaperImage.isUserInteractionEnabled = true
		youScissorsImage.isUserInteractionEnabled = true
		
		youRockImage.addGestureRecognizer(tapGestureRock)
		youPaperImage.addGestureRecognizer(tapGesturePaper)
		youScissorsImage.addGestureRecognizer(tapGestureScissors)
	}
	
	func setupComPlayerLabel() {
		view.addSubview(comPlayerLabel)
		comPlayerLabel.text = "COM"
		comPlayerLabel.font = UIFont(name: FONT_DNF, size: 25)
		comPlayerLabel.textColor = .systemOrange
		comPlayerLabel.textAlignment = .center
		comPlayerLabel.numberOfLines = 2
		comPlayerLabel.shadowColor = .black
		comPlayerLabel.shadowOffset = CGSize(width: 1, height: 1)
		
		comPlayerLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comPlayerLabel.centerXAnchor.constraint(
				equalTo: comCharacterImage.centerXAnchor,
				constant: 100),
			comPlayerLabel.centerYAnchor.constraint(
				equalTo: comCharacterImage.centerYAnchor),
		])
	}
	
	func setupYouPlayerLabel() {
		view.addSubview(youPlayerLabel)
		youPlayerLabel.text = "YOU"
		youPlayerLabel.font = UIFont(name: FONT_DNF, size: 25)
		youPlayerLabel.textColor = .systemOrange
		youPlayerLabel.textAlignment = .center
		youPlayerLabel.numberOfLines = 2
		youPlayerLabel.shadowColor = .black
		youPlayerLabel.shadowOffset = CGSize(width: 1, height: 1)
		
		youPlayerLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youPlayerLabel.centerXAnchor.constraint(
				equalTo: youCharacterImage.centerXAnchor,
				constant: -100),
			youPlayerLabel.centerYAnchor.constraint(
				equalTo: youCharacterImage.centerYAnchor),
		])
	}
}


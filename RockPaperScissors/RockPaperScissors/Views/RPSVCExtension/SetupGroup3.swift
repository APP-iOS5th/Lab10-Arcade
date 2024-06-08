import UIKit

// MARK: - setup - viewGroup3 - GameCount
extension RockPaperScissorsViewController {
	func setupViewGroup3() {
		setupRestartButton()
		setupYouSelectedRPS()
		setupComSelectedRPS()
		setupYouOutcome()
	}
	
	func setupRestartButton() {
		view.addSubview(restartButton)
		let config = configGameStyledButton("RESTART")
		restartButton.configuration = config
		restartButton.addTarget(self, action: #selector(gameRestart), for: .touchUpInside)
		restartButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			restartButton.centerXAnchor.constraint(
				equalTo: view.centerXAnchor,
				constant: view.bounds.width * 2),
			restartButton.bottomAnchor.constraint(
				equalTo: view.bottomAnchor,
				constant: -100),
		])
	}
	
	func setupYouSelectedRPS() {
		view.addSubview(youSelectedRPSImage)
		youSelectedRPSImage.contentMode = .scaleAspectFit
		youSelectedRPSImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youSelectedRPSImage.widthAnchor.constraint(
				equalToConstant: 50),
			youSelectedRPSImage.heightAnchor.constraint(
				equalToConstant: 50),
			youSelectedRPSImage.bottomAnchor.constraint(
				equalTo: gameBoardWindow.bottomAnchor,
				constant: -90),
			youSelectedRPSImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: view.bounds.width),
		])
	}
	
	func setupComSelectedRPS() {
		view.addSubview(comSelectedRPSImage)
		comSelectedRPSImage.contentMode = .scaleAspectFit
		comSelectedRPSImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			comSelectedRPSImage.widthAnchor.constraint(
				equalToConstant: 50),
			comSelectedRPSImage.heightAnchor.constraint(
				equalToConstant: 50),
			comSelectedRPSImage.topAnchor.constraint(
				equalTo: gameBoardWindow.topAnchor,
				constant: 90),
			comSelectedRPSImage.centerXAnchor.constraint(
				equalTo: selectButton.centerXAnchor,
				constant: view.bounds.width),
		])
	}
	
	func setupYouOutcome() {
		youOutcomeLabel.font = UIFont(name: FONT_DNF, size: 25)
		youOutcomeLabel.textColor = .systemOrange
		youOutcomeLabel.textAlignment = .center
		youOutcomeLabel.numberOfLines = 2
		youOutcomeLabel.shadowColor = .black
		youOutcomeLabel.shadowOffset = CGSize(width: 1, height: 1)
		
		view.addSubview(youOutcomeLabel)
		
		youOutcomeLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			youOutcomeLabel.centerXAnchor.constraint(
				equalTo: restartButton.centerXAnchor),
			youOutcomeLabel.centerYAnchor.constraint(
				equalTo: gameBoardWindow.centerYAnchor),
		])
	}
	
}


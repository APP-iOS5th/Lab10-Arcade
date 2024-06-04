import UIKit

class RadioButton: UIButton {
	var isRadioSelected: Bool = false {
		didSet {
			updateAppearance()
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupRadioButton()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupRadioButton()
	}
}

extension RadioButton {
	private func setupRadioButton() {
		addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
		updateAppearance()
	}
	
	private func updateAppearance() {
		let symbolName = isRadioSelected ? "record.circle" : "circle.circle"
		let image = UIImage(systemName: symbolName)
		setImage(image, for: .normal)
		tintColor = .orange
	}
}

extension RadioButton {
	@objc private func buttonTapped() {
		isRadioSelected.toggle()
	}
}

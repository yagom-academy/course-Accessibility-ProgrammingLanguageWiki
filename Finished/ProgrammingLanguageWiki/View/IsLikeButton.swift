//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class IsLikeButton: UIButton {
    var languageIndex: Int?
    
    func updateButtonStatus() {
        guard let index = languageIndex else { return }
        let language = ProgrammingLanguageInfoManager.shared.infoList[index]
        
        self.isSelected = language.isLike
        
        if isSelected {
            self.setImage(UIImage(systemName: "star.fill"), for: UIControl.State.normal)
        } else {
            self.setImage(UIImage(systemName: "star"), for: UIControl.State.normal)
        }
        
        configureAccessibility()
        updateAccessibilityHint()
    }
    
    func updateIsLike() {
        guard let index = languageIndex else { return }
        
        ProgrammingLanguageInfoManager.shared.infoList[index].isLike = !ProgrammingLanguageInfoManager.shared.infoList[index].isLike
    }
}

// MARK: - Accessibility
extension IsLikeButton {
    private func configureAccessibility() {
        guard let index = languageIndex else { return }
        let language = ProgrammingLanguageInfoManager.shared.infoList[index]
        
        self.accessibilityLabel = "즐겨찾기"
        self.accessibilityTraits = .button
        self.accessibilityIdentifier = "\(language.name) IsLikeButton"
    }
    
    private func updateAccessibilityHint() {
        self.accessibilityValue = isSelected ? "추가됨" : nil
        self.accessibilityHint = isSelected ? nil : "즐겨찾기에 추가합니다."
    }
}

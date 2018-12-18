import UIKit

extension UIButton {
    
    func setBackgroundColor(for state: UIControl.State) {
        switch state {
        case UIControl.State.normal:
            self.backgroundColor = UIColor.groupTableViewBackground
            self.setTitleColor(.black, for: .normal)
        case UIControl.State.highlighted:
            self.backgroundColor = UIColor.orange
            self.setTitleColor(.white, for: .normal)
        default:
            self.backgroundColor = UIColor.groupTableViewBackground
            self.setTitleColor(.black, for: .normal)
        }
    }
    
    func toggleBackgroundColor() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        if backgroundColor == UIColor.groupTableViewBackground {
            self.backgroundColor = UIColor.orange
            self.setTitleColor(.white, for: .normal)
        } else {
            self.backgroundColor = UIColor.groupTableViewBackground
            self.setTitleColor(.black, for: .normal)
        }
    }
}

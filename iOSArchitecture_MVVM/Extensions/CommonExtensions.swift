import Foundation
import UIKit

public func log<T>(_ object: T?, filename: String = #file, line: Int = #line, funcname: String = #function) {
    #if DEBUG
        guard let object = object else { return }
        print("***** \(Date()) \(filename.components(separatedBy: "/").last ?? "") (line: \(line)) :: \(funcname) :: \(object)")
    #endif
}

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    class var className: String {
        return String(describing: self)
    }
}

extension UILabel {
    func indexOfAttributedTextCharacterAtPoint(point: CGPoint) -> Int {
        assert(self.attributedText != nil, "This method is developed for attributed string")
        let textStorage = NSTextStorage(attributedString: self.attributedText!)
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        let textContainer = NSTextContainer(size: self.frame.size)
        textContainer.lineFragmentPadding = 0
        textContainer.maximumNumberOfLines = self.numberOfLines
        textContainer.lineBreakMode = self.lineBreakMode
        layoutManager.addTextContainer(textContainer)
        
        let index = layoutManager.characterIndex(for: point, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return index
    }
}

extension UITextField {
    
    public var activityIndicator: UIActivityIndicatorView? {
        return self.rightView?.subviews.compactMap{ $0 as? UIActivityIndicatorView }.first
    }
    
    var isLoading: Bool {
        get {
            return activityIndicator != nil
        } set {
            if newValue {
                if activityIndicator == nil {
                    if #available(iOS 13.0, *) {
                        let newActivityIndicator = UIActivityIndicatorView(style: .medium)
                        newActivityIndicator.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                        newActivityIndicator.startAnimating()
                        newActivityIndicator.backgroundColor = UIColor.white
                        self.rightView?.addSubview(newActivityIndicator)
                        let leftViewSize = self.rightView?.frame.size ?? CGSize.zero
                        newActivityIndicator.center = CGPoint(x: leftViewSize.width/2, y: leftViewSize.height/2)
                    } else {
                        // Fallback on earlier versions
                        let newActivityIndicator = UIActivityIndicatorView(style: .white)
                        newActivityIndicator.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                        newActivityIndicator.startAnimating()
                        newActivityIndicator.backgroundColor = UIColor.white
                        self.rightView?.addSubview(newActivityIndicator)
                        let leftViewSize = self.rightView?.frame.size ?? CGSize.zero
                        newActivityIndicator.center = CGPoint(x: leftViewSize.width/2, y: leftViewSize.height/2)
                    }
                } else {
                    activityIndicator?.removeFromSuperview()
                }
            } else {
                activityIndicator?.removeFromSuperview()
            }
        }
    }
    
}

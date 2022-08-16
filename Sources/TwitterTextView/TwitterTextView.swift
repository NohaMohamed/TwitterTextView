//
//  CharchterCountsView.swift
//  TwitterCounter
//
//  Created by Noha Mohamed on 13/08/2022.
//

import UIKit

public protocol TwitterTextViewDidChange {
    func didChange(value: String)
}
public class TwitterTextView: UIView , UITextViewDelegate{
    //MARK: Outlets
    public var twitterTextViewDidChange: TwitterTextViewDidChange?
    @IBOutlet weak var textview: UITextView!
    @IBInspectable
    var charchtersLimit: Int = 0
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        loadNibContent()
        textview.delegate = self
    }
    private func loadNibContent() {
            let nib = UINib(nibName: String(describing: Self.self), bundle: Bundle.module)
            guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {return}
            view.frame = bounds
            addSubview(view)
    }
    public func textViewDidChange(_ textView: UITextView) {
        twitterTextViewDidChange?.didChange(value: textView.text)
    }
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return self.textLimit(existingText: textView.text,
                              newText: text,
                              limit: charchtersLimit)
    }
    private func textLimit(existingText: String?,
                           newText: String,
                           limit: Int) -> Bool {
        let text = existingText ?? ""
        let isAtLimit = text.count + newText.count <= limit
        return isAtLimit
    }
}

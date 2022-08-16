//
//  CharchterCountsView.swift
//  TwitterCounter
//
//  Created by Noha Mohamed on 13/08/2022.
//

import UIKit


public class TwitterTextView: UITextView , UITextViewDelegate{
    //MARK: Outlets
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        loadNibContent()
    }
    private func loadNibContent() {
            let nib = UINib(nibName: "TwitterTextView", bundle: Bundle.module)
            guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {return}
            view.frame = bounds
            addSubview(view)
    }
    public func textViewDidChange(_ textView: UITextView) {
    }
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return self.textLimit(existingText: textView.text,
                              newText: text,
                              limit: 280)
    }
    private func textLimit(existingText: String?,
                           newText: String,
                           limit: Int) -> Bool {
        let text = existingText ?? ""
        let isAtLimit = text.count + newText.count <= limit
        return isAtLimit
    }
}

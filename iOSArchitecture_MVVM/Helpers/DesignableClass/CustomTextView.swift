//
//  CustomTextView.swift
//  Spotlex
//
//  Created by Mandeep Singh on 1/27/20.
//  Copyright © 2020 Mandeep Singh. All rights reserved.
//

import Foundation
import UIKit


class CustomTextView: UITextView {

   override var text: String! { // Ensures that the placeholder text is never returned as the field's text
       get {
           if showingPlaceholder {
               return "" // When showing the placeholder, there's no real text to return
           } else { return super.text }
       }
       set { super.text = newValue }
   }
   @IBInspectable var placeholderText: String = ""
   @IBInspectable var placeholderTextColor: UIColor = UIColor(red: 0.78, green: 0.78, blue: 0.80, alpha: 1.0) // Standard iOS placeholder color (#C7C7CD). See
    
   private var showingPlaceholder: Bool = true // Keeps track of whether the field is currently showing a placeholder

   override func didMoveToWindow() {
       super.didMoveToWindow()
       if text.isEmpty {
           showPlaceholderText() // Load up the placeholder text when first appearing, but not if coming back to a view where text was already entered
       }
   }

   override func becomeFirstResponder() -> Bool {
       // If the current text is the placeholder, remove it
       if showingPlaceholder {
           text = nil
           textColor = nil // Put the text back to the default, unmodified color
           showingPlaceholder = false
       }
       return super.becomeFirstResponder()
   }

   override func resignFirstResponder() -> Bool {
       // If there's no text, put the placeholder back
       if text.isEmpty {
           showPlaceholderText()
       }
       return super.resignFirstResponder()
   }

   private func showPlaceholderText() {
       showingPlaceholder = true
       textColor = placeholderTextColor
       text = placeholderText
   }

}

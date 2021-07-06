//
//  ViewController.swift
//  TIL
//
//  Created by Sanya Chawla on 7/6/21.
//

import UIKit
import Firebase
import FirebaseFirestore

var passText: String = ""
var newDoc: String = " "

class ViewController: UIViewController, UITextViewDelegate {

    // UI Components
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var url: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    // Variables
    let db = Firestore.firestore()

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Adds a placeholder to the UITextView
        descriptionText.delegate = self
        
        descriptionText.text = "enter text here"
        descriptionText.textColor = UIColor.lightGray

        descriptionText.becomeFirstResponder()

        descriptionText.selectedTextRange = descriptionText.textRange(from: descriptionText.beginningOfDocument, to: descriptionText.beginningOfDocument)
    }
    
 
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        // Combine the textView text and the replacement text to
        // create the updated text string
        let currentText:String = descriptionText.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)

        // If updated text view will be empty, add the placeholder
        // and set the cursor to the beginning of the text view
        if updatedText.isEmpty {

            descriptionText.text = "enter text here"
            descriptionText.textColor = UIColor.lightGray

            descriptionText.selectedTextRange = descriptionText.textRange(from: descriptionText.beginningOfDocument, to: descriptionText.beginningOfDocument)
        }

        // Else if the text view's placeholder is showing and the
        // length of the replacement string is greater than 0, set
        // the text color to black then set its text to the
        // replacement string
         else if descriptionText.textColor == UIColor.lightGray && !text.isEmpty {
            descriptionText.textColor = UIColor.black
            descriptionText.text = text
        }

        // For every other case, the text should change with the usual
        // behavior...
        else {
            return true
        }

        // ...otherwise return false since the updates have already
        // been made
        return false
    }
    
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if self.view.window != nil {
            if descriptionText.textColor == UIColor.lightGray {
                descriptionText.selectedTextRange = descriptionText.textRange(from: descriptionText.beginningOfDocument, to: descriptionText.beginningOfDocument)
            }
        }
    }
    
    
    // Memory check
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func submitBtnClicked(_ sender: Any) {
        
        if descriptionText.text?.isEmpty == true {
                print("No text in field")
                return
            }
        AddUser()
        
    }
    
    func AddUser() {
        // Adding a document
        let db = Firestore.firestore()
        passText = descriptionText.text
        db.collection("users").addDocument(data: ["descriptionText" : descriptionText.text as Any, "url" : url.text as Any])
        
        // try 2
        
       /* let newDoc = db.collection("users").document()
        newDoc.setData(["descriptionText" : descriptionText.text as Any, "url" : url.text as Any])
        
        newDoc.getDocument(source: .cache) { (document, error) in
          if let document = document {
            passText = document.data().map(String.init(describing:)) ?? "nil"
          } else {
            print("Document does not exist in cache")
          }
        }
        
        */

        
    }
    


}


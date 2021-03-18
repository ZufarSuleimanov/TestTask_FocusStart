//
//  NoteContentViewController.swift
//  TestTask_FocusStart
//
//  Created by Zufar Suleimanov on 18.03.2021.
//

import UIKit

class NoteContentViewController: UIViewController {

    var currentNote: Note!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveBarButtonItem.isEnabled = false
        titleTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        if currentNote != nil {
            titleTextField.text = currentNote.title
            contentTextView.text = currentNote.content
        }
        
    }

    @IBAction func save(_ sender: UIBarButtonItem) {
        
        let newNote = Note(title: titleTextField.text!, content: contentTextView.text)
        
        if currentNote != nil {
            try! realm.write {
                currentNote?.title = newNote.title
                currentNote?.content = newNote.content
            }
        } else {
            StorageManager.saveObject(newNote)
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func textFieldChanged() {
        if titleTextField.text?.isEmpty == false {
            saveBarButtonItem.isEnabled = true
        } else {
            saveBarButtonItem.isEnabled = false
        }
    }
    
}



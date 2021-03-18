//
//  NotesViewController.swift
//  TestTask_FocusStart
//
//  Created by Zufar Suleimanov on 18.03.2021.
//

import UIKit
import RealmSwift

class NotesViewController: UIViewController {
    
    var notes: Results<Note>!
    
    @IBOutlet weak var notesTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        notesTableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesTableView.delegate = self
        notesTableView.dataSource = self
        notesTableView.register(
            UINib.init(nibName: XIBs.noteCell.rawValue, bundle: nil),
            forCellReuseIdentifier: Cells.noteCell.rawValue)
        
        notes = realm.objects(Note.self)
        checkFirstLaunch()

    }
    
    @IBAction func Create(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: Storyboards.notes.rawValue, bundle: nil)
        let openNoteContentVC = storyboard.instantiateViewController(withIdentifier: ViewControllers.noteContent.rawValue)
        
        openNoteContentVC.modalPresentationStyle = .fullScreen
        present(openNoteContentVC, animated: true, completion: nil)
    }
    // TODO: Надо вынести за контроллер.
    func checkFirstLaunch() {
        let checkForFirstLaunch = UserDefaults.standard.string(forKey: "Flag")
        if checkForFirstLaunch != nil {
            if notes.count == 0 {
                let note = Note(title: "Привет!", content: "Это первая заметка в твоём приложении")
                StorageManager.saveObject(note)
            }
        }
    }
}


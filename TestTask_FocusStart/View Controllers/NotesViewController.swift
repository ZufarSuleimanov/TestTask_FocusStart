//
//  NotesViewController.swift
//  TestTask_FocusStart
//
//  Created by Zufar Suleimanov on 18.03.2021.
//

import UIKit

class NotesViewController: UIViewController {

    @IBOutlet weak var notesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notesTableView.register(
            UINib.init(nibName: XIBs.noteCell.rawValue, bundle: nil),
            forCellReuseIdentifier: Cells.noteCell.rawValue)
    }

}


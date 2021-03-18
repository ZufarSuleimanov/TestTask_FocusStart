//
//  NoteCell.swift
//  TestTask_FocusStart
//
//  Created by Zufar Suleimanov on 18.03.2021.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    
    func setCell(object: Note) {
        self.titleLable.text = object.emoji
    }
    
}

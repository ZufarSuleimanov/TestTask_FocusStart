//
//  NotesViewControllerExtensions.swift
//  TestTask_FocusStart
//
//  Created by Zufar Suleimanov on 18.03.2021.
//

import UIKit

extension NotesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension NotesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.noteCell.rawValue, for: indexPath) as! NoteCell
        
        return cell
    }
    
    
}

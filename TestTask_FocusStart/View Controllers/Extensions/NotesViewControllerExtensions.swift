//
//  NotesViewControllerExtensions.swift
//  TestTask_FocusStart
//
//  Created by Zufar Suleimanov on 18.03.2021.
//

import UIKit
import RealmSwift

extension NotesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
}

extension NotesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.noteCell.rawValue, for: indexPath) as! NoteCell
        let note = notes[indexPath.row]
        cell.setCell(object: note)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let note = notes[indexPath.row]
        let storyboard = UIStoryboard(name: Storyboards.notes.rawValue, bundle: nil)
        
        guard let openNoteContentVC = storyboard.instantiateViewController(identifier: ViewControllers.noteContent.rawValue) as? NoteContentViewController else { return }
        
        openNoteContentVC.currentNote = note
        openNoteContentVC.modalPresentationStyle = .fullScreen
        
        show(openNoteContentVC, sender: nil)

    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let note = notes[indexPath.row]
        let contextItem = UIContextualAction(style: .destructive, title: "Удалить") {
            (_, _, _) in
            StorageManager.deleteObject(note)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])
        
        return swipeActions
        
    }
    
}

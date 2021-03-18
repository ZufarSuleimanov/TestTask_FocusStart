//
//  NoteModel.swift
//  TestTask_FocusStart
//
//  Created by Zufar Suleimanov on 18.03.2021.
//

import RealmSwift

class Note: Object {

    @objc dynamic var title = ""
    @objc dynamic var content: String?

    convenience init(title: String, content: String?) {
        self.init()
        self.title = title
        self.content = content
    }

}

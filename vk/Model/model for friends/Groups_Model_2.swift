//
//  Groups_Model_2.swift
//  vk
//
//  Created by Grisha Pospelov on 21.06.2021.
//

import Foundation

struct User {
    let id: Int
    let name: String
    let lastname: String
    let imageName: String?
    
    init(id: Int, name: String, lastname:String, imageName: String? = nil) {
        self.id = id
        self.name = name
        self.lastname = lastname
        self.imageName = imageName ?? "defaultAvatar"
    }
}

struct UserDataStorage {
    static var users: [User] = [
        User(id: 0, name: "Алескндр", lastname: "Македонский", imageName: "македонский "),
        User(id: 1, name: "Семен", lastname: "Мандела", imageName: "Мандела"),
        User(id: 2, name: "Александр", lastname: "Романов", imageName: "романов"),
        User(id: 3, name: "Фёдор", lastname: "Достоевский", imageName: "Эвен"),
        User(id: 4, name: "Сергей", lastname: "Есенин", imageName: "есенин"),
        User(id: 5, name: "Николай", lastname: "Гоголь", imageName: "гоголь"),
        User(id: 6, name: "Федор", lastname: "Достаевский", imageName: "достаевский"),
        User(id: 7, name: "Антон", lastname: "Чехов", imageName: "чехов"),
        User(id: 8, name: "Анна", lastname: "Ахматова", imageName: "ахматова"),
        User(id: 9, name: "Марина", lastname: "Цветаева", imageName: "цветаева"),
        User(id: 10, name: "Владимир", lastname: "Маяковский", imageName: "маяковский"),
        User(id: 11, name: "Михаил", lastname: "Лермантов", imageName: "лермантов"),
    ]

}


//  Groups_Model .swift
//  vk
//
//  Created by Grisha Pospelov on 08.06.2021.


import Foundation
struct Groups_Model {
    let name: String
    let image: String?


init(name: String, image: String? = nil) {

    self.name = name
    self.image = image ?? "defaultAvatar"

}
}
struct groupsStorage {

    static let shared = groupsStorage()
    var groups: [Groups_Model]
    var allgroups: [Groups_Model]

    private init() {
        groups = [
            Groups_Model (name: "Авто", image: "figure.walk"),
            Groups_Model (name: "Самолеты", image: "figure.walk"),
            Groups_Model (name: "луна", image: "figure.walk")
        ]

        allgroups = [
            Groups_Model (name: "Люди", image: "figure.walk"),
            Groups_Model (name: "Жизнь", image: "figure.walk"),
            Groups_Model (name: "Москва", image: "figure.walk"),
            Groups_Model (name: "Спорт", image: "figure.walk"),
            Groups_Model (name: "Приморский район", image: "figure.walk"),
            Groups_Model (name: "Аренда авто", image: "figure.walk"),


        ]

}



}

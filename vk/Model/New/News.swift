//
//  News.swift
//  vk
//
//  Created by Grisha Pospelov on 22.06.2021.
//

import Foundation

struct News {
    let id: Int
    let userId: Int
    let date: String
    let text: String
    let imageName: String?
    let likesCount: Int
    let likedByMe: Bool
    let viewsCount: Int
    
    init(id: Int, userId: Int, text: String, imageName: String? = nil, likesCount: Int, likedByMe: Bool, viewsCount: Int) {
        self.id = id
        self.userId = userId
        
        self.date = { () -> String in
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            return formatter.string(from: Date())
        }()
        
        self.text = text
        self.imageName = imageName
        
        self.likesCount = likesCount
        self.likedByMe = likedByMe
        self.viewsCount = viewsCount
        
    }
}

//struct NewsDataStorage {
//    static var news: [News] = [
//        News(id: 0, userId: 8, text: "Нет ничего лучше, чем возвращаться туда, где ничего не изменилось, чтобы понять, как изменился ты сам.", imageName: "македонский", likesCount: Int.random(in: 9...99), likedByMe: false, viewsCount: Int.random(in: 99...9999)),
//
//        News(id: 1, userId: 9, text: "Поскольку война — трагедия для каждого, каждый должен быть дипломатом.", imageName: "македонский", likesCount: Int.random(in: 9...99), likedByMe: false, viewsCount: Int.random(in: 99...9999)),
//
//        News(id: 2, userId: 4, text: "Выслушивай всех, в этом нет ничего позорного, но слушайся только самого себя и своей совести.", imageName: "wib", likesCount: Int.random(in: 9...99), likedByMe: false, viewsCount: Int.random(in: 99...9999)),
//
//        News(id: 3, userId: 4, text: "Нет ничего более рабского, чем роскошь и нега, и ничего более царственного, чем труд.", imageName: "македонский", likesCount: Int.random(in: 9...99), likedByMe: false, viewsCount: Int.random(in: 99...9999)),
//
//
//
//    ]

struct NewsDataStorage {
    static var news: [News] = [
        News(id: 0, userId: 8, text: "Стремитесь не к успеху, а к ценностям, которые он дает", imageName: "градиент", likesCount: Int.random(in: 9...99), likedByMe: false, viewsCount: Int.random(in: 99...9999)),
        
        News(id: 1, userId: 9, text: "За свою карьеру я пропустил более 9000 бросков, проиграл почти 300 игр. 26 раз мне доверяли сделать финальный победный бросок, и я промахивался. Я терпел поражения снова, и снова, и снова. И именно поэтому я добился успеха.", imageName: "градиент", likesCount: Int.random(in: 9...99), likedByMe: false, viewsCount: Int.random(in: 99...9999)),
        
        News(id: 2, userId: 4, text: " Сложнее всего начать действовать, все остальное зависит только от упорства.", imageName: "градиент", likesCount: Int.random(in: 9...99), likedByMe: false, viewsCount: Int.random(in: 99...9999)),
        
        News(id: 3, userId: 4, text: "Надо любить жизнь больше, чем смысл жизни.", imageName: "градиент", likesCount: Int.random(in: 9...99), likedByMe: false, viewsCount: Int.random(in: 99...9999)),
        
        News(id: 4, userId: 6, text: "Жизнь - это то, что с тобой происходит, пока ты строишь планы.", imageName: "градиент", likesCount: Int.random(in: 9...99), likedByMe: false, viewsCount: Int.random(in: 99...9999)),
        
        News(id: 5, userId: 8, text: "Через 20 лет вы будете больше разочарованы теми вещами, которые вы не делали, чем теми, которые вы сделали. Так отчальте от тихой пристани. Почувствуйте попутный ветер в вашем парусе. Двигайтесь вперед, действуйте, открывайте!", imageName: "градиент", likesCount: Int.random(in: 9...99), likedByMe: false, viewsCount: Int.random(in: 99...9999)),
        
        News(id: 6, userId: 6, text: "Все дело в мыслях. Мысль — начало всего. И мыслями можно управлять. И поэтому главное дело совершенствования: работать над мыслями.", imageName: "градиент", likesCount: Int.random(in: 9...99), likedByMe: false, viewsCount: Int.random(in: 99...9999)),
        
        News(id: 7, userId: 1, text: "Зачастую говорят, что мотивации хватает ненадолго. Но то же самое происходит и с освежающим душем, поэтому и рекомендуют его принимать ежедневно.", imageName: "градиент", likesCount: Int.random(in: 9...99), likedByMe: false, viewsCount: Int.random(in: 99...9999)),
        
        News(id: 8, userId: 3, text: "Если вы думаете, что на что-то способны, вы правы; если думаете, что у вас ничего не получится - вы тоже правы.", imageName: "градиент", likesCount: Int.random(in: 9...99), likedByMe: false, viewsCount: Int.random(in: 99...9999)),

    ]
}

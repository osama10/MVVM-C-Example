//
//  DataSotreImp.swift
//  MVVM-C-Example
//
//  Created by Osama Bin Bashir on 12/10/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

final class DataStoreImp : DataStore{
    
    private let data = [
        AnimeModel(name : "Naruto", image : "naruto", description : "Naruto (ナルト) is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, an adolescent ninja who searches for recognition from his peers and the village and also dreams of becoming the Hokage, the leader of his village. The story is in two parts, the first set in Naruto's pre-teen years, and the second in his teens. The series is based on two one-shot manga by Kishimoto: Karakuri (1995), which earned Kishimoto an honorable mention in Shueisha's monthly Hop Step Award the following year, and Naruto (1997)."),
        AnimeModel(name : "Boruto", image : "boruto", description : "Boruto: Naruto Next Generations (Japanese: BORUTO-ボルト- -NARUTO NEXT GENERATIONS- Hepburn: Boruto: Naruto Nekusuto Jenerēshonzu) is a Japanese manga series written by Ukyō Kodachi and illustrated by Mikio Ikemoto. Serialised monthly in Shueisha's shōnen manga magazine Weekly Shōnen Jump, Boruto is a spin-off and a sequel to Masashi Kishimoto's Naruto, which follows the exploits of Naruto Uzumaki's son, Boruto Uzumaki, and his ninja team. An anime television series adaptation directed by Noriyuki Abe started airing on TV Tokyo on 5 April 2017. Unlike the manga, which began as a retelling of the film Boruto: Naruto the Movie (2015), the Boruto anime begins as a prequel set before Boruto and his friends become ninjas in a later story arc. A series of light novels have also been written."),
        AnimeModel(name : "One Piece", image : "one-piece", description : "One Piece (Japanese: ワンピース Hepburn: Wan Pīsu) is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's Weekly Shōnen Jump magazine since July 22, 1997, and has been collected into 90 tankōbon volumes. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world's ultimate treasure known as \"One Piece\" in order to become the next Pirate King"),
        AnimeModel(name : "Death Note", image : "death-note", description : "Death Note (Japanese: デスノート Hepburn: Desu Nōto) is a Japanese manga series written by Tsugumi Ohba and illustrated by Takeshi Obata. The story follows Light Yagami, a high school student who stumbles across a mysterious otherworldly notebook: the \"Death Note\", which belonged to the Shinigami Ryuk, and grants its user the power to kill anyone whose name and face he knows. The series centers around Light's subsequent attempts to use the Death Note to change the world into a utopian society without crime and the subsequent efforts of a special task-force of law enforcement officials, consisting of members of the Japanese police agency led by L, a reclusive international criminal profiler, to apprehend him and end his reign of terror")
                    ]
    
    func getAllAnime() -> [AnimeModel] {
        return data
    }
    
    func getAnime(by id: Int) -> AnimeModel? {
        return (id <= (data.count - 1) && id >= 0 ) ? data[id] : nil
    }
    
    
}

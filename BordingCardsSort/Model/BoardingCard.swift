//
//  BoardingCard.swift
//  BordingCardsSort
//
//  Created by Marliza Viegas on 04/05/2021.
//

import Foundation

struct BoardingCard: Decodable {
    
    let seatNo: String?
    let transport: Transport
    let gate: String?
    let origin: String
    let destination : String
    let baggage_information : String?
}

struct Transport: Decodable{
    let type:  String
    let number: String?
}

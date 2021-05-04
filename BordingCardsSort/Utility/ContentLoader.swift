//
//  Utility.swift
//  BordingCardsSort
//
//  Created by Marliza Viegas on 04/05/2021.
//

import Foundation

struct ContentLoader{
    func getData(for jsonFileName: String ) -> [BoardingCard]?{
        if let localData = self.loadLocalFile(forName: jsonFileName) {
            return self.parse(jsonData: localData)
        }else{
            return nil
        }
    }
    
    private func loadLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    private func parse(jsonData: Data) -> [BoardingCard]{
        var boardingCards = [BoardingCard]()
        do {
            let decodedData = try JSONDecoder().decode([BoardingCard].self,
                                                       from: jsonData)
            boardingCards = decodedData
            return boardingCards
        } catch {
            print("decode error")
        }
        return boardingCards
    }
}

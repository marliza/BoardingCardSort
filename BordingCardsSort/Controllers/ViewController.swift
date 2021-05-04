//
//  ViewController.swift
//  BordingCardsSort
//
//  Created by Marliza Viegas on 04/05/2021.
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    
    var boardingCards: [BoardingCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        tableView.register(UINib(nibName: K.boardingCardCellNibName, bundle: nil), forCellReuseIdentifier: K.boardingCardCellIdentifier)
        
        hideSpinner()
        // load boarding card data from json file
        loadBoardingCards()
    }
    
    @IBAction func sortBoardingCardsTapped(_ sender: UIButton) {
        guard !boardingCards.isEmpty else {
            return
        }
        if let sortedBoardingCards = sort(boardingCards){
            boardingCards = sortedBoardingCards
            sender.setTitleColor(.white, for: .normal)
            sender.backgroundColor = .systemGreen
            sender.setTitle(K.sortedButtonTitle, for: .normal)
            sender.isUserInteractionEnabled = false
        }
        tableView.reloadData()
    }
    
    func showSpinner(){
        spinnerView.startAnimating()
    }
    
    func hideSpinner(){
        spinnerView.stopAnimating()
    }
    //MARK: - Sort
    func sort(_ boardingCards: [BoardingCard]) -> [BoardingCard]?{
        showSpinner()
        var startCard: BoardingCard?
        var sortedCards = [BoardingCard]()
        
        // get the start and end points of the journey
        for card in boardingCards{
            let origin = card.origin
            
            if !(boardingCards.contains(where: { $0.destination == origin })) {
                sortedCards.insert(card, at: 0)
                startCard = card
                break
            }
        }
        //get the stops in between
        while (boardingCards.contains(where: {($0.origin == startCard?.destination)})){
            let results = boardingCards.filter {$0.origin == startCard?.destination }
            sortedCards.insert(contentsOf: results, at: sortedCards.endIndex)
            startCard = results[0]
        }
        
        self.hideSpinner()
        return sortedCards

    }
    //MARK: - Fetch local data
    fileprivate func loadBoardingCards() {
        let contentLoader = ContentLoader()
        if let boardingCards = contentLoader.getData(for: K.boardingCardsFile){
            self.boardingCards = boardingCards
            tableView.reloadData()
        }
    }
}
//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boardingCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.boardingCardCellIdentifier, for: indexPath) as! BoardingCardCell
        let card = boardingCards[indexPath.row]
        cell.journeyName.text = "\(card.origin)  ->  \(boardingCards[indexPath.row].destination)"
        cell.transportType.text = card.transport.type
        cell.transportTypeNumber.text = card.transport.number
        if (card.seatNo != nil){
            cell.seatNo.text = card.seatNo
        }else{
            cell.seatNo.text = " -- "
        }
        return cell
    }
}


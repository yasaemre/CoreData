//
//  PlayersViewController.swift
//  CoreDataRelationships1
//
//  Created by Sophie on 3/7/18.
//  Copyright © 2018 Sophie Zhou. All rights reserved.
//

import UIKit
import Novagraph
import CoreData

class PlayersViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var lastField: UITextField!

    let team: Team
    var players: [Player] = []

    init(team: Team) {
        self.team = team
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PlayerCell")
        self.button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        fetchPlayers()
    }
    
    func fetchPlayers() {
        players = Array(team.players ?? [])
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Fill this out.
        return players.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell")!
        cell.textLabel?.text = players[indexPath.row].firstName + " " + players[indexPath.row].lastName
        return cell
    }

    // MARK: - Action Handlers
    @objc func buttonPressed(_ button: UIButton) {
        guard let firstName = firstField.text else {
            return
        }
        guard let secondName = lastField.text else {
            return
        }
     _ = self.firstField.text
        let lastName = self.lastField.text
        let player = Player.createNew()
        player.firstName = firstName
        player.lastName = lastName!
        player.team = self.team
        let context = CoreDataManager.shared.context
        try! context!.save()
        fetchPlayers()
        tableView.reloadData()
    }
}

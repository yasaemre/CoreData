//
//  ViewController.swift
//  BaseCoreDataExam
//
//  Created by Sophie Zhou on 9/26/17.
//  Copyright © 2017 Sophie Zhou. All rights reserved.
//

import UIKit
import CoreData
import Novagraph

class TeamsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var teams: [Team] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let request = NSFetchRequest<Team>(entityName: "Team")
        self.teams = try! CoreDataManager.shared.context.fetch(request)

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Indetifier")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teams.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Indetifier")!
        let team = self.teams[indexPath.row]
        cell.textLabel?.text = team.name
        return cell
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let team = self.teams[indexPath.row]
        let playersVC = PlayersViewController(team: team)
        self.navigationController?.pushViewController(playersVC, animated: true)
    }
}


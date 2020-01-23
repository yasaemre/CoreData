//
//  Team.swift
//  CoreDataRelationships1
//
//  Created by Sophie on 3/7/18.
//  Copyright © 2018 Sophie Zhou. All rights reserved.
//
import UIKit
import CoreData
import Novagraph

@objc(Team)
class Team: NSManagedObject, FetchOrCreatable {
    typealias T = Team
    var id: String = ""
    @NSManaged var name: String!
    @NSManaged var players: Set<Player>?
    
    func parse(data: [String : Any]) {
    }
}

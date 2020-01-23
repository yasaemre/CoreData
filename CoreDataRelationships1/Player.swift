//
//  Player.swift
//  CoreDataRelationships1
//
//  Created by Home on 8/27/19.
//  Copyright © 2019 Sophie Zhou. All rights reserved.
//

import UIKit
import CoreData
import Novagraph

@objc(Player)
class Player: NSManagedObject, FetchOrCreatable {
    
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var team: Team?
    
    var id: String = ""
    typealias T = Player
    
    func parse(data: [String: Any]) {
    }
}

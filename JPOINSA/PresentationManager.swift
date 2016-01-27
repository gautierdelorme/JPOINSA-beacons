//
//  PresentationManager.swift
//  JPOINSA
//
//  Created by Gautier Delorme on 26/01/16.
//  Copyright © 2016 gautierdelorme. All rights reserved.
//

import UIKit

class PresentationManager: NSObject, UITableViewDataSource {
    static let sharedInstance   = PresentationManager()
    
    let presentations: [String:[Presentation]]
    
    private override init() {
        presentations = [
            "firstFloor": [
                Presentation(title: "Club Robot", place: "Local du club", image: "robot.jpg", summary: "Le club robot réunit chaque année une quinzaine d'étudiants qui participent à la Coupe de France de Robotique organisée par Planètes Sciences, avec chaque année sur un nouveau cahier des charges en combinant leur savoir-faire."),
                Presentation(title: "Équipe TIM", place: "Hall du GEI", image: "tim.jpg", summary: "Equipe TIM (Toulouse Ingénierie Multidisciplinaire), association étudiante, dont la mission est de relever des défis technologiques en développant et optimisant des véhicules les plus économes en énergie possible. En ligne de mire : l’Educ-Eco et le Shell Eco-Marathon, pour se confronter à plus de 200 équipes du monde entier!")
            ],
            "secondFloor": [
                Presentation(title: "Démonstration réseaux", place: "Salle 101", image: "network.jpg", summary: ""),
                Presentation(title: "Innovative Smart Systems", place: "Salle 105", image: "iot.jpg", summary: "Sécurité de l'Internet des Objets, dans le cadre de la 5ème année Innovative Smart Systems."),
                Presentation(title: "Démonstration en informatique embarquée et électronique", place: "Salle 111", image: "embedded-systems.jpg", summary: "")
            ],
            "thirdFloor": [
                Presentation(title: "Bâtiment ADREAM", place: "Salle 213", image: "adream.jpg", summary: "Présentation de la recherche au LAAS/CNRS: maquette du bâtiment ADREAM"),
                Presentation(title: "Démonstration 4x4 et projets drones", place: "Salle 213", image: "drone.jpg", summary: ""),
                Presentation(title: "Démonstration automatique", place: "Salle 224", image: "automatic.jpg", summary: "")
            ]
        ]
    }
    
    func floor(floor: String) -> [Presentation] {
        return presentations[floor]!
    }
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let currentRegion = BeaconManager.sharedInstance.currentRegion else {
            return 0
        }
        return floor(currentRegion.identifier).count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(PresentationCell.ReuseIdentifier, forIndexPath: indexPath) as? PresentationCell else {
            fatalError("unexpected cell dequeued from tableView")
        }
        guard let currentRegion = BeaconManager.sharedInstance.currentRegion else {
            fatalError("currentRegion does not exist")
        }
        cell.presentation = floor(currentRegion.identifier)[indexPath.row]
        return cell
    }
}

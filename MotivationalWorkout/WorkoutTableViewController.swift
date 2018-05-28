//
//  ViewController.swift
//  MotivationalWorkout
//
//  Created by Laurence Wingo on 5/27/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit
import HealthKit

class WorkoutTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        if HKHealthStore.isHealthDataAvailable() {
            print("Success!  Health Data Available!")
        } else {
            //HealthKit unavailable
            print("HealthKit not available on this device.  User should visit their nearest Apple Store.")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


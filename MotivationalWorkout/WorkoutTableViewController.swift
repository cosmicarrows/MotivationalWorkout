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
    
    var healthStore: HKHealthStore?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        if HKHealthStore.isHealthDataAvailable() {
            print("Success!  Health Data Available!")
            healthStore = HKHealthStore.init()
            
            let stepType: HKQuantityType? = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
            let distanceType: HKQuantityType? = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)
            let workoutType: HKWorkoutType = HKObjectType.workoutType()
            
            let readTypes: Set = [stepType!, distanceType!, workoutType]
            let writeTypes: Set = [stepType!, distanceType!, workoutType]
            
            healthStore?.requestAuthorization(toShare: writeTypes, read: readTypes, completion: {(success: Bool, error: NSError?) -> Void in
                
                //set
                if success {
                    //success
                    //get workouts
                } else {
                    //Denied
                    self.presentErrorMessage(errorString: "HealthKit permissions denied.")
                }
            })
            
        } else {
            //HealthKit unavailable
            print("HealthKit not available on this device.  User should visit their nearest Apple Store.")
            presentErrorMessage(errorString: "HealthKit not available on this device.")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentErrorMessage(errorString: String) {
        let alert = UIAlertController.init(title: "Error", message: errorString, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }


}


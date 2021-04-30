//
//  UpdateProfileViewController.swift
//  Iterable Take Home Test
//
//  Created by Mark Tapia on 4/29/21.
//

import UIKit
import IterableSDK

class UpdateProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateProfileButtonPress(_ sender: UIButton) {
        let dataField : [String: Any] = [
            "firstName": "Mark",
            "isRegisteredUser": true,
            "SA_User_Test_Key": "completed"
        ]
        
        IterableAPI.updateUser(dataField,
                               mergeNestedObjects: false,
                               onSuccess: myUserUpdateSuccessHandler,
                               onFailure: myUserUpdateFailureHandler)
    }

    @IBAction func customEventButtonPress(_ sender: UIButton) {
        let dataFields: [String: Any] = ["platform": "iOS",
                                         "isTestEvent": true,
                                         "url": "https://iterable.com/sa-test/Mark",
                                         "secret_code_key": "Code_123"
        ]
        
        IterableAPI.track(event: "mobileSATestEvent", dataFields: dataFields)
    }
}

extension UpdateProfileViewController {
    func myUserUpdateSuccessHandler(data:[AnyHashable:Any]?) -> () {
        print("sent to Iterable success")
        dump(data)
    }

    func myUserUpdateFailureHandler(reason:String?, data:Data?) -> () {
        print("sent to Iterable failure. Reason: \(reason ?? "No reason found")")
        dump(data)
    }
}


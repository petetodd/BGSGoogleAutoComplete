//
//  BGSAddressTVDataSource.swift
//  BrightTester
//
//  Created by Peter Todd Air on 15/10/2015.
//  Copyright © 2015 Bright Green Star. All rights reserved.
//

import UIKit

class BGSAddressTVDataSource: NSObject, UITableViewDataSource {
    var arrayOfData : NSArray!

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrayOfData == nil
        {
            return 0
        }
        return arrayOfData.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PropertyDetailLocationCell", forIndexPath: indexPath) as! BGSGoogleAddressCellTableViewCell
        let result = arrayOfData.objectAtIndex(indexPath.row) as! GMSAutocompletePrediction
        print("Result DATA \(result.attributedFullText.string) with placeID \(result.placeID)")

        cell.lblAddress.text = result.attributedFullText.string
        
        
        return UITableViewCell()
    }

}

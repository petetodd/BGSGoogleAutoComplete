//
//  GoogleAutoComplete.swift
//  BrightTester
//
//  Created by Peter Todd Air on 11/10/2015.
//  Copyright © 2015 Bright Green Star. All rights reserved.
//

import UIKit

protocol BGSGoogleAutoCompleteProtocol
    
{
    func addressArray(arrayAddressResults: NSArray?)
}

class GoogleAutoComplete: NSObject {
    
    var delegate:BGSGoogleAutoCompleteProtocol! = nil
 
    

    //Google - using  google places API for iOS ( for server method see https://developers.google.com/places/web-service/autocomplete
    
    func placeAutocomplete(mapString: String, bounds: GMSCoordinateBounds) {
    //    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    //    GMSServices.provideAPIKey(appDelegate.googleMapsApiKey)
        let placesClient = GMSPlacesClient.sharedClient()
        let filter = GMSAutocompleteFilter()
        filter.type = GMSPlacesAutocompleteTypeFilter.Address
        placesClient.autocompleteQuery(mapString, bounds: bounds, filter: filter, callback: { (results, error: NSError?) -> Void in
            if let error = error {
                print("Autocomplete error \(error)")
            }
            print("Autocomplete  NO error")
            
            var isResults = false
            

            for result in results! {
                if let result = result as? GMSAutocompletePrediction {
                    isResults = true
                    print("Result \(result.attributedFullText.string) with placeID \(result.placeID)")

               //     print("Result \(result.attributedFullText) with placeID \(result.placeID)")
                }
            }
            if isResults
            {
                self.delegate.addressArray(results!)
            }
        })
    }
    




}

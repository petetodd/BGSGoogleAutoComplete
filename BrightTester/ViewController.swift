//
//  ViewController.swift
//  BrightTester
//
//  Created by Peter Todd Air on 10/10/2015.
//  Copyright © 2015 Bright Green Star. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, BGSGoogleAutoCompleteProtocol {

    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var textView: UITextView!
    
    var activeTextField: UITextField!
    
    
    var placesClient: GMSPlacesClient?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        placesClient = GMSPlacesClient()
        // Use a notification to respond to changes in address lookup text field - returning an array of matching addresses
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "googleAutocompleteCaller", name: UITextFieldTextDidChangeNotification, object: nil)
        
        configMap()
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    func configMap()
    {

        let camera = GMSCameraPosition.cameraWithLatitude(51.48, longitude: 0, zoom: 4)
        mapView.camera = camera

        
        
    }
    
    
    
    //-(void) googleAutocompleteCaller:(NSNotification *)notification {
    func googleAutocompleteCaller(){
        print("DEBUG googleAutocompleteCaller")
        // Only search when at least 3 characters
        if (activeTextField.text?.characters.count > 2){
            let googleAuto = GoogleAutoComplete()
            googleAuto.delegate = self
            let visibleRegion = mapView.projection.visibleRegion()
            let bounds = GMSCoordinateBounds(coordinate: visibleRegion.farLeft, coordinate: visibleRegion.farRight)
            
            googleAuto.placeAutocomplete(activeTextField.text!, bounds: bounds)
        }else
        {
            textView.text = ""
        }

    }
  
    
    // MARK: TextField delegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.backgroundColor = UIColor.whiteColor()
        activeTextField = textField
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("TextField did end editing method called")
        
        textField.resignFirstResponder()
    }
    
    // MARK: BGSGoogleAutoCompleteProtocol delegate

    func addressArray(arrayAddressResults: NSArray?)
    {
        if arrayAddressResults == nil
        {
            textView.text = "Address results displayed here"

            return
        }
        textView.text = ""
        for result in arrayAddressResults! {
            if let result = result as? GMSAutocompletePrediction {
                print("Result \(result.attributedFullText.string) with placeID \(result.placeID)")
                textView.text = (textView.text + result.attributedFullText.string)
                textView.text = (textView.text + "   -   ")
                //     print("Result \(result.attributedFullText) with placeID \(result.placeID)")
            }
        }

            
    }

    
    
}


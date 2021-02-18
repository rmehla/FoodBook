//
//  ConnectionManager.swift
//  FoodBook
//
//  Created by Rajesh Mehla on 17/02/21.
//

import Foundation
        
class ConnectionManager: NSObject {
    
    var hostReachability : Reachability = Reachability()
    var internetReachability : Reachability = Reachability()

    func showNetworkAlert(networkVC: Any?) {
        let currentVC = networkVC as! UIViewController
        showAlertMessage(alertMsg: No_Network_Alert, currentVC: currentVC)
    }
    
    func showErrorMessage(data:Data?) -> String {
        var strMessage: String = ""
        do {
            let result = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
            if result?.value(forKey: "errors") != nil {
                let subDict = result?.value(forKey: "errors") as? NSDictionary
                let key  = subDict?.allKeys.first as! String
                if subDict?.value(forKey: key) != nil && subDict?.value(forKey: key) is String {
                    strMessage = subDict?.value(forKey:key) as! String
                } else if subDict?.value(forKey: key) != nil && subDict?.value(forKey: key) is NSDictionary {
                    let tempDict = subDict?.value(forKey: key) as? NSDictionary
                    let userKey : String = tempDict?.allKeys.first as! String
                    if tempDict?.value(forKey: userKey) != nil && tempDict?.value(forKey: userKey) is String {
                        strMessage = tempDict?.value(forKey: userKey) as! String
                    }
                }
            }
        } catch {
            let strError = error.localizedDescription
            print("Error: \(strError)")
        }
        return strMessage
    }

    func checkNetworkReachability() -> NetworkStatus {
        let remoteHostName = "www.google.co.in"
        self.hostReachability = Reachability.init(hostName: remoteHostName)
        self.hostReachability.startNotifier()
        
        self.internetReachability = Reachability.forInternetConnection()
        self.internetReachability.startNotifier()
        
        let netStatus : NetworkStatus = self.internetReachability.currentReachabilityStatus()
        return netStatus
    }
    
    func connectionManagerGetUserData (url:URL, withDelegate delegate: Any?, success:@escaping (_ data:Data) -> Void, failure: @escaping (_ error:String)-> Void) {
        
        let currentVC = delegate as? UIViewController
        showActivityIndicator(container: (currentVC?.view)!)
        
        var request = URLRequest.init(url:url)
        request.httpMethod = "GET"
//        request.addValue("application/JSON", forHTTPHeaderField:"Content-Type")

        let networkSatus = checkNetworkReachability()
        if networkSatus != NotReachable {
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
                hideActivityIndicator()
                if error != nil {
                    let strError = error?.localizedDescription
                    failure (strError!)
                    print(error!)
                    return
                } else {
                    let urlResponse = response as! HTTPURLResponse
                    print("Response code:\(urlResponse.statusCode)")
                    if urlResponse.statusCode == 200 || urlResponse.statusCode == 201 {
                        success(data!)
                    } else {
                        let strMessage = self.showErrorMessage(data: data)
                        failure(strMessage)
                    }
                }
            })
            dataTask.resume()
        } else {
            hideActivityIndicator()
            self.showNetworkAlert(networkVC: delegate)
        }
    }
}


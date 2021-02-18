//
//  SharedResources.swift
//  FoodBook
//
//  Created by Rajesh Mehla on 17/02/21.
//

import Foundation

let lightGreyColor = UIColor(red: 154/255.0, green: 154/255.0, blue: 154/255.0, alpha: 0.4)
let searchBorderColor = UIColor(red: 184/255.0, green: 184/255.0, blue: 184/255.0, alpha: 0.4)
let No_Network_Alert = "Currently you are not reachable to Internet!"

let Base_Url = "https://www.themealdb.com/api/json/v1/1/"
let Search_Url = "search.php?s="
let Random_Url = "random.php"

let appDelegate = UIApplication.shared.delegate as! AppDelegate
var progressView : UIView?

func showActivityIndicator (container: UIView) -> Void {
    DispatchQueue.main.async {
        let xCoord = (container.frame.size.width - 80) / 2
        let yCoord = (container.frame.size.height - 80) / 2
        
        if container.viewWithTag(122017) == nil {
            progressView  = UIView.init(frame: CGRect.init(origin: CGPoint.init(x:xCoord , y: yCoord), size: CGSize.init(width: 80, height: 80)))
            progressView?.tag = 122017
            container.addSubview(progressView!)
            
            let activity: UIActivityIndicatorView  = UIActivityIndicatorView.init(style: .white)
            activity.frame = CGRect.init(origin: CGPoint.init(x:20 , y: 20), size: CGSize.init(width: 40, height: 40))
            progressView?.addSubview(activity)
            
            activity.startAnimating()
        } else {
            progressView  = (container.viewWithTag(122017))!
        }
        progressView?.backgroundColor = UIColor.black
        progressView?.layer.cornerRadius = 8.0
    }
}

func hideActivityIndicator () -> Void {
    DispatchQueue.main.async {
        progressView?.removeFromSuperview()
    }
}

func showAlertMessage(alertMsg: String, currentVC:UIViewController) {
    DispatchQueue.main.async {
        let msgAlert = UIAlertController.init(title: "", message: alertMsg, preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        msgAlert.addAction(dismiss)
        currentVC.present(msgAlert, animated: true, completion: nil)
    }
}

extension UIImageView {
    func downloadImagefrom(imageUrl: String, success:@escaping (_ currentImage:UIImage) -> Void) -> Void {
        if imageUrl.count > 0 {
            let imgUrl = URL(string: imageUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) //URL.init(string: strBannerUrl)!
            let request: URLRequest = URLRequest(url: imgUrl!)
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
                if error == nil {
                    let currentImage = UIImage(data: data!)!
                    success(currentImage)
                }
            })
            dataTask.resume()
        }
    }
}

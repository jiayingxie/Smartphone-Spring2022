//
//  StockViewController.swift
//  AssignmentFive
//
//  Created by Jiaying Xie on 2/25/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    
    @IBOutlet weak var lblStockPrice: UILabel!
    
    @IBOutlet weak var lblStockVolume: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func queryStock(_ sender: Any) {
        guard let symbol = txtStockSymbol.text else {return}
        
        let url = "\(oneMinuteURL)\(symbol.uppercased())?apikey=\(apiKey)"
        
        SwiftSpinner.show("Getting Stock Value for \(symbol.uppercased())")
        
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            
            if response.error != nil {
                // api可能会过期
                print(response.error!)
                self.lblStockPrice.text = "Your API is expired."
                self.lblStockVolume.text = "Please try again."
                return
            }
            print(response.data!)
            // If I am here then I have got the data
            
            let stocks = JSON(response.data!).array
            
            print(stocks)
            if ((stocks?.isEmpty) != nil) {
                self.lblStockPrice.text = "\(symbol) is not a valid stock symbol"
                self.lblStockVolume.text = "Please try again."
            }
            
            guard let stock = stocks!.first else { return}
            
            let quote = StockData()
            quote.symbol = symbol.uppercased()
            quote.lowPrice = stock["low"].floatValue
            quote.highPrice = stock["high"].floatValue
            quote.volume = stock["volume"].intValue
            
            self.lblStockPrice.text = "Price was ranged from $\(quote.lowPrice) to $\(quote.highPrice) "
            self.lblStockVolume.text = "Stock volume was \(quote.volume)"
                
        }
        
        
        
    }
    
}

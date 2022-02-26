//
//  StockViewController.swift
//  NailStocks
//
//  Created by Jiaying Xie on 2/20/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockViewController: UIViewController {

    @IBOutlet weak var lblStockPrice: UILabel!
    @IBOutlet weak var txtStockSymbol: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getStockPrice(_ sender: Any) {
        guard let symbol = txtStockSymbol.text else{return}
//        let symbol = txtStockSymbol.text!
        
//        let url = "https://financialmodelingprep.com/api/v3/quote-short/AAPL?apikey=YOUR_API_KEY"
        let url = "\(shortQuoteURL)\(symbol.uppercased())?apikey=\(apiKey)"
        print(url)
        
        SwiftSpinner.show("Getting stock value for \(symbol)")
        
        // make the request to the url
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            
            if response.error != nil {
                print(response.error!)
                return
            }
            
            print(response.data!)
            // 因为这个api的json是array形式的
            let stocks = JSON(response.data!).array
            
            
            // avoid that if type wrong stock symbol and get empty JSON array
            guard let stock = stocks!.first else {return}
            
            
            print(stock)
            let quote = QuoteShort()
            quote.symbol = stock["symbol"].stringValue
            quote.price = stock["price"].floatValue
            quote.volume = stock["volume"].intValue
            
            self.lblStockPrice.text = "\(quote.symbol) : \(quote.price) $"
            
        }
        
        
        
    }
    

}

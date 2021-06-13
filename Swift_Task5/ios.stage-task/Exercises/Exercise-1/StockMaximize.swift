import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        if prices.isEmpty || prices.count == 1{
            return 0
        }
        var result = 0
        var dropElements = 0
        prices.forEach { (price) in
            dropElements = dropElements + 1
            let newPrices = prices.dropFirst(dropElements)
            guard let maxPrice = newPrices.max() else {return}
            
            if price < maxPrice {
                result = result + maxPrice - price
            }
        }
        return result
    }
}

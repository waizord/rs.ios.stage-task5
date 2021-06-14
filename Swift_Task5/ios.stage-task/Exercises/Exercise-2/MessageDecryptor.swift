import UIKit

class MessageDecryptor: NSObject {
    
    var result = ""
    var subString = ""
    var index = [String]()
    var repeatString = [String]()
    
    func decryptMessage(_ message: String) -> String {
    
        message.forEach {(char) in
            
                if char.isNumber {
                    subString = "\(subString)\(char)"
                    
                    print(subString)
                    
                } else if char == "[" {
                    if subString == "" {
                        index.append("1")
                    } else {
                        index.append(subString)
                    }
                    subString = ""
                    repeatString.append(result)
                    result = ""
                    
                    print(repeatString)
                    
                } else if char == "]" {
                    var sentence = ""
                    if let counts = Int(index.popLast() ?? "1") {
                        
                        print(counts)
                        
                        for _ in 0..<counts {
                            sentence += result
                        }
                    }
                    result = repeatString.popLast()! + sentence
                } else if char.isLetter {
                    result += String(char)
                }
            }
            
            return result
    }
}

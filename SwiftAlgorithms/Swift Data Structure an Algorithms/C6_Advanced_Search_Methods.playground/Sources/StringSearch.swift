import Foundation

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

public class StringSearch {
    // Brutce force using Array of chars
    public static func bruteForce(search pattern:[Character], in text:[Character]) {
        // Extract m and n
        let m = pattern.count - 1
        let n = text.count - 1
        // Search for the pattern in the text
        for index in 0...n - m {
            let substringToMatch = text[index...index+m]
            print(substringToMatch)
            
            if substringToMatch == pattern[0...m] {
                print("Pattern found")
            }
        }
    }
    
    // Brutce force using Strings
    public static func bruteForce(search pattern:String, in text:String) {
        // Extract m and n
      let m = pattern.count
        let n = text.count
        
        // Search for the pattern in the text
        for index in 0...n - m {
            let start = text.index(text.startIndex, offsetBy: index)
            let end = text.index(text.startIndex, offsetBy: index + m - 1)
            let substringToMatch = text[start...end]
            print(substringToMatch)
            
            if substringToMatch == pattern {
                print("Pattern found")
            }
        }
    }
    
    public static func rabinKarpNumbers(search pattern:String, in text:String, modulo:Int, base:Int) {
        // 1. Initialize
        
        // Put the pattern and the text into arrays of strings -> So "123" will be ["1","2","3"]
        let patternArray = pattern.map { String($0) }
        let textArray = text.map { String($0) }
        
        let n = textArray.count
        let m = patternArray.count
        let h = (base ^^ (m-1)) % modulo
        var patternModulo = 0
        var lastTextModulo = 0
        
        // 2. Calculate pattern modulo and the modulo of the first digits of the text (that we will use later to calculate the following ones with modulo arithmetic properties)
        for i in 0...m-1 {
            guard let nextPatternDigit = Int(patternArray[i]),
                let nextTextDigit = Int(textArray[i]) else {
                    print("Error")
                    return
            }
            patternModulo = (base * patternModulo + nextPatternDigit) % modulo
            lastTextModulo = (base * lastTextModulo + nextTextDigit) % modulo
        }
        
        // 3. Check for equality and calculate sucesive positions modulos
        for s in 0...n - m - 1 {
            // Check last calculated modulo with the modulo of the pattern
            if patternModulo == lastTextModulo {
                // We have a modulo equality. Now we check for the same digits equality (different digits could have the same modulo, so we need this double check)
                let substringToMatch = textArray[s...s + m - 1].joined(separator: "")
                if pattern == substringToMatch {
                    print("Pattern occurs at shift: " + "\(s)")
                }else {
                    print("Same modulo but not same pattern: " + "\(s)")
                }
            }
            // Now calculate the modulo of the next group of digits
            if s < n - m {
                guard let highOrderDigit = Int(textArray[s]),
                    let lowOrderDigit = Int(textArray[s + m]) else {
                        print("Error")
                        return
                }
                // To calculate the next modulo, we have to subtract the modulo of the high order digit and add in a next step the modulo of the new low order digit
                
                //1. Subtract previous high order digit modulo
                var substractedHighOrderDigit = (base*(lastTextModulo - highOrderDigit * h)) % modulo
                if substractedHighOrderDigit < 0 {
                    //If the modulo was negative we turn it positive (this is because '%' operator in swift is remainder, not modulo)
                    substractedHighOrderDigit = substractedHighOrderDigit + modulo
                }
                
                //2. Add the new low order digit modulo
                var next = (substractedHighOrderDigit + lowOrderDigit) % modulo;
                if (next < 0) {
                    //If the modulo was negative we turn it positive (this is because '%' operator in swift is remainder, not modulo)
                    next = (next + modulo);
                }
                
                lastTextModulo = next
            }
        }
    }

}

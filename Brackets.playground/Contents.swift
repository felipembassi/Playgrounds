import UIKit

// Complete the isBalanced function below.
func isBalanced(_ s: String) -> String {
    var queue: [Character] = []
        for char in s {
            if checkIsOpening(char: char) {
                queue.append(char)
            }else {
                guard let left = queue.last else {
                    return "NO"
                }
                if !isBalancedBrace(left: left, right: char) {
                    return "NO"
                }else {
                    queue.removeLast()
                }
            }
        }
    if queue.isEmpty {
        return "YES"
    }else {
        return "NO"
    }
}

func isBalancedBrace(left: Character, right: Character) -> Bool {
    if left == "{" && right == "}" {
        return true
        
    }else if left == "[" && right == "]" {
        return true
        
    } else if left == "(" && right == ")" {
        return true
        
    }else {
        return false
        
    }
}

func isOddSegment(_ segment: String) -> Bool {
    if segment.count % 2 != 0 {
        return true
    }else {
        return false
    }
}

func checkIsOpening(char: Character?) -> Bool {
    guard let char = char else { return false }
    if char == "{" || char == "[" || char == "(" {
        return true
    }else {
        return false
    }
}

func isBalancedBrackets(brackets: [String]) -> [String] {
    var results: [String] = [String]()
    
    for segment in brackets {
        results.append(isBalanced(segment))
    }
    
    return results
}
    
//test cases
var test = isBalancedBrackets(brackets: ["{[()]}", "{[(])}", "{{[[(())]]}}", ")()(", "(){}[]"])
print(test)

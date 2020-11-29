import UIKit

//********************************
// 문서 검색, 1543 - (하) 탐색
//********************************

let document = ["a", "b", "a", "b", "a", "b", "a", "b", "a"]
let word = ["a", "b", "a"]

//let document = ["a", " ", "a", " ", "a", " ", "a", " ", "a"]
//let word = ["a", " ", "a"]

var index = 0
var result = 0

let n = word.count

while document.count - index >= word.count {
    if document[index..<index+n] == word[..<n] {
        result += 1
        index += word.count
        print(index, "3")
    } else {
        index += 1
        print(index, "1")
    }
}
print(result)



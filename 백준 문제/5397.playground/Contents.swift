import UIKit

//********************************
// 키로거, 5397 - (중) 스택, 구현, 그리디
//********************************
/* 1. 스택 두 개를 만들고, 스택 두 개의 중간 지점을 커서(Cursor)로 간주
   2. 문자 입력 : 왼쪽 스택에 원소를 삽입
   3. - 입력 : 왼쪽 스택에서 원소를 삭제
   4. < 입력 : 왼쪽 스택에서 오른쪽 스택으로 원소를 이동
   5. > 입력 : 오른쪽 스택에서 왼쪽 스택으로 원소를 이동
*/

var stackLeft = [String]()
var stackRight = [String]()

let array = ["<", "<", "B", "P", "<", "A", ">", ">", "C", "d", "-"]

for i in 0..<array.count {
    if array[i] == "<" && !stackLeft.isEmpty {
        let popLeft = stackLeft.popLast()
        if popLeft != "<" {
            stackRight.append(popLeft!)
        }
    } else
    if array[i] == ">" && !stackRight.isEmpty{
        let popRight = stackRight.popLast()
        if popRight != ">" {
            stackLeft.append(popRight!)
        }
        print(stackLeft)
    } else if array[i] == "-" && !stackLeft.isEmpty {
        stackLeft.removeLast()
        print(stackLeft)
    } else if array[i] != "<" && array[i] != ">" {
        stackLeft.append(array[i])
    }
}
print(stackLeft)


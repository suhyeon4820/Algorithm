import UIKit

// 상하좌우
/* 조건
 공간좌표 : (1, 1) -> (N, N)
 L : 왼쪽으로 한 칸 이동
 R : 오른쪽으로 한 칸 이동
 U : 위로 한 칸 이동
 D : 아래로 한 칸 이동
 공간 밖으로 이동하면 무시
 */
let n = 5 // 공간의 크기 (가로, 세로)
let moves = ["R", "R", "R", "U", "D", "D"] // 이동 조건
var xlocation = 1
var ylocation = 1
var finalX = 0
var finalY = 0

let moveType = ["L", "R", "U", "D"]
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

// 이동 계획을 한개씩 확인
for move in moves {
    // 이동 후 좌표 구하기
    for i in 0..<moveType.count {
        if move == moveType[i] {
            finalX =  xlocation + dx[i]
            finalY = ylocation + dy[i]
            print(xlocation, ylocation)
        }
    }
    // ****** 공간을 벗어나는 경우 무시 ******
    if (finalX < 1) || (finalY < 1) || (finalX > n) || (finalY > n) {
        continue
    }
    // ****** 이동 수행 ******
    xlocation = finalX
    ylocation = finalY
}


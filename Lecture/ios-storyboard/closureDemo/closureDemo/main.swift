//
//  main.swift
//  closureDemo
//
//  Created by 지상률 on 2022/09/24.
//

import Foundation

func calculator(n1 : Int, n2 : Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

let resutl = calculator(n1: 2, n2: 3){$0 * $1}
// &0 -> 첫번째 parameter, &1 -> 두번째 parameter

let array = [6,31,2,4,2,1]

func addOne(n1 : Int) -> Int {
    return n1 + 1
}

print(array.map{$0 + 1}) //int배열
let newArray = array.map{"\($0)"} //string 배열

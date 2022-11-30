//
//  step3.swift
//  week1_test
//
//  Created by 지상률 on 2022/07/25.
//

import Foundation

func printStick(len : Int){
    for _ in 1...len{
        print(" | | ")
    }
}

func printBody(body : String, topping : String){
    print("\(topping)\(body)\(topping)")
}

func printTotalBody(len : Int, body : String, topping : String){
    if (body == "|0|" && len/2 == 0){
        for _ in 1...len/2{
            print(" | | ")
            print(" |0| ")
        }
        return
    }
    else if (body == "|0|" && len/2 != 0){
        for _ in 1...len/2{
            print(" | | ")
            print(" |0| ")
        }
        print(" | | ")
        return
    }
    for _ in 1...len{
        printBody(body: body, topping: topping)
    }
}

func printSnack(len : Int, stickLen : Int, body : String, topping : String){
    print("<정보>\n길이: \(len)\n몸통: \(body)\n토핑: \(topping)\n막대길이: \(stickLen)\n")
    printTotalBody(len: len, body: body, topping: topping)
    printStick(len: stickLen)
}

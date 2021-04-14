//
//  main.swift
//  Strings
//
//  Created by jiayou on 2021/4/12.
//

import Foundation

let quotation =
"""
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)

// \表示不换行
let softWrappedQuotation =
"""
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print(softWrappedQuotation)

// Special Characters in String Literals

let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{1F496}"      // 💖, Unicode scalar ”

print(dollarSign)
print(blackHeart)

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

print(threeMoreDoubleQuotationMarks)


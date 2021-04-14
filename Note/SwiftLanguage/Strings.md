[toc]

### String Literals

```swift
let someString = "Some string literal value 
```

#### Multiline String Literals

```swift
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
```

#### Special Characters in String Literals”

- The escaped special characters \0 (null character), \\ (backslash), \t (horizontal tab), \n (line feed), \r (carriage return), \" (double quotation mark) and \' (single quotation mark)

- An arbitrary Unicode scalar value, written as \u{n}, where n is a 1–8 digit hexadecimal number (Unicode is discussed in Unicode below)”

```swift
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{1F496}"      // 💖, Unicode scalar ”

print(dollarSign)
print(blackHeart)
```

#### String Mutability

You can use ``+=`` to extend string.

```swift
var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage”
```

#### Strings Are Value Types

Swift’s String type is a value type. If you create a new String value, that String value is copied when it’s passed to a function or method, or when it’s assigned to a constant or variable.

Behind the scenes, Swift’s compiler optimizes string usage so that actual copying takes place only when absolutely necessary. This means you always get great performance when working with strings as value types.



### Characters

```swift
let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

for character in "Dog!🐶" {
    print(character)
}
```

#### string append char

you can append a Character value to a String variable

You can’t append a String or Character to an existing Character variable

```swift
let welcome = "hello there"
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
// "hello there!”
```




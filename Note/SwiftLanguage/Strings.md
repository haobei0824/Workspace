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

#### Special Characters in String Literals

- The escaped special characters \0 (null character), \\ (backslash), \t (horizontal tab), \n (line feed), \r (carriage return), \" (double quotation mark) and \' (single quotation mark)

- An arbitrary Unicode scalar value, written as \u{n}, where n is a 1–8 digit hexadecimal number (Unicode is discussed in Unicode below)”

```swift
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{1F496}"      // 💖, Unicode scalar ”

print(dollarSign)
print(blackHeart)
```

#### Extended delimiters

 string literal within extended delimiters can include special characters  without invoking their effect.

if you need the special effects of a character in a string literal, match the number of number signs within the string following the escape character ``\``

```swift
let Delimiters = #"Line 1\nLine 2"#
print(Delimiters)	// Line 1\nLine 2
let Delimiters2 = #"Line 1\#nLine 2\nLine3"#
print(Delimiters2)
// Line 1
// Line 2\nLine3
let Delimiters3 = ###"Line1\###nLine2"###
print(Delimiters3)
// Line1
// Line2
```

#### String Mutability

You can use ``+=`` to extend string.

```swift
var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage”
```

#### String Interpolation

``String interpolation`` is a way to construct a new String value from a mix of constants, variables, literals, and expressions by including their values inside a string literal

```swift
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)
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

### Unicode

Swift’s String and Character types are fully Unicode-compliant.

**Unicode scalar value**

- is a unique 21-bit number for a character or modifier,  such as U+0061 for LATIN SMALL LETTER A ("a")
- Swift’s native String type is built from Unicode scalar values

**Extended Grapheme Clusters**

- An extended grapheme cluster is a sequence of one or more Unicode scalars that (when combined) produce a single human-readable character

- Every instance of Swift’s Character type represents a single extended grapheme cluster


```swift
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by ́
// eAcute is é, combinedEAcute is é
```






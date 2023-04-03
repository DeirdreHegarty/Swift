import UIKit

// MARK: - String is a Palindrome

func palindromePrintStatement(_ word: String, isPalindrome: Bool) {
    print("\(word)" + (isPalindrome ? " is " : " is NOT ") + "a Palindrome")
}

func isPalindromeUsingReversed(_ word: String) -> Bool {
    return word == String(word.reversed())
}

func isPalindromeStringToArray(_ word: String) -> Bool {
    let wordArray = Array(word)
    let wordLength = wordArray.endIndex

    for (index, _) in wordArray.enumerated() {
        if wordArray[index] != wordArray[wordLength - 1 - index] {
            return false
        }
    }
    return true
}

palindromePrintStatement("cow", isPalindrome: isPalindromeStringToArray("cow"))
palindromePrintStatement("wow", isPalindrome: isPalindromeStringToArray("wow"))


// MARK: - String contains Palindrome substrings

/// Start at a specific index in a given string and "fan out" moving the left marker left, and the right marker right.
/// Do this until the letters do not match. Return whatever substring was present at that time.
func findPalindromeSubstring(in inString: String, left: Int, right: Int) -> String {
    var left = left
    var right = right

    var stringArray = Array(inString)
    let stringArrayLength = stringArray.endIndex


    // keep moving the left marker left, and the right marker right, until there is no more word to search,
    // or the left letter no longer matched the right letter
    while left >= 0 && right < stringArrayLength {
        // print("left: \(left) & right: \(right) \n Current string: \(String(stringArray[left ..< right+1]))")

        if stringArray[left] != stringArray[right]{
            break
        }
        left -= 1
        right += 1
    }
    return String(stringArray[left + 1 ..< right])
}

func containsPalindromes(_ word: String) -> [String] {
    var palindromeSubstringFound = [String]()
    let wordArray = Array(word)

    for index in 0..<wordArray.endIndex {
        palindromeSubstringFound.append(findPalindromeSubstring(in: word, left: index, right: index))
    }
    return palindromeSubstringFound
}

let word = "cbbbdbbca"
let palindromeArray = containsPalindromes(word)
let noDuplicates = Array(Set(palindromeArray))
let sortedSubstringsByLength = noDuplicates.sorted { $0.count > $1.count }

print("Word to check for palindrome substrings: \(word)")
print("Sorted list of substrings: \(sortedSubstringsByLength)")
print("The longest palindrome substring: \(String(describing: sortedSubstringsByLength.first))")



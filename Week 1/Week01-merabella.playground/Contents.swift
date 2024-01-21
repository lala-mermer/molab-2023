import UIKit

var greeting = "Hello, playground"

var ears = "───▄▀▀▀▄▄▄▄▄▄▄▀▀▀▄───"
var face = "───█▒▒░░░░░░░░░▒▒█───"
var eyes = "────█░░█░░░░░█░░█───"
var nose = "─▄▄──█░░░▀█▀░░░█──▄▄─"

func printEars() -> String{
    return ears
}

func printFace() -> String{
    return face
}

func printEyes() -> String{
    return eyes
}

func printNose() -> String{
    return nose
}


//for _ in 1...3{
//    print(printEars() + printSpace() + printEars() + printSpace() + printEars())
//    print(printFace() + printSpace() + printFace() + printSpace() + printFace())
//    print(printBottom() + printSmallSpace() + printBottom() + printSmallSpace() + printBottom())
//    print("")
//}
printEars()
printFace()
printEyes()
printNose()

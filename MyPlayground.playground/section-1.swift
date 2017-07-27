// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var a = [11, 22, 33]

var b = a
a[0] = 777 // b[0] also becomes 777

//a.append(44)
a[0] = 888 // b[0] does not become 888

a
b

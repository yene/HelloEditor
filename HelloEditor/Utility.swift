//  Utility.swift

// print(Utility.classNameAsString(obj: d))
class Utility {
	class func classNameAsString(obj: Any) -> String {
		//prints more readable results for dictionaries, arrays, Int, etc
		return String(describing: type(of: obj))
	}
}

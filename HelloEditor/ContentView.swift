import SwiftUI

struct ContentView: View {
	@EnvironmentObject var appData: AppData
	let result = setupFS()
	
	var body: some View {
		VStack() {
			if result == false {
				Text("Please make you have set up your iCloud account.")
				Image(systemName: "icloud")
				// TODO: retry
			} else {
				FileList()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

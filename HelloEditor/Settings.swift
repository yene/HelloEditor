// Settings.swift

import SwiftUI


struct Settings: View {
	let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
	let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as! String
	
	@EnvironmentObject var appData: AppData
	
	var body: some View {
		VStack {
			Form {
				Section(header: Text("iCloud")) {
					Text("test")
					Text(self.appData.sortBehaviour.rawValue)
				}
				Section(header: Text("Document Sorting")) {
					Button(action: {self.appData.sortBehaviour = .sortByName}) {
						HStack {
							Text("Sort by name")
							Spacer()
							if (self.appData.sortBehaviour == .sortByName) {
								Image(systemName: "checkmark").imageScale(.large).padding(5).accentColor(primaryColor)
							}
						}
					}
					Button(action: {self.appData.sortBehaviour = .sortByDate}) {
						HStack {
							Text("Sort by date")
							Spacer()
							if (self.appData.sortBehaviour == .sortByDate) {
								Image(systemName: "checkmark").imageScale(.large).padding(5).accentColor(primaryColor)
							}
						}
					}
				}.accentColor(fontColor)
				
				Section(header: Text("About")) {
					HStack {
						Text("Software Version")
						Spacer()
						Text("\(appVersion) (\(buildNumber))")
					}
				}
			}
		}
		.navigationBarTitle(Text("Settings"))
		.listStyle(GroupedListStyle())
	}
}

func test() {
	print("test")
}

struct Settings_Previews: PreviewProvider {
	static var previews: some View {
		Settings().environmentObject(AppData())
	}
}

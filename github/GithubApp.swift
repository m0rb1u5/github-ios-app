import ComposableArchitecture
import Entry
import SwiftUI

@main
struct GithubApp: App {
    var body: some Scene {
        WindowGroup {
            EntryView(
                store: Store(
                    initialState: Entry.State(),
                    reducer: Entry()
                )
            )
        }
    }
}

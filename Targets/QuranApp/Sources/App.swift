import SwiftUI

@main
struct QuranApp: App {
    var body: some Scene {
        WindowGroup {
            ChapterListView(viewModel: .init())
        }
    }
}

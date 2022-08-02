import SwiftUI

struct ChapterListView: View {
    @StateObject var viewModel: ChapterListViewModel
    @State private var selectedChapter: Chapter?
    
    var body: some View {
        NavigationSplitView {
            if let error = viewModel.error {
                Text(error.localizedDescription)
            } else {
                List(viewModel.chapters, selection: $selectedChapter) { chapter in
                    NavigationLink(chapter.translatedName.name, value: chapter)
                }
                .refreshable {
                    viewModel.getChapters()
                }
                .navigationTitle("Quran chapters")
            }
        } detail: {
            if let chapter = selectedChapter {
                ChapterDetailView(viewModel: .init(chapter: chapter))
            } else {
                Text("Pick a chapter")
            }
        }
        .onAppear {
            viewModel.getChapters()
        }
    }
}

struct ChapterListView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterListView(viewModel: .init())
        ChapterListView(viewModel: .init())
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
    }
}

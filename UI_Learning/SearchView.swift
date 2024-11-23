import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView {
            
            HStack {
                Text("Search")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                Button(action: {
                    // 能按下
                }) {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.black)
                }
            }
            .padding()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

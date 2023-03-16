//
//  RedactorView.swift
//  AdminWords.SwiftUI
//
//  Created by 111 on 07.10.2022.
//

import Foundation
import SwiftUI

struct RedactorView: View {
    enum RawBuilder: Identifiable {
        var id: String {
            switch(self) {
            case .switcher(let title, _): return title
            case .stringField(let title, _): return title
            }
        }
        case stringField(_ title: String, _ binding: Binding<String>)
        case switcher(_ title: String, _ binding: Binding<Bool>)
    }
    
    @resultBuilder
    struct ContentBuilder {
        static func buildBlock(_ parts: RawBuilder...) -> [RawBuilder] {
            parts
        }
    }
    
    private let title: String
    
   private var onPress: () -> Void
    
    @State private var isPresentingAlert: Bool = false
    @State private var testText = "jfie"
    
    let builder: [RawBuilder]
    
    init(title: String, @ContentBuilder builder: (RawBuilder.Type) -> [RawBuilder], onPress: @escaping () -> Void) {
        self.builder = builder(RawBuilder.self)
        self.onPress = onPress
        self.title = title
    }
    
    var body: some View {
                Form {
                    List(builder, id: \.id) { item in
                            switch (item) {
                            case .stringField(let title, let binding): stringField(title, binding)
                            case .switcher(let title, let binding): switcher(title, binding)
                            }
                    }
                    .navigationBarTitle(title, displayMode: .automatic)


                    Button("Update") {
                        isPresentingAlert = true
                        onPress()
                    }
                }
            .confirmationDialog("Are you sure?",
                                isPresented: $isPresentingAlert) {
                Button("Update") {
                    onPress()
                }
            } message: {
                Text("Are You shure tu update data? Yuo can't return old values.")
            }
    }
    
    private func stringField(_ title: String, _ binding: Binding<String>) -> some View {
        Section(title) {
                TextField(binding.wrappedValue, text: binding, axis: .vertical)
                    .truncationMode(.tail)
            }
    }
    
    private func switcher(_ title: String, _ binding: Binding<Bool>) -> some View {
            Section {
                Toggle(title, isOn: binding)
                    .frame(alignment: .leading)
        }
    }
    
    private func label(_ label: String) -> some View {
        Text(label)
            .frame(alignment: .leading)
            .font(.subheadline)
    }
}

struct WordRedactor: View {
    @State var word: WordData
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        RedactorView(title: "wordID: \(word.wordID.description)") { wrap in
            wrap.stringField("Englis", $word.english)
            wrap.stringField("Translate", $word.ruTranslate)
            wrap.stringField("Transcription", $word.engTranscription)
            wrap.stringField("Ru Transcription", $word.ruTranscription)
            wrap.stringField("Assotiation", $word.assotiation)
        } onPress: {
            dismiss()
        }
    }
}

struct UserRedactor: View {
    @State var user: UserData
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        RedactorView(title: "userID: \(user.userID)") { wrap in
            wrap.stringField("Login", $user.login)
            wrap.stringField("Birthaday", $user.birthday)
            wrap.stringField("Data payment", $user.dataPayed)
            wrap.stringField("Registration data", $user.dataOfRegistration)
            wrap.stringField("The last update", $user.theLastUpdate)
            wrap.switcher("Is payed", $user.isPayed)
        } onPress: {
            dismiss()
        }
    }
}

struct Previews_RedactorView_Previews: PreviewProvider {
    static var previews: some View {
        WordRedactor(word: WordData(testID: 40))
        UserRedactor(user: UserData(testID: "jdfde"))
        
        NavigationView {
            GeometryReader { geo in
                Color(.systemBlue)
                    .ignoresSafeArea(.all)
                VStack {
                    ViewThatFits {
                        Rectangle()
                            .foregroundColor(.green)
                            .frame(width: geo.size.width / 1.1, height: geo.size.height / 6)
                        Rectangle()
                            .foregroundColor(.indigo)
                            .frame(width: geo.size.width / 0.5, height: geo.size.height / 5)
                    }
                }
            }
        }
    }
}

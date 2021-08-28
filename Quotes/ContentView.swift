//
//  ContentView.swift
//  Quotes
//
//  Created by Amir Sediqi on 2021-08-26.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    
    @State var showAdd = false
    @ObservedObject var quotesFactory: QuotesFactory
    @State var quoteTextField: String = ""
    
    var body: some View {
        VStack {
            NavigationView{
                List {
                    ForEach(quotesFactory.quotes) { quote in
                QuoteCell(quote: quote)
                }
                    .onDelete(perform: { indexSet in
                        quotesFactory.quotes.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        quotesFactory.quotes.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    
                    Spacer()
                    Text("\(quotesFactory.quotes.count) Quotes")
                    Spacer()
            }
            .navigationTitle("Quotes")
                .toolbar {
                    
                    ToolbarItemGroup(placement: .navigationBarLeading){
                    Button("Add", action: newQuote)
                }
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                    EditButton()
                    }
                }
                // remove in case code doesnt work
                EditButton()
            }
            if showAdd{
            HStack {
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $quoteTextField)
               // TextField("Placeholder", text: Value)
                Button("save quote", action: saveQuote)
            }
            .padding(.all)
            .frame(height: 100)
            }
        }
    }
    func newQuote(){
        showAdd = true
    }
    
    func saveQuote() {
        let db = Firestore.firestore()
        db.collection("Quotes").document().setData(["quoteText": quoteTextField,"liked":false])
        showAdd = false
    }
}



struct QuoteCell: View {
   var quote: Quote
    var body: some View {
        NavigationLink(destination: QuoteDetail(quote: quote)){
            HStack {
                Image(systemName: quote.liked ? "heart.fill" : "heart")
                    .font(.title)
                    .padding(.all)
                Text(quote.quoteText)
                    .font(.title)
                    .padding(.vertical)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(quotesFactory: testFactory)
    }
}

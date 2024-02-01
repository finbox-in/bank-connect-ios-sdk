//
//  ContentView.swift
//  BankConnectSample
//
//  Created by Ashutosh Jena on 12/12/23.
//

import SwiftUI
import BankConnect

struct ContentView: View {
    
    @State var isBCScreenShown = false
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: startBC(), isActive: $isBCScreenShown) {
                    bcButtonClicked()
                }
            }
        }
        .padding()
    }
    
    func bcButtonClicked() -> some View {
        Button(action: {
            isBCScreenShown = true
        }, label: {
            Text("Start BankConnect")
        }).buttonStyle(.borderedProminent)
    }
    
    func startBC() -> some View {
        let _ = BankConnect.Builder()
            .apiKey(key: "YOUR_API_KEY")
            .linkId(id: "UNIQUE_ID")
            .fromDate(start: "DD/MM/YYYY")
            .toDate(end: "DD/MM/YYYY")
            .journeyMode(mode: JourneyMode.NORMAL)
            .build()
        
        return BankView() {
            payload in
            debugPrint("Result Payload: Message", payload.message ?? "Message is empty")
        }.navigationBarHidden(true)
    }
}

#Preview {
    ContentView()
}

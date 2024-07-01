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
            .apiKey("YOUR_API_KEY")
            .linkId("UNIQUE_ID")
            .fromDate("DD/MM/YYYY")
            .toDate("DD/MM/YYYY")
            .mode(Mode.PDF)
            .journeyMode(JourneyMode.NORMAL)
            .mobileNumber("7978646904")
            .aaJourneyMode(AAJourneyMode.ONLY_ONCE)
            .aaRecurringFrequencyUnit(AARecurringFrequencyUnit.DAY)
            .aaRecurringFrequencyValue(3)
            .aaRecurringTenureMonthCount(2)
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

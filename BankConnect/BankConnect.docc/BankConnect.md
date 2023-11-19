BankConnect IOS SDK
===================

BankConnect IOS SDK enables the user to grant access to their bank statement through Manual upload or Account Aggregator or Net banking.


## Add BankConnect

Add the library to Pod file

```
pod 'BankConnect'
```


## Build BankConnect

Build BankConnect with API Key, Link Id

```
let _ = FinBoxBankConnect.Builder()
    .linkId(id: UUID().uuidString)
    .apiKey(key: apiKey)
    .build();
```


## Show BankConnect Screen

Show the Bank Screen

```
BankView() {
    payload in
    // Success Response - Valid Entity Id
    debugPrint("Entity Id", payload.entityId)
}
```

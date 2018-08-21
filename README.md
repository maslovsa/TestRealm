# TestRealm

This project shows how to add 2 simple objects to Realm DB.
```
let messages = [Message("hello"), Message("world")]

Observable.from(messages)
  .subscribe(Realm.rx.add())
```
Docs: https://github.com/RxSwiftCommunity/RxRealm

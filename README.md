# flutter_anywhere_test

This app is a sample code exercise using build flavors and having unique experience for tablets vs phones. 
Because the app is intended to use flavors, if none is passed in, the API which loads as a result is content from The Wire.

## Running flavors of the application

To run the Simpsons flavor use the command below:
```
flutter run --flavor=simpsons --dart-define=app.flavor=simpsons
```

To run the Wire flavor use the following command:
```
flutter run --flavor=wire --dart-define=app.flavor=wire
```

## Running Tests

To run the tests within the project and view the results in a browser window run the following three commands:
```
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

# monarch_easy_localization_sample

Monarch sample code and stories using the [easy_localization](https://github.com/aissat/easy_localization) package.

_Monarch is a tool for building Flutter widgets in isolation. It makes it easy to build, test and debug complex UIs. Find out more at https://monarchapp.io_

To use easy_localization with Monarch you have to define your own `LocalizationsDelegate`. You can then annotate an instance of that delegate with the `MonarchLocalizations` annotation.

You can see the sample implementation in [lib/easy_localizations_delegate.dart](lib/easy_localizations_delegate.dart).

This `LocalizationsDelegate` definition is only for Monarch. Your easy_localization app won't need it.

To run the easy_localization sample stories:
```
`monarch run`
```

To run the easy_localization demo app:
```
flutter run
```

If you need more details, here are the [Monarch internationalization docs](https://monarchapp.io/docs/internationalization).
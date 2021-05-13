# monarch_easy_localization_sample

Monarch sample code and stories using the [easy_localization](https://github.com/aissat/easy_localization) package.

_Monarch is a tool for Flutter developers. It makes building beautiful widgets a more pleasant and faster experience. Find out more at https://monarchapp.io_

To use easy_localization with Monarch you have to define your own `LocalizationsDelegate`. You can then annotate an instance of that delegate with the `MonarchLocalizations` annotation.

You can see the sample implementation in [lib/easy_localizations_delegate.dart](lib/easy_localizations_delegate.dart).

This `LocalizationsDelegate` definition is only for Monarch. Your easy_localization app won't need it.

To run the stories:
```
`monarch run`
```

To run the demo app:
```
flutter run
```

If you need more details, here are the [Monarch internationalization docs](https://monarchapp.io/docs/internationalization).
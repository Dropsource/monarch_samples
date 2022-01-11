# monarch_samples_intl_tools

Monarch sample code and stories using [intl](https://github.com/dart-lang/intl) 
package and tools.

_Monarch is a tool for Flutter developers. It makes building beautiful widgets a more pleasant and faster experience. Find out more at https://monarchapp.io_

To use intl tools with Monarch you have to annotate the generated `LocalizationsDelegate` 
with the `MonarchLocalizations` annotation. To annotate it, you will have to 
create a new dart library in your lib directory, then import the generated 
source file so you can annotate an instance of your `LocalizationsDelegate`. 

You can see the sample implementation in 
[lib/intl_localizations_delegate.dart](lib/intl_localizations_delegate.dart)

This `LocalizationsDelegate` definition is only for Monarch. Your intl app 
won't need it.

To run the intl sample stories:
1. `flutter pub get`
2. Run the intl code generation: `flutter pub run build_runner build`
3. Run monarch: `monarch run`
4. Once the Monarch UI launches, select a story, then change the locale 
   using the Locale dropdown, see how the story changes based on the locale
   selected.

If you need more details, here are the [Monarch internationalization docs](https://monarchapp.io/docs/internationalization).

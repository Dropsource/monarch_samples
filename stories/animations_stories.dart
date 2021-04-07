import 'package:flutter/widgets.dart';
import 'package:monarch_samples/animations/flutter/progress_button.dart';
import 'package:monarch_samples/animations/lottie/lottie_animated_widget.dart';

Widget lottie_animated_widget() => LottieAnimatedWidget();

Widget progress_button_default() => ProgressButton(
      'Click me',
      onPressed: () {},
    );

Widget progress_button_spinning() => ProgressButton(
      'Click me',
      loading: true,
      onPressed: () {},
    );

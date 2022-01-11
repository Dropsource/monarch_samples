import 'package:flutter/widgets.dart';
import 'package:monarch_samples_patterns/animations/flutter/resizable_box.dart';
import 'package:monarch_samples_patterns/animations/flutter/progress_button.dart';
import 'package:monarch_samples_patterns/animations/flutter/collapsable_box.dart';
import 'package:monarch_samples_patterns/animations/lottie/lottie_animated_widget.dart';

Widget lottie_animated_widget() => LottieAnimatedWidget();

Widget implicit_animation_example() => ResizableBox();

Widget explicit_animation_example() => CollapsableBox();

Widget progress_button_default() => ProgressButton(
      'Sign up',
      onPressed: () {},
    );

Widget progress_button_disabled() => ProgressButton(
      'Sign up',
      onPressed: null,
    );

Widget progress_button_spinning() => ProgressButton(
      'Loading',
      loading: true,
      onPressed: () {},
    );

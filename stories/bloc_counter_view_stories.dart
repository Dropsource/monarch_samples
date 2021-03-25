import 'package:flutter/widgets.dart';
import 'package:monarch_samples/bloc/bloc_counter/bloc_counter_screen.dart';

import 'useful_mocks.dart';

// ignore: non_constant_identifier_names
Widget bloc_counter_from_zero() =>
    mockBlocProvider(CounterCubit(), child: BlocCounterView());

// ignore: non_constant_identifier_names
Widget bloc_counter_with_initial_nonzero_value() =>
    mockBlocProvider(CounterCubit(initialState: 100), child: BlocCounterView());

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monarch_samples/bloc/bloc_counter/bloc_counter_screen.dart';

// ignore_for_file: non_constant_identifier_names
Widget bloc_counter_from_zero() =>
    BlocProvider.value(value: CounterCubit(), child: BlocCounterView());

Widget bloc_counter_with_initial_nonzero_value() => BlocProvider.value(
    value: CounterCubit(initialState: 100), child: BlocCounterView());

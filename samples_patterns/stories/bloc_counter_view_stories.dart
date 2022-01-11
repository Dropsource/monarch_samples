import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monarch_samples_patterns/bloc/bloc_counter/bloc_counter_screen.dart';

Widget zero() =>
    BlocProvider.value(value: CounterCubit(), child: BlocCounterView());

Widget nonzero() => BlocProvider.value(
    value: CounterCubit(initialState: 100), child: BlocCounterView());

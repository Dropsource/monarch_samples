import 'package:flutter/material.dart';
import 'package:monarch_samples/provider/current_date_provider.dart';
import 'package:monarch_samples/provider/read_from_provider_screen.dart';

import 'useful_mocks.dart';

// ignore: non_constant_identifier_names
Widget past_date() => mockProvider(
    CurrentDateProvider(
      currentDateFn: () => 'Jan 1, 1970',
    ),
    child: ReadFromProviderScreen());

// ignore: non_constant_identifier_names
Widget current_date_different_format() => mockProvider(
    CurrentDateProvider(
      currentDateFn: () => DateTime.now().toString(),
    ),
    child: ReadFromProviderScreen());

// ignore: non_constant_identifier_names
Widget future_date() => mockProvider(
    CurrentDateProvider(
      currentDateFn: () => 'Jan 1, 2030',
    ),
    child: ReadFromProviderScreen());

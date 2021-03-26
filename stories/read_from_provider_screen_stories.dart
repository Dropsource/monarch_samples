import 'package:flutter/material.dart';
import 'package:monarch_samples/provider/current_date_provider.dart';
import 'package:monarch_samples/provider/read_from_provider_screen.dart';
import 'package:provider/provider.dart';

// ignore_for_file: non_constant_identifier_names
Widget past_date() => Provider.value(
    value: CurrentDateProvider(
      currentDateFn: () => 'Jan 1, 1970',
    ),
    child: ReadFromProviderScreen());

Widget current_date_different_format() => Provider.value(
    value: CurrentDateProvider(
      currentDateFn: () => DateTime.now().toString(),
    ),
    child: ReadFromProviderScreen());

Widget future_date() => Provider.value(
    value: CurrentDateProvider(
      currentDateFn: () => 'Jan 1, 2030',
    ),
    child: ReadFromProviderScreen());

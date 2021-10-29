// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:monarch_samples/provider/current_date.dart';
import 'package:monarch_samples/provider/provider_screen.dart';
import 'package:provider/provider.dart';

Widget past_date() => Provider.value(
    value: CurrentDate(
      currentDateFn: () => 'Jan 1, 1970',
    ),
    child: ProviderScreen());

Widget current_date_different_format() => Provider.value(
    value: CurrentDate(
      currentDateFn: () => DateTime.now().toString(),
    ),
    child: ProviderScreen());

Widget future_date() => Provider.value(
    value: CurrentDate(
      currentDateFn: () => 'Jan 1, 2030',
    ),
    child: ProviderScreen());

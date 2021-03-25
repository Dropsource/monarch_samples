import 'package:flutter/material.dart';
import 'package:monarch_samples/bloc/list_complex/item.dart';
import 'package:monarch_samples/bloc/list_complex/list_complex_screen.dart';
import 'package:monarch_samples/bloc/list_complex/list_cubit.dart';
import 'package:monarch_samples/bloc/list_complex/list_state.dart';

import 'mocked_implementations.dart';
import 'useful_mocks.dart';

// ignore: non_constant_identifier_names
Widget complex_list_loading() => mockBlocProvider(
    ListCubit(
        repository: MockedRepository(),
        defaultState: const ListState.loading()),
    child: ListComplexScreen());

// ignore: non_constant_identifier_names
Widget complex_list_loaded() => mockBlocProvider(
    ListCubit(
        repository: MockedRepository(),
        defaultState: const ListState.success([
          Item(id: '1', value: 'Hello'),
          Item(id: '2', value: 'World'),
          Item(id: '3', value: 'From'),
          Item(id: '4', value: 'Monarch'),
        ])),
    child: ListComplexScreen());

// ignore: non_constant_identifier_names
Widget complex_list_first_item_deleting() => mockBlocProvider(
    ListCubit(
        repository: MockedRepository(),
        defaultState: const ListState.success([
          Item(id: '1', value: 'Hello', isDeleting: true),
          Item(id: '2', value: 'World'),
          Item(id: '3', value: 'From'),
          Item(id: '4', value: 'Monarch'),
        ])),
    child: ListComplexScreen());

// ignore: non_constant_identifier_names
Widget complex_list_failure() => mockBlocProvider(
    ListCubit(
        repository: MockedRepository(),
        defaultState: const ListState.failure()),
    child: ListComplexScreen());

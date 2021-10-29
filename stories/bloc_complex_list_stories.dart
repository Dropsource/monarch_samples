import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monarch_samples/bloc/list_complex/item.dart';
import 'package:monarch_samples/bloc/list_complex/list_complex_screen.dart';
import 'package:monarch_samples/bloc/list_complex/list_cubit.dart';
import 'package:monarch_samples/bloc/list_complex/list_state.dart';

import 'mocked_repository.dart';

Widget loading() => BlocProvider.value(
    value: ListCubit(
        repository: MockedRepository(),
        defaultState: const ListState.loading()),
    child: ListComplexScreen());

Widget fetch() {
  final listCubit = ListCubit(repository: MockedRepository());
  listCubit.fetchList();
  return BlocProvider.value(value: listCubit, child: ListComplexScreen());
}

Widget success() => BlocProvider.value(
    value: ListCubit(
        repository: MockedRepository(),
        defaultState: const ListState.success([
          Item(id: '1', value: 'Hello'),
          Item(id: '2', value: 'World'),
          Item(id: '3', value: 'From'),
          Item(id: '4', value: 'Monarch'),
        ])),
    child: ListComplexScreen());

Widget deleting() => BlocProvider.value(
    value: ListCubit(
        repository: MockedRepository(),
        defaultState: const ListState.success([
          Item(id: '1', value: 'Hello', isDeleting: true),
          Item(id: '2', value: 'World'),
          Item(id: '3', value: 'From'),
          Item(id: '4', value: 'Monarch'),
        ])),
    child: ListComplexScreen());

Widget failure() => BlocProvider.value(
    value: ListCubit(
        repository: MockedRepository(),
        defaultState: const ListState.failure()),
    child: ListComplexScreen());

Widget long_list() {
  var items = <Item>[];
  for (var i = 0; i < 100; i++) {
    items.add(Item(id: i.toString(), value: 'Item $i'));
  }
  return BlocProvider.value(
      value: ListCubit(
          repository: MockedRepository(),
          defaultState: ListState.success(items)),
      child: ListComplexScreen());
}

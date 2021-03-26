import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../platform_route.dart';
import 'item.dart';
import 'list_cubit.dart';
import 'list_state.dart';

class ListComplexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complex List')),
      body: BlocBuilder<ListCubit, ListState>(
        builder: (context, state) {
          switch (state.status) {
            case ListStatus.failure:
              return const Center(child: Text('Oops something went wrong!'));
            case ListStatus.success:
              return _ListView(items: state.items);
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  static String tag = 'list-complex-screen';

  static Route route(BuildContext context) => platformRoute(
        context,
        builder: (_) => ListComplexScreen(),
        settings: RouteSettings(name: tag),
      );
}

class _ListView extends StatelessWidget {
  const _ListView({Key? key, required this.items}) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? const Center(child: Text('no content'))
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _ItemTile(
                item: items[index],
                onDeletePressed: (id) {
                  context.read<ListCubit>().deleteItem(id);
                },
              );
            },
            itemCount: items.length,
          );
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({
    Key? key,
    required this.item,
    required this.onDeletePressed,
  }) : super(key: key);

  final Item item;
  final ValueSetter<String> onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('#${item.id}'),
      title: Text(item.value),
      trailing: item.isDeleting
          ? const CircularProgressIndicator()
          : IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => onDeletePressed(item.id),
            ),
    );
  }
}

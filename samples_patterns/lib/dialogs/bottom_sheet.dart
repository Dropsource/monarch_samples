import 'package:flutter/material.dart';

class BottomSheetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
            onPressed: () => showBottomSheet(
                context: context,
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(),
                ),
                backgroundColor: Theme.of(context).dialogBackgroundColor,
                builder: (ctx) => Container(
                    height: 200,
                    child: Center(
                      child: Text('Bottom sheet',
                          style: Theme.of(context).textTheme.headline6),
                    ))),
            style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                backgroundColor: Theme.of(context).backgroundColor),
            child: Text('Show bottom sheet')));
  }
}

class ModalBottomSheetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
            onPressed: () => showModalBottomSheet(
                context: context,
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(),
                ),
                backgroundColor: Theme.of(context).dialogBackgroundColor,
                builder: (ctx) => Container(
                    height: 200,
                    child: Center(
                      child: Text('Modal bottom sheet',
                          style: Theme.of(context).textTheme.headline6),
                    ))),
            style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                backgroundColor: Theme.of(context).backgroundColor),
            child: Text('Show modal bottom sheet')));
  }
}

class ScaffoldBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:
              Text('Scaffold', style: Theme.of(context).textTheme.headline5)),
      bottomSheet: Container(
          height: 200,
          color: Theme.of(context).dialogBackgroundColor,
          child: Center(
            child: Text('Scaffold bottom sheet',
                style: Theme.of(context).textTheme.headline6),
          )),
    );
  }
}

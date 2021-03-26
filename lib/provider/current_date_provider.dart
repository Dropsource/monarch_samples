class CurrentDateProvider {
  final Function? currentDateFn;

  CurrentDateProvider({this.currentDateFn});

  String? currentDateAsString() {
    return currentDateFn!();
  }
}

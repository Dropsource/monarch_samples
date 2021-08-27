class CurrentDate {
  final Function? currentDateFn;

  CurrentDate({this.currentDateFn});

  String? currentDateAsString() {
    return currentDateFn!();
  }
}

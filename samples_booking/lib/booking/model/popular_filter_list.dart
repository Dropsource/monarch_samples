class PopularFilterListData {
  PopularFilterListData({
    this.titleTxt = '',
    this.isSelected = false,
  });

  String titleTxt;
  bool isSelected;

  static List<PopularFilterListData> popularFList = <PopularFilterListData>[
    PopularFilterListData(
      titleTxt: 'free-breakfast',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'free-parking',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'free-wi-fi',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'pool',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'pet-friendly',
      isSelected: false,
    ),
  ];

  static List<PopularFilterListData> accomodationList = [
    PopularFilterListData(
      titleTxt: 'all',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'apartment',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'home',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'hotel',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'resort',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'villa',
      isSelected: false,
    ),
  ];
}

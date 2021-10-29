import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'model/booking_list_data.dart';

import 'package:flutter/widgets.dart';

class BookingListAnimated extends StatefulWidget {
  final List<BookingListData> list;

  BookingListAnimated({required this.list});
  @override
  State<StatefulWidget> createState() {
    return _BookingListAnimatedState();
  }
}

class _BookingListAnimatedState extends State<BookingListAnimated>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  _BookingListAnimatedState();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      padding: const EdgeInsets.only(top: 8),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        final int count =
            widget.list.length > 10 ? 10 : widget.list.length;
        final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(
                parent: animationController,
                curve: Interval((1 / count) * index, 1.0,
                    curve: Curves.fastOutSlowIn)));
        animationController.forward();
        return BookingItemAnimated(
          callback: () {},
          itemData: widget.list[index],
          animation: animation,
          animationController: animationController,
        );
      },
    );
  }
}

class BookingItemAnimated extends StatelessWidget {
  const BookingItemAnimated(
      {Key? key,
      this.itemData,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  final VoidCallback? callback;
  final BookingListData? itemData;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: _BookingItem(callback: callback, itemData: itemData),
          ),
        );
      },
    );
  }
}

class _BookingItem extends StatelessWidget {
  const _BookingItem({
    Key? key,
    this.callback,
    required this.itemData,
  }) : super(key: key);

  final VoidCallback? callback;
  final BookingListData? itemData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 24, right: 24, top: 8, bottom: 16),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: callback,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.6),
                offset: const Offset(4, 4),
                blurRadius: 16,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 2,
                      child: Image.asset(
                        itemData!.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      color: Theme.of(context).cardColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 8, bottom: 8),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      itemData!.titleTxt,
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context).textTheme.headline6
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          itemData!.subTxt,
                                          style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.mapMarkerAlt,
                                          size: 12,
                                          color: Theme.of(context)
                                              .primaryColor,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${itemData!.dist.toStringAsFixed(1)} km to city',
                                            overflow:
                                                TextOverflow.ellipsis,
                                            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 4),
                                      child: Row(
                                        children: <Widget>[
                                          RatingBar(
                                            initialRating:
                                                itemData!.rating,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 24,
                                            ratingWidget: RatingWidget(
                                              full: Icon(
                                                Icons.star_rate_rounded,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              half: Icon(
                                                Icons.star_half_rounded,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              empty: Icon(
                                                Icons
                                                    .star_border_rounded,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                            itemPadding:
                                                EdgeInsets.zero,
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          Text(
                                            ' ${itemData!.reviews} Reviews',
                                            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 16, top: 8),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              crossAxisAlignment:
                                  CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  '\$${itemData!.perNight}',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.headline6
                                ),
                                Text(
                                  '/per night',
                                  style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(32.0),
                      ),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.favorite_border,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

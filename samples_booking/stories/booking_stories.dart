import 'package:samples_booking/booking/booking_home_screen.dart';
import 'package:samples_booking/booking/booking_list.dart';
import 'package:samples_booking/booking/calendar_popup_view.dart';
import 'package:samples_booking/booking/filters_screen.dart';
import 'package:samples_booking/booking/model/booking_list_data.dart';
import 'package:flutter/material.dart';

Widget app_bar() => Column(children: const [BookingAppBar()]);
Widget search_bar() => Column(children: const [BookingSearchBar()]);
Widget dates_room_bar() => Builder(
    builder: (context) => Container(
          // color: Colors.grey[200],
          child: Column(children: [
            BookingDatesRoomsBar(
              startDate: DateTime.now(),
              endDate: DateTime.now().add(const Duration(days: 3)),
            )
          ]),
        ));
Widget filter_bar() => Column(children: const [BookingFilterBar()]);

Widget listing() => BookingListAnimated(list: [BookingListData.listings[0]]);
Widget listings() => BookingListAnimated(list: BookingListData.listings);

Widget calendar() => CalendarPopupView(
      barrierDismissible: true,
      minimumDate: DateTime.now(),
      initialStartDate: DateTime.now(),
      initialEndDate: DateTime.now().add(const Duration(days: 5)),
    );

Widget filters() => FiltersScreen();

Widget screen() => BookingHomeScreen();

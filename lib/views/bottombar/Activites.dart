import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Activites extends StatefulWidget {
  const Activites({super.key});

  @override
  State<Activites> createState() => _ActivitesState();
}

class _ActivitesState extends State<Activites> {
  DateTime today = DateTime.now();
  bool _isCalendarVisible = false;
  bool isactivityfound = false;

  void _ondayselected(DateTime day, DateTime Focusedday) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MMMM dd').format(today);
    String DayName = DateFormat('EEEE').format(today);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text('Activity Timeline'),
            SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _isCalendarVisible = !_isCalendarVisible;
                });
              },
              icon: _isCalendarVisible
                  ? Icon(Icons.arrow_drop_up)
                  : Icon(Icons.arrow_drop_down),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text(
              "Today",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.transparent)),
              onPressed: () {},
              icon: Icon(
                Icons.arrow_drop_up,
                color: Color(0xFF16a2b5),
              ),
              label: isactivityfound
                  ? Text("Loading more")
                  : Text(
                      "LOAD PERVIOUS ACTIVITES",
                      style: TextStyle(
                        color: Color(0xFF16a2b5),
                      ),
                    ),
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFF16a2b5),
                      borderRadius: BorderRadius.circular(22)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formattedDate,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          DayName,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _isCalendarVisible
                ? TableCalendar(
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    availableGestures: AvailableGestures.all,
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    onDaySelected: _ondayselected,
                    focusedDay: today,
                    firstDay: DateTime.utc(2000, 1, 1),
                    lastDay: DateTime.utc(2050, 12, 12),
                  )
                : Container(),
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'You don\'t have any activities on this day',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                color: Colors.purple.shade50,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.info, color: Colors.purple),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        'You can create future-dated activities for your clients, which will appear here and give you upcoming activity alerts.',
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

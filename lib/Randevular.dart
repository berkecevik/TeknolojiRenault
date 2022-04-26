import 'package:flutter/material.dart';
import 'package:teknolojirenault/main.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
class Randevular extends StatefulWidget{
  const Randevular ({Key? key}) : super (key: key);
  @override
  _RandevularState createState() => _RandevularState();
}

class _RandevularState extends State<Randevular> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Randevularım"),
      ),
      body: SfCalendar(
        view: CalendarView.month,
        dataSource: MeetingDataSource(_getDataSource()),
        monthViewSettings: MonthViewSettings(
          showAgenda: true,
            agendaItemHeight: 50,
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
      ),
    );

  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
    DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(Duration(hours: 2));
    meetings.add(
        Meeting("Randevu", startTime, endTime, Color(0xFF0F8644), false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
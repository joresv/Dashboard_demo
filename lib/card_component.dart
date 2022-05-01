import 'package:dashboard_dark/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              width: 6,
              color: Colors.white.withOpacity(.5),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(.51),
                Colors.white.withOpacity(.0),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Balance',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'regular',
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '95,500',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'semi_bold',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: formatCardNumber("3546")),
                  Image.asset(
                    Config.assets.sim,
                    width: 50,
                  )
                ],
              ),
              Row(
                children: [
                  item('Valid thru', '09/24'),
                  SizedBox(
                    width: 50,
                  ),
                  item('Valid thru', 'OnProgramme'),
                ],
              )
            ],
          ),
        ),
        Positioned(
            bottom: 15,
            right: 20,
            child: Image.asset(
              Config.assets.visa,
              width: 80,
            ))
      ],
    );
  }

  Widget item(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            fontFamily: 'regular',
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            fontFamily: 'semi_bold',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class VisitComponent extends StatelessWidget {
  const VisitComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          width: 6,
          color: Colors.white.withOpacity(.5),
        ),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(.51),
            Color(0xFF00FFE0).withOpacity(.24),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Config.colors.aqua2,
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.more_vert,
                color: Colors.white,
              )
            ],
          ),
          Text(
            "120.000",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: 'semi_bold',
              color: Colors.white,
            ),
          ),
          Text(
            "Visitors This Month",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              fontFamily: 'regular',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class CalendarComponent extends StatelessWidget {
  const CalendarComponent({Key? key, this.isMin = false}) : super(key: key);
  final bool isMin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMin ? 280 : 350,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          width: 6,
          color: Colors.white.withOpacity(.5),
        ),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(.51),
            Colors.white.withOpacity(.0),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SfDateRangePicker(
        rangeSelectionColor: Config.colors.greenDark,
        endRangeSelectionColor: Config.colors.greenDark,
        selectionMode: DateRangePickerSelectionMode.range,
        selectionColor: Config.colors.greenLight,
        todayHighlightColor: Colors.white,
        selectionTextStyle: TextStyle(
          color: Config.colors.greenLight,
        ),
        rangeTextStyle: TextStyle(
          color: Config.colors.greenLight,
        ),
        monthCellStyle: DateRangePickerMonthCellStyle(
          textStyle: TextStyle(
            fontWeight: FontWeight.w900,
            color: Config.colors.grey3,
          ),
          // trailingDatesDecoration: BoxDecoration(
          //   color: Config.colors.grey3,
          //   borderRadius: BorderRadius.circular(10),
          // ),
          todayTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        selectionRadius: 40,
      ),
    );
  }
}

class ReviewComponent extends StatelessWidget {
  const ReviewComponent({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.avatars,
    required this.color,
    required this.icon,
    required this.colors,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final String icon;
  final List<String> avatars;
  final List<Color> colors;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 161,
          padding: EdgeInsets.only(left: 50, right: 15, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 6,
              color: Colors.white.withOpacity(.1),
            ),
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'semi_bold',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'regular',
                        color: Color.fromRGBO(149, 144, 160, 1),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: avatars
                          .map((e) => Container(
                                margin: EdgeInsets.only(right: 5),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(e),
                                  radius: 15,
                                ),
                              ))
                          .toList(),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                child: SvgPicture.asset(
                  icon,
                ),
              )
            ],
          ),
        ),
        Container(
          // margin: EdgeInsets.only(left: 5),
          height: 161,
          width: 13,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(15),
              )),
        )
      ],
    );
  }
}

class NewReminder extends StatefulWidget {
  const NewReminder({Key? key}) : super(key: key);

  @override
  State<NewReminder> createState() => _NewReminderState();
}

class _NewReminderState extends State<NewReminder> {
  List<Widget> users = [];
  @override
  Widget build(BuildContext context) {
    final reminders = [
      Reminder("Work meeting", Config.assets.work, Color(0xFFC8372D)),
      Reminder("Party", Config.assets.water, Color(0xFFD1941A)),
      Reminder("Call", Config.assets.call, Color(0xFF37833B)),
      Reminder("Other", Config.assets.other, Color(0xFF2264D1)),
    ];
    return Container(
      width: 350,
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 6,
          color: Colors.white.withOpacity(.1),
        ),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(173, 173, 173, 1),
            Color.fromRGBO(65, 65, 65, 0.7),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Create a new reminder",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'semi_bold',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Config.colors.background,
                      border: Border.all(
                        color: Color(0xFF7DBAEE),
                      ),
                    ),
                    alignment: Alignment.center,
                    height: 60,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        constraints: BoxConstraints(maxHeight: 40),
                        labelText: "Name",
                        labelStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF7DBAEE),
                        ),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        suffixIcon: Icon(
                          Icons.close,
                          color: Color(0xFF7DBAEE),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "reminder type".toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Wrap(
                    children: reminders
                        .map(
                          (e) => Container(
                            margin: EdgeInsets.only(right: 8, bottom: 8),
                            child: Chip(
                              label: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(e.icon),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    e.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              backgroundColor: e.color,
                              padding: EdgeInsets.all(8),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "event details".toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        FeatherIcons.clock,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "9:00 AM — 10:00 AM",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'regular',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Friday, May 3",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'regular',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Wrap(
                            children: [
                              ...users.map((e) => e).toList(),
                              InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: () {
                                  int index = users.length;
                                  if (index >= 6) return;
                                  users.add(
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/a${index + 1}.png'),
                                        radius: 16,
                                      ),
                                    ),
                                  );
                                  setState(() {});
                                },
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        FeatherIcons.mapPin,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          "Add location",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'regular',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        FeatherIcons.menu,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          "Add description",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'regular',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    // hello
                    colors: [
                      Color(0xFF68CAEB),
                      Color(0xFF7DBAEE),
                      Color(0xFFAE90F2),
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Create reminder",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'semi_bold',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Reminder {
  String name;
  String icon;
  Color color;
  Reminder(this.name, this.icon, this.color);
}

class Statistic extends StatelessWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 6,
          color: Colors.white.withOpacity(.1),
        ),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(220, 220, 220, 0.48),
            Color.fromRGBO(77, 77, 78, 1),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Activities',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'semi_bold',
              color: Colors.white,
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 1,
          ),
          Expanded(
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis:
                    NumericAxis(minimum: 0, maximum: 40, interval: 10),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_ChartData, String>>[
                  AreaSeries<_ChartData, String>(
                      dataSource: <_ChartData>[
                        _ChartData('Jan', 10),
                        _ChartData('Feb', 15),
                        _ChartData('Mar', 12),
                        _ChartData('Apr', 18),
                        _ChartData('May', 16),
                        _ChartData('Jun', 20),
                        _ChartData('Jul', 25),
                        _ChartData('Aug', 22),
                        _ChartData('Sep', 18),
                        _ChartData('Oct', 15),
                        _ChartData('Nov', 12),
                        _ChartData('Dec', 10),
                        _ChartData('Jan1', 10),
                        _ChartData('Feb2', 15),
                        _ChartData('Mar3', 12),
                        _ChartData('Apr4', 18),
                        _ChartData('May5', 16),
                        _ChartData('Jun6', 20),
                        _ChartData('Jul7', 25),
                        _ChartData('Aug8', 22),
                        _ChartData('Sep9', 18),
                        _ChartData('Oct10', 15),
                        _ChartData('Nov11', 12),
                        _ChartData('Dec12', 10),
                      ],
                      xValueMapper: (_ChartData data, _) => data.x,
                      yValueMapper: (_ChartData data, _) => data.y,
                      name: 'Gold',
                      color: Color.fromRGBO(8, 142, 255, 1))
                ]),
          )
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

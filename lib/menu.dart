import 'package:dashboard_dark/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Menu extends StatefulWidget {
  Menu({Key? key, this.isVisible = true}) : super(key: key);
  final bool isVisible;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final List<String> menuItems = [
    'Dashboard',
    'Analystics',
    'Peaple',
    'Company',
    'Documents',
    'Client chat',
  ];

  final icons = List.generate(6, (index) => "assets/icons/m${index + 1}.svg");
  String select = "Dashboard";
  // final asset = "assets/icons/m1.svg";
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      width: widget.isVisible
          ? 300
          : width < 400
              ? 0
              : 60,
      duration: Duration(milliseconds: 700),
      padding: EdgeInsets.symmetric(
        horizontal: !widget.isVisible ? 15 : 25,
      ).copyWith(top: 20),
      decoration: BoxDecoration(
        color: Config.colors.menuColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(10, 0),
            blurRadius: 20,
            color: Config.colors.menuColor,
          ),
        ],
      ),
      child: Column(
        children: [
          AnimatedOpacity(
            duration: Duration(milliseconds: 700),
            opacity: widget.isVisible ? 1 : 0,
            child: AnimatedContainer(
              width: widget.isVisible ? 300 : 1,
              duration: Duration(milliseconds: 700),
              child: Text(
                'PersonalDS',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'semi_bold',
                  color: Colors.white,
                ),
                maxLines: 1,
              ),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(top: 70),
            child: Column(
              children: [
                ...menuItems.map((e) {
                  final index = menuItems.indexOf(e);
                  final isSelect = select == e;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    child: AnimatedContainer(
                      width: widget.isVisible ? 300 : 70,
                      duration: Duration(milliseconds: 700),
                      margin: EdgeInsets.only(bottom: 30),
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () {
                          select = e;
                          setState(() {});
                        },
                        child: SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                icons[index],
                                color: isSelect
                                    ? Colors.white
                                    : Colors.white.withOpacity(.5),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                e,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'medium',
                                  color: isSelect
                                      ? Colors.white
                                      : Colors.white.withOpacity(.5),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList()
              ],
            ),
          ))
        ],
      ),
    );
  }
}

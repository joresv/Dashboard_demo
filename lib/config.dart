import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Config {
  static final colors = _Colors();
  static final assets = _Assets();
}

class _Colors {
  final background = Color(0xFF2E2E30);
  final menuColor = Color(0xFF1A1A1A);
  final aqua = Color(0xFF68CAEB);
  final aqua2 = Color(0xFF00FFE0);
  final grey = Color(0xFF9590A0);
  final grey2 = Color(0xFFEEECF1);
  final grey3 = Color(0xFF3C3844);
  final greenDark = Color(0xFF132C14);
  final greenLight = Color(0xFFA9D3AB);
}

class _Assets {
  final user = "assets/images/user.png";

  final sim = "assets/icons/sim.png";
  final visa = "assets/icons/visa.png";
  final water = "assets/icons/water.svg";
  final work = "assets/icons/work.svg";
  final call = "assets/icons/call.svg";
  final other = "assets/icons/other.svg";
}

Widget formatCardNumber(String cardNumber) {
  List<Widget> mask = [];
  for (var i = 0; i < 3; i++) {
    mask.add(Container(
      margin: EdgeInsets.only(right: 20),
      child: Row(
        children: [
          for (var i = 0; i < 4; i++)
            Container(
              margin: EdgeInsets.only(right: 2),
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            )
        ],
      ),
    ));
  }
  mask.add(Text(
    cardNumber,
    style: TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.bold,
      fontFamily: 'regular',
      color: Colors.white,
    ),
  ));
  return Row(
    children: mask,
  );
}

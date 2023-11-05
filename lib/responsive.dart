import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablette;
  final Widget desktop;

  const Responsive(
      {super.key,
      required this.mobile,
      required this.tablette,
      required this.desktop});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool istablette(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names, no_leading_underscores_for_local_identifiers
    final Size _size = MediaQuery.of(context).size;

    if (_size.width < 800) {
      return mobile;
    } else if (_size.width < 1100 && _size.width >= 800) {
      return tablette;
    } else {
      return desktop;
    }
  }
}

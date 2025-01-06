import 'package:flutter/material.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({Key? key}) : super(key: key);

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: Center(
          child: Text("Pagina about_me"),
        ),
    );
  }
}

import 'package:flutter/material.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: Center(
          child: Text("Pagina Achievements"),
        ),
    );
  }
}

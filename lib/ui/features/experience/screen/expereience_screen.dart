import 'package:flutter/material.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: Center(
          child: Text("Pagina Experience"),
        ),
    );
  }
}

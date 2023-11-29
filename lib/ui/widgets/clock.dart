import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Stream _timer;

  @override
  void initState() {
    _timer = Stream.periodic(const Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    // _timer.drain();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _timer,
      builder: (_, snapshot) => Text(
        DateFormat('hh:mm:ss').format(DateTime.now()),
        style: const TextStyle(
          fontSize: 44.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Digital Numbers',
        ),
      ),
    );
  }
}

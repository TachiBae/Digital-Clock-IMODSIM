import 'dart:async';

import 'package:flutter/material.dart';

import 'digital_clock.dart';

/// Activity 1 - Digital Clock
/// Replicates: H:MM display, small seconds subscript, AM/PM indicator,
/// full date (MONTH DD YYYY), and day of week, updating live.
class Activity1Clock extends StatefulWidget {
  const Activity1Clock({super.key});

  @override
  State<Activity1Clock> createState() => _Activity1ClockState();
}

class _Activity1ClockState extends State<Activity1Clock> {
  late Timer _timer;
  DateTime _now = DateTime.now();

  static const List<String> _months = [
    'JANUARY', 'FEBRUARY', 'MARCH', 'APRIL', 'MAY', 'JUNE',
    'JULY', 'AUGUST', 'SEPTEMBER', 'OCTOBER', 'NOVEMBER', 'DECEMBER'
  ];

  static const List<String> _weekdays = [
    'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY'
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF39FF14);

    final int hour12 = _now.hour % 12 == 0 ? 12 : _now.hour % 12;
    final String amOrPm = _now.hour < 12 ? 'AM' : 'PM';
    final String dateStr =
        '${_months[_now.month - 1]} ${_now.day} ${_now.year}';
    final String dayStr = _weekdays[_now.weekday - 1];

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double clockHeight = constraints.maxWidth * 0.28;

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // AM/PM indicator
              Text(
                amOrPm,
                style: const TextStyle(
                  color: green,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 4),
              // Main time row: H : MM  with small seconds subscript
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DigitalNumber(value: hour12, height: clockHeight, color: green),
                  SizedBox(width: clockHeight * 0.12),
                  DigitalColon(height: clockHeight * 0.7, color: green),
                  SizedBox(width: clockHeight * 0.12),
                  DigitalNumber(
                    value: _now.minute,
                    padLeft: 2,
                    height: clockHeight,
                    color: green,
                  ),
                  SizedBox(width: clockHeight * 0.06),
                  Padding(
                    padding: EdgeInsets.only(bottom: clockHeight * 0.02),
                    child: DigitalNumber(
                      value: _now.second,
                      padLeft: 2,
                      height: clockHeight * 0.32,
                      color: green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Date + day of week row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dateStr,
                    style: const TextStyle(
                      color: green,
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    dayStr,
                    style: const TextStyle(
                      color: green,
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

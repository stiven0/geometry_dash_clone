import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {

  final double progress;

  const ProgressBarWidget({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 18,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.transparent,
          valueColor: const AlwaysStoppedAnimation(
            Colors.greenAccent,
          ),
        ),
      ),
    );
  }
}
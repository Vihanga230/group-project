class ProgressTracker extends StatelessWidget {
  final int progress;
  ProgressTracker({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Progress: $progress%'),
        LinearProgressIndicator(value: progress / 100),
      ],
    );
  }
}
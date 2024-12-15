import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

enum JobState { started, preUpload, imageUpload, reportUpload, finished }

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    JobState currentStatus = JobState.values[inputData?['status'] ?? 0];

    switch (currentStatus) {
      case JobState.started:
        debugPrint('Job STARTED');
      case JobState.preUpload:
        debugPrint('Preparing for upload...');
      case JobState.imageUpload:
        debugPrint('Uploading images... ');
      case JobState.reportUpload:
        debugPrint('Generating report...');
      case JobState.finished:
        debugPrint('Job FINSISHED');
    }

    return Future.value(true);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  runApp(const MaterialApp(
    home: JobScreen(),
  ));
}

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Manage'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _onPressed,
          child: const Text('Start Job'),
        ),
      ),
    );
  }

  void _onPressed() async {
    startJob(JobState.started);

    await Future.delayed(const Duration(seconds: 2)); // Simulated delay
    startJob(JobState.preUpload);

    await Future.delayed(const Duration(seconds: 2));
    startJob(JobState.imageUpload);

    await Future.delayed(const Duration(seconds: 5));
    startJob(JobState.reportUpload);

    await Future.delayed(const Duration(seconds: 5));
    startJob(JobState.finished);
  }

  void startJob(JobState status) {
    Workmanager().registerOneOffTask(
      'JobTask${status.name}',
      status.name,
      inputData: {'status': status.index},
    );
  }
}

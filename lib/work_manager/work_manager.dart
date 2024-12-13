import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

enum JobStatus { started, preUpload, imageUpload, reportUpload, finished }

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    JobStatus currentStatus = JobStatus.values[inputData?['status'] ?? 0];

    switch (currentStatus) {
      case JobStatus.started:
        debugPrint('Job STARTED');
      case JobStatus.preUpload:
        debugPrint('Preparing for upload...');
      case JobStatus.imageUpload:
        debugPrint('Uploading images... ');
      case JobStatus.reportUpload:
        debugPrint('Generating report...');
      case JobStatus.finished:
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
    startJob(JobStatus.started);

    await Future.delayed(const Duration(seconds: 2)); // Simulated delay
    startJob(JobStatus.preUpload);

    await Future.delayed(const Duration(seconds: 2));
    startJob(JobStatus.imageUpload);

    await Future.delayed(const Duration(seconds: 5));
    startJob(JobStatus.reportUpload);

    await Future.delayed(const Duration(seconds: 5));
    startJob(JobStatus.finished);
  }

  void startJob(JobStatus status) {
    Workmanager().registerOneOffTask(
      'JobTask${status.name}',
      status.name,
      inputData: {'status': status.index},
    );
  }
}

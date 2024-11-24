import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firebase_app/counter/counter_provider.dart';

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${ref.watch(counterProvider)}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => signup(context),
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => login(context),
              child: const Icon(Icons.login),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => logout(context),
              child: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void signup(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        // instantiated earlier on: final _firebaseAuth = FirebaseAuth.instance;
        email: 'logeshsharmak@gmail.com',
        password: 'test@1234',
      );
    } catch (e) {
      rethrow;
    }
  }

  void login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'logeshsharmak@gmail.com',
        password: 'test@1234',
      );
      Future.delayed(const Duration(seconds: 3), () {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (_) => const Text('Home'),
            ),
          );
        });
      });
    } catch (e) {
      rethrow;
    }
  }

  void logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      rethrow;
    }
  }
}

part of auth_module;

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      appBarText: AppConstants.authPageTitle,
      body: AuthPageBody(),
    );
  }
}

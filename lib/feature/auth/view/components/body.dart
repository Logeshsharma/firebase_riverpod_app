part of auth_module;

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(context) {
    return _body();
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _signinText(),
          _signInOpenText(),
        ],
      ),
    );
  }

  Widget _signinText() {
    return const Padding(
      padding: EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 8,
        right: 8,
      ),
      child: Text(AppConstants.signIn),
    );
  }

  Widget _signInOpenText() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(AppConstants.signinInOpenAccount),
    );
  }
}

part of common_widget_module;

class AppScaffold extends StatelessWidget {
  final String? appBarText;
  final Widget? body;
  const AppScaffold({super.key,  this.appBarText, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarText ?? '',
          style: f10White,
        ),
        backgroundColor: primarycolor1,
        // actions: [
          // ElevatedButton(
          //     onPressed: () {},
          //     style: ElevatedButton.styleFrom(backgroundColor: primaryColor2),
          //     child: const Text(
          //       AppConstants.authPageTitle,
          //       style: f10White,
          //     ))
        // ],
      ),
      body: body ?? const SizedBox(),
    );
  }
}

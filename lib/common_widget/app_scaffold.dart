part of common_widget_module;

class AppScaffold extends StatelessWidget {
  final String appBarText;
  final Widget? body;
  const AppScaffold({
    super.key,
    required this.appBarText,
    this.body
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarText),
      ),
      body: body ??  const SizedBox(),
    );
  }
}

import '../app/main_dependencies.dart';


class RefreshWidget extends StatefulWidget {
  final Widget child;
  final Future Function() onRefresh;

  const RefreshWidget({
    Key key,
    @required this.child,
    @required this.onRefresh,
  });

  @override
  _RefreshWidgetState createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget> {
  @override
  Widget build(BuildContext context) => buildRefreshList();

  Widget buildRefreshList() => RefreshIndicator(
        child: widget.child,
        onRefresh: widget.onRefresh,
      );
}

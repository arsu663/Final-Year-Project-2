import 'package:provider/provider.dart';
import './app/main_dependencies.dart';

//----------------------------------------------------------------------------
// Default View is with Selector and ChangeNotifierProvier
//----------------------------------------------------------------------------

class View<T extends Viewmodel> extends StatelessWidget {
  final Widget Function(BuildContext context, T viewmodel, Widget child)
      builder;

  final void Function(T viewmodel) initViewmodel;

  View({@required this.builder, this.initViewmodel});

  T _setupViewmodel() {
    final viewmodel = dependency<T>();
    if (initViewmodel != null) {
      initViewmodel(viewmodel);
    }
    return viewmodel;
  }

  Widget _builder(BuildContext context, T viewmodel, Widget child) {
    if (viewmodel.busy) {
      return Center(
        child: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return builder(context, viewmodel, child);
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: _setupViewmodel(),
        child: Consumer<T>(builder: _builder),
      );
}

//----------------------------------------------------------------------------
// The ConsumerView class is an alias of View. Only for consistency
//----------------------------------------------------------------------------
class ConsumerView<T extends Viewmodel> extends View<T> {
  ConsumerView({@required builder, initViewmodel})
      : super(builder: builder, initViewmodel: initViewmodel);
}

//----------------------------------------------------------------------------
// View with Selector
//----------------------------------------------------------------------------
class SelectorView<T extends Viewmodel, R> extends View<T> {
  final R Function(BuildContext context, T viewmodel) selector;

  SelectorView({@required this.selector, @required builder, initViewmodel})
      : super(builder: builder, initViewmodel: initViewmodel);

  Widget _selectorBuilder(
      BuildContext context, R selectorResult, Widget child) {
    final viewmodel = dependency<T>();
    return _builder(context, viewmodel, child);
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: _setupViewmodel(),
        child: Selector<T, R>(selector: selector, builder: _selectorBuilder),
      );
}

//----------------------------------------------------------------------------
// WidgetView: View without Consumer.
//----------------------------------------------------------------------------
class WidgetView<T extends Viewmodel> extends View<T> {
  WidgetView({@required builder, initViewmodel})
      : super(builder: builder, initViewmodel: initViewmodel);

  @override
  Widget build(BuildContext context) {
    final viewmodel = dependency<T>();
    return ChangeNotifierProvider.value(
        value: _setupViewmodel(), child: _builder(context, viewmodel, null));
  }
}

part of 'chobilib_flutter.dart';

typedef PopAndAppTerminableOnPopEventProvider = StateProvider<FutureOr<void> Function()?>;


class PopAndAppTerminable extends StatefulWidget {

  static PopAndAppTerminableOnPopEventProvider createEmptyProvider() => PopAndAppTerminableOnPopEventProvider((ref) => null);

  final int intervalMilliSecToExitApp;
  final FutureOr<bool> Function()? isExitOk;
  final FutureOr<void> Function()? beforePopToExit;

  final Widget child;

  const PopAndAppTerminable({
    super.key,
    this.intervalMilliSecToExitApp = 2000,
    this.isExitOk,
    this.beforePopToExit,
    required this.child,
  });

  @override
  State<PopAndAppTerminable> createState() => _PopAndAppTerminableState();
}

class _PopAndAppTerminableState extends State<PopAndAppTerminable> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int _lastBackKeyClickedTime = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Consumer(
      builder: (context, ref, child) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (b, obj) async {
            final exitOk = await widget.isExitOk?.call() ?? true;

            if (exitOk) {
              if (Platform.isAndroid) {
                final cTime = DateTime.now().millisecondsSinceEpoch;
                if ((cTime - _lastBackKeyClickedTime) > widget.intervalMilliSecToExitApp) {
                  _lastBackKeyClickedTime = cTime;
                  await widget.beforePopToExit?.call();
                } else {
                  SystemNavigator.pop();
                }
              }
            }
          },
          child: child!,
        );
      },
      child: widget.child,
    );
  }


}


import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_drawer/config.dart';

class ScreenController extends InheritedWidget {
  final ZoomDrawerController zoomDrawerController;
  final ScrollController scrollController;

  const ScreenController({
    required this.zoomDrawerController,
    required this.scrollController,
    super.key,
    required Widget child,
  }) : super(child: child);

  static ZoomDrawerController zoomOf(BuildContext context) {
    final ScreenController? result =
    context.dependOnInheritedWidgetOfExactType<ScreenController>();
    assert(result != null, 'No ZoomDrawer found in context');
    return result!.zoomDrawerController;
  }

  static ScrollController scrollOf(BuildContext context) {
    final ScreenController? result =
    context.dependOnInheritedWidgetOfExactType<ScreenController>();
    assert(result != null, 'No ZoomDrawer found in context');
    return result!.scrollController;
  }

  @override
  bool updateShouldNotify(ScreenController old) {
    return false;
  }
}
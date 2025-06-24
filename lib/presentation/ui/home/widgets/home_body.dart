import '../../../../core/common/common_imports.dart';

class HomeBody extends StatelessWidget {
  final Widget currentView;
  const HomeBody({super.key, required this.currentView});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // const SideMenu(),
        currentView
      ],
    );
  }
}

import '../../../../core/common/common_imports.dart';

class DashBoardCardItem extends StatelessWidget {
  final String number;
  final String state;
  final String sideState;

  const DashBoardCardItem({
    super.key,
    required this.number,
    required this.sideState,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
        child: Material(
          elevation: 12,
          borderRadius: BorderRadius.circular(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [Icon(Icons.read_more), Text(number), Text(state)]),
              Text(sideState),
            ],
          ),
        ),
      ),
    );
  }
}

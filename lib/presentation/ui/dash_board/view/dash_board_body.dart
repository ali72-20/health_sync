import 'package:health_sync/core/extensions/spaces.dart';
import 'package:health_sync/presentation/ui/dash_board/view/dash_board_card_item.dart';

import '../../../../core/common/common_imports.dart';

class DashBoardBody extends StatelessWidget {
  const DashBoardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Admin Dashboard", textAlign: TextAlign.start,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
          child: Row(
            children: [
              DashBoardCardItem(
                number: "10",
                sideState: "Request Attention",
                state: "Pending",
              ),
              DashBoardCardItem(
                number: "10",
                sideState: "Request Attention",
                state: "Pending",
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
          child: Row(
            children: [
              DashBoardCardItem(
                number: "10",
                sideState: "Request Attention",
                state: "Pending",
              ),
              DashBoardCardItem(
                number: "10",
                sideState: "Request Attention",
                state: "Pending",
              ),
            ],
          ),
        ),

      ],
    );
  }
}

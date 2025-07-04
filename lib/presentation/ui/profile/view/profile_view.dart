import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/core/extensions/extensions.dart';
import 'package:health_sync/core/routes/pages_route.dart';
import 'package:health_sync/domain/entities/auth/user_entity.dart';
import 'package:health_sync/main.dart';
import 'package:health_sync/presentation/ui/profile/managers/profile_page_event.dart';
import 'package:health_sync/presentation/ui/profile/managers/profile_page_state.dart';
import 'package:health_sync/presentation/ui/profile/managers/profile_page_view_model.dart';

import '../../../../di/di.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final viewModel = getIt<ProfilePageViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        // viewModel.onEven(GetUserProfileEvent());
        return viewModel;
      },
      child: BlocConsumer<ProfilePageViewModel, ProfilePageState>(
        builder: (context, state) {
          if (state is ProfilePageOnLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfilePageOnSuccessState) {
            return _profileScreenBody(context, state.userEntity);
          }
          return _buildActionButtons(context);
          // return Scaffold(
          //   body: Center(
          //     child: Text(
          //       'Error loading profile',
          //       style: TextStyle(color: Theme.of(context).colorScheme.error),
          //     ),
          //   ),
          // );
        },
        listener: (context, state) {
          if (state is LogoutSuccessState) {
            navKey.currentState!.pushReplacementNamed(PagesRoutes.loginPage);
          }
        },
      ),
    );
  }

  Widget _profileScreenBody(BuildContext context, UserEntity user) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // Constrain the width for a clean layout on wide screens
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.locale.profile,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  _buildProfileHeader(),
                  const SizedBox(height: 24),
                  _buildProfileFields(user, context),
                  const SizedBox(height: 40),
                  _buildActionButtons(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return const Align(
      alignment: Alignment.center,
      child: CircleAvatar(
        radius: 50,
        // Using a placeholder network image
        backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
      ),
    );
  }

  Widget _buildProfileFields(UserEntity user, BuildContext context) {
    // Using Wrap for responsiveness. On smaller screens, items will wrap to the next line.
    return Wrap(
      spacing: 20.0, // Horizontal space between fields
      runSpacing: 20.0, // Vertical space between fields
      children: [
        _buildInfoField(
          label: context.locale.email,
          value: user.email!,
          flex: 2,
        ),
        _buildInfoField(label: 'Name', value: user.name!, flex: 1),
        _buildInfoField(label: 'Role', value: 'Admin', flex: 1),
      ],
    );
  }

  Widget _buildInfoField({
    required String label,
    required String value,
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final viewModel = context.read<ProfilePageViewModel>();
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            viewModel.onEven(LogoutEvent());
          },
          icon: const Icon(Icons.logout, size: 18),
          label: Text(context.locale.logout),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade700,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}

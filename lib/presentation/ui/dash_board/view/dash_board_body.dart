// admin_dashboard_screen.dart
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/core/extensions/extensions.dart';
import 'package:health_sync/domain/entities/home/all_request_details_entity.dart';
import 'package:health_sync/presentation/ui/dash_board/manager/dash_board_page_event.dart';

import '../manager/dash_board_page_view_model.dart';

class AdminDashboardScreen extends StatefulWidget {
  final int? activeDoctors;
  final int? activePatients;
  final int? activeClinics;
  final int? pendingRequests;

  const AdminDashboardScreen({
    super.key,
    this.activeDoctors,
    this.activePatients,
    this.activeClinics,
    this.pendingRequests,
  });

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  // State for the toggle buttons (Clinic/Doctors)
  // Index 0: Clinic, Index 1: Doctors
  final List<bool> _isSelected = [false, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Admin Dashboard',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildStatsGrid(
              activeClinics: widget.activeClinics ?? 0,
              activeDoctors: widget.activeDoctors ?? 0,
              activePatients: widget.activePatients ?? 0,
              pendingRequests: widget.pendingRequests ?? 0,
              context: context,
            ),
            const SizedBox(height: 24),
            _buildAlertBanner(context),
            const SizedBox(height: 24),
            _buildPendingRequestsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsGrid({
    required BuildContext context,
    required int activeDoctors,
    required int activePatients,
    required int activeClinics,
    required int pendingRequests,
  }) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 2.5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildStatCard(
          icon: Icons.pending_actions_outlined,
          iconColor: Colors.orange,
          count: "$pendingRequests",
          label: context.locale.pending_requests,
          statusText: context.locale.requires_attention,
          statusColor: Colors.red,
        ),
        _buildStatCard(
          icon: Icons.medical_services_outlined,
          iconColor: Colors.blue,
          count: "$activeDoctors",
          label: context.locale.active_doctors,
          statusText: context.locale.all_active,
          statusColor: Colors.blue,
        ),
        _buildStatCard(
          icon: Icons.add_business_outlined,
          iconColor: Colors.teal,
          count: '$activeClinics',
          label: context.locale.registered_clinics,
          statusText: '3 Pending Approval',
          statusColor: Colors.amber.shade800,
        ),
        _buildStatCard(
          icon: Icons.people_alt_outlined,
          iconColor: Colors.purple,
          count: '$activePatients',
          label: context.locale.registered_patients,
          statusText: context.locale.active_users,
          statusColor: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required String count,
    required String label,
    required String statusText,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: iconColor.withOpacity(0.15),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(height: 12),
              Text(
                count,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Text(
              statusText,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertBanner(BuildContext context) {
    final viewModel = context.read<DashBoardPageViewModel>();
    if(viewModel.currentList.isEmpty) return SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.blue.shade600, width: 2),
      ),
      child: DottedBorder(
        color: Colors.red.shade400,
        strokeWidth: 1.5,
        dashPattern: const [8, 4],
        borderType: BorderType.RRect,
        radius: const Radius.circular(4),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.red.shade700,
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                '${viewModel.currentList.length} Pending Requests Require Immediate Attention',
                style: TextStyle(
                  color: Colors.red.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPendingRequestsSection(BuildContext context) {
    final viewModel = context.read<DashBoardPageViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              context.locale.pending_requests,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            ToggleButtons(
              isSelected: _isSelected,
              onPressed: (int index) {
                viewModel.onEvent(
                  ChangeTabEvent(
                    tab: _isSelected[1]
                        ? DashBoardPageTab.Clinics
                        : DashBoardPageTab.Doctors,
                  ),
                );
                setState(() {
                  for (int i = 0; i < _isSelected.length; i++) {
                    _isSelected[i] = i == index;
                  }
                });
              },
              borderRadius: BorderRadius.circular(8.0),
              selectedColor: Colors.black87,
              color: Colors.grey.shade600,
              fillColor: Colors.white,
              selectedBorderColor: Colors.grey.shade400,
              borderColor: Colors.grey.shade300,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(context.locale.clinics),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(context.locale.doctors),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: _isSelected[1]
              ? _buildDoctorsListView(context, viewModel.doctors)
              : _buildClinicsListView(context, viewModel.clinics),
        ),
      ],
    );
  }

  Widget _buildStatusChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.amber.shade800,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildClinicsListView(BuildContext context, List<ClinicEntity> list) {
    if(list.isEmpty) return SizedBox.shrink();
    return SizedBox(
      height: context.height ,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final clinic = list[index];
          return _buildClinicRow(
            clinic.clinicName ?? "",
            clinic.address ?? "",
            clinic.address ?? "",
          );
        },
      ),
    );
  }

  Widget _buildDoctorsListView(
    BuildContext context,
    List<DoctorDetailsEntity> list,
  ) {
    if(list.isEmpty) return SizedBox.shrink();
    return SizedBox(
      height: context.height,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final doctor = list[index];
          return _buildDoctorRow(
            context,
            doctor
          );
        },
      ),
    );
  }

  Widget _buildDoctorRow(
    BuildContext context,
    DoctorDetailsEntity entity,
  ) {
    final viewModel = context.read<DashBoardPageViewModel>();
    final int APPROVED = 1, REJECTED = 2;
    return InkWell(
      onTap: (){
          viewModel.onEvent(NavigateToDoctorDetailsPageEvent(doctor: entity));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              // In a real app, use NetworkImage(doctor.imageUrl)
              backgroundColor: Colors.black12,
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: Text(
                entity.doctorName??"",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(flex: 2, child: Text(entity.specialization??"")),
            Expanded(flex: 2, child: Text(entity.doctorClinics??"")),
            Expanded(flex: 2, child: _buildStatusChip('Pending')),
            Expanded(
              flex: 2,
              child: Text(entity.yearsOfExp.toString(), style: TextStyle(color: Colors.grey.shade600)),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(context.locale.view_details),
                  ),
                  TextButton(
                    onPressed: () {
                      viewModel.onEvent(
                        ApproveDoctorEvent(doctorId: "", status: APPROVED),
                      );
                    },
                    child: const Text(
                      'Approve',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      viewModel.onEvent(
                        ApproveDoctorEvent(doctorId: "", status: REJECTED),
                      );
                    },
                    child: const Text(
                      'Reject',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Assign Clinic'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClinicRow(String name, String address, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(flex: 4, child: Text(address)),
          Expanded(flex: 2, child: _buildStatusChip('Pending')),
          Expanded(
            flex: 2,
            child: Text(date, style: TextStyle(color: Colors.grey.shade600)),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, color: Colors.blue, size: 20),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

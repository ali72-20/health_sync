import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/di/di.dart';
import 'package:health_sync/domain/entities/home/all_request_details_entity.dart';
import 'package:health_sync/domain/entities/home/doctors_details_entity.dart';
import 'package:health_sync/presentation/ui/doctors/managers/doctors_page_state.dart';
import 'package:health_sync/presentation/ui/doctors/managers/doctors_page_view_model.dart';

import '../managers/doctors_page_event.dart';

class DoctorDetailsView extends StatelessWidget {
  DoctorDetailsView({super.key});

  final viewModel = getIt<DoctorsPageViewModel>();

  @override
  Widget build(BuildContext context) {
    var doctorEntity =
        ModalRoute.of(context)?.settings.arguments as DoctorDetailsEntity?;
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocListener<DoctorsPageViewModel, DoctorsPageState>(
        listener: (context, state) {
          if (state is DoctorsPageSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Doctor Approved Successfully!", style: TextStyle(color: Colors.white),), backgroundColor: Colors.green,),
            );
            Navigator.pop(context);
          } else if (state is DoctorsPageFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage.toString()), backgroundColor: Theme.of(context).colorScheme.error,),
            );
          } else if (state is DoctorsPageLoadingState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Processing...")));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){
              Navigator.of(context).pop();
            }, icon: Icon(Icons.arrow_back_ios)),
          ),
          backgroundColor: Colors.grey[50],
          body: LayoutBuilder(
            builder: (context, constraints) {
              // Use a more responsive layout for smaller screens
              bool isMobile = constraints.maxWidth < 700;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Doctor Details',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildInfoCard(isMobile, doctorEntity!),
                      const SizedBox(height: 24),
                      _buildLicenseCard(),
                      const SizedBox(height: 32),
                      _buildActionButtons(
                        isMobile,
                        context,
                        doctorEntity.doctorID.toString(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(bool isMobile, DoctorDetailsEntity doctorDetails) {
    final Map<String, Map<String, String>> details = {
      'Doctor Information': {
        'Full Name': doctorDetails.doctorName ?? 'N/A',
        'Doctor ID': doctorDetails.doctorID?.toString() ?? 'N/A',
        'Specialty': doctorDetails.specialization ?? 'N/A',
      },
      'Registration Details': {
        'Years of Experience': doctorDetails.yearsOfExp?.toString() ?? 'N/A',
        'Status': "${doctorDetails.status}" ?? 'N/A',
      },
    };

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Wrap(
          spacing: isMobile ? 0 : 100.0,
          runSpacing: 40.0,
          children: details.entries.map((entry) {
            return _buildDetailSection(
              title: entry.key,
              details: entry.value,
            );
          }).toList(),
        ),
      ),
    );
  }
  Widget _buildDetailSection({
    required String title,
    required Map<String, String> details,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        ...details.entries.map((detail) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: _buildDetailItem(detail.key, detail.value),
          );
        }),
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildLicenseCard() {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'License Document',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // Using a placeholder for the image
                  Image.network(
                    'https://i.imgur.com/Of1w2aD.png', // Placeholder image URL
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.document_scanner_outlined,
                      size: 100,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'LIC123.pdf',
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(
    bool isMobile,
    BuildContext context,
    String doctorID,
  ) {
    final viewModel = context.read<DoctorsPageViewModel>();
    return Wrap(
      spacing: 16.0,
      runSpacing: 16.0,
      alignment: WrapAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            viewModel.onEvent(ApproveDoctorEvent(doctorId: doctorID));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade700,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Approve Doctor'),
        ),
        OutlinedButton(
          onPressed: () {
            viewModel.onEvent(RejectDoctorEvent(doctorId: doctorID));
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red.shade700,
            side: BorderSide(color: Colors.red.shade700),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Reject Application'),
        ),
      ],
    );
  }
}

// clinics_screen.dart (CORRECTED)

import 'package:flutter/material.dart';

import 'clinic_details_page.dart';
import 'clinics_search_result_view.dart';

// Import your other screens so navigation works


// A data model for the clinic and an enum for the status
enum ClinicStatus { Approved, Rejected }

class Clinic {
  final String name;
  final String address;
  final ClinicStatus status;
  final String registrationDate;

  Clinic({
    required this.name,
    required this.address,
    required this.status,
    required this.registrationDate,
  });
}

class ClinicsScreen extends StatefulWidget {
  const ClinicsScreen({super.key});

  @override
  State<ClinicsScreen> createState() => _ClinicsScreenState();
}

class _ClinicsScreenState extends State<ClinicsScreen> {
  // Sample data. In a real app, this would come from an API.
  final List<Clinic> _clinics = [
    Clinic(name: 'Family Care Clinic', address: '456 Wellness Street, Abu Dhabi', status: ClinicStatus.Approved, registrationDate: '2024-01-14'),
    Clinic(name: 'Advanced Medical Hub', address: '789 Medical Boulevard, Sharjah', status: ClinicStatus.Rejected, registrationDate: '2024-01-13'),
    Clinic(name: 'Prime Healthcare Center', address: '654 Care Lane, Downtown Dubai', status: ClinicStatus.Approved, registrationDate: '2024-01-11'),
    Clinic(name: 'Family Care Clinic', address: '456 Wellness Street, Abu Dhabi', status: ClinicStatus.Approved, registrationDate: '2024-01-14'),
    Clinic(name: 'Advanced Medical Hub', address: '789 Medical Boulevard, Sharjah', status: ClinicStatus.Rejected, registrationDate: '2024-01-13'),
    Clinic(name: 'Wellness First', address: '101 Health Ave, Abu Dhabi', status: ClinicStatus.Approved, registrationDate: '2024-01-10'),
    Clinic(name: 'Sharjah Specialty', address: '202 Cure Rd, Sharjah', status: ClinicStatus.Approved, registrationDate: '2024-01-09'),
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Padding(
        // Added padding for better aesthetics
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildSearchBarAndButton(),
            const SizedBox(height: 24),

            // ================== THE FIX IS HERE ==================
            // We wrap the part of the UI that scrolls (the table)
            // in an Expanded widget. This tells the Column's child
            // to fill the remaining available vertical space.
            Expanded(
              child: _buildClinicsTable(),
            ),
            // =====================================================
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Clinics',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Manage and approve clinic registrations',
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildSearchBarAndButton() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search clinics by name, address, or status',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0D6EFD),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          child: const Text('Add New Clinic'),
        ),
      ],
    );
  }

  Widget _buildClinicsTable() {
    // This widget is fine, the problem was with its parent layout.
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: PaginatedDataTable(
        header: const SizedBox.shrink(),
        rowsPerPage: 5,
        columns: const [
          DataColumn(label: Text('Clinic Name', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Address', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Registration Date', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        source: _ClinicDataSource(clinics: _clinics, context: context),
        columnSpacing: 20,
        horizontalMargin: 20,
        showCheckboxColumn: false,
        dataRowHeight: 60,
        headingRowHeight: 56,
      ),
    );
  }
}

class _ClinicDataSource extends DataTableSource {
  final List<Clinic> clinics;
  final BuildContext context;

  _ClinicDataSource({required this.clinics, required this.context});

  @override
  DataRow? getRow(int index) {
    if (index >= clinics.length) return null;
    final clinic = clinics[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(clinic.name)),
        DataCell(Text(clinic.address)),
        DataCell(_buildStatusChip(clinic.status)),
        DataCell(Text(clinic.registrationDate)),
        DataCell(_buildActionIcons(clinic)),
      ],
    );
  }

  Widget _buildStatusChip(ClinicStatus status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: status == ClinicStatus.Approved ? const Color(0xFFD1FAE5) : const Color(0xFFFEE2E2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status == ClinicStatus.Approved ? 'Approved' : 'Rejected',
        style: TextStyle(
            color: status == ClinicStatus.Approved ? const Color(0xFF065F46) : const Color(0xFF991B1B),
            fontWeight: FontWeight.bold,
            fontSize: 12
        ),
      ),
    );
  }

  Widget _buildActionIcons(Clinic clinic) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (clinic.status == ClinicStatus.Rejected) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ClinicDetailsScreen()));
            } else {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ClinicProfileScreen()));
            }
          },
          icon: const Icon(Icons.edit, color: Color(0xFF0D6EFD), size: 20),
          tooltip: 'View/Edit',
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete, color: Colors.red, size: 20),
          tooltip: 'Delete',
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert, color: Colors.grey.shade600, size: 20),
          tooltip: 'More Actions',
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => clinics.length;
  @override
  int get selectedRowCount => 0;
}
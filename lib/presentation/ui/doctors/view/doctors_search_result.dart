// doctor_details_screen.dart
import 'package:flutter/material.dart';

class DoctorsSearchResult extends StatelessWidget {
  const DoctorsSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    // In a real app, you would receive a doctor object/ID here
    // and fetch the data. For this example, we'll use static data.

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // A very light grey background
      body: SingleChildScrollView(
        child: Padding(
          // Adjust padding for a web layout
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBreadcrumbs(context),
              const SizedBox(height: 24),
              const Text(
                'Doctor Search Results',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF212529)),
              ),
              const SizedBox(height: 24),
              _buildInfoCard(),
              const SizedBox(height: 32),
              _buildAssignedClinicsTable(),
              const SizedBox(height: 24),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBreadcrumbs(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Text('Doctors',
              style: TextStyle(color: Colors.blue, fontSize: 14)),
        ),
        const Text('  /  ',
            style: TextStyle(color: Colors.grey, fontSize: 14)),
        const Text('Search Results',
            style: TextStyle(color: Colors.black54, fontSize: 14)),
      ],
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildBasicInfoColumn()),
          const SizedBox(width: 32),
          Expanded(child: _buildContactInfoColumn()),
        ],
      ),
    );
  }

  Widget _buildBasicInfoColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Basic Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        _buildDetailItem(
            Icons.person_outline, 'Name', 'Dr. Sarah Johnson'),
        const SizedBox(height: 20),
        _buildDetailItem(Icons.abc, 'Specialty',
            'Cardiology'),
        const SizedBox(height: 20),
        _buildDetailItem(Icons.badge_outlined, 'License ID', 'MD2023456'),
        const SizedBox(height: 20),
        _buildDetailItem(
            Icons.check_circle_outline, 'Status', 'Active',
            valueColor: Colors.green.shade700),
      ],
    );
  }

  Widget _buildContactInfoColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Contact Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        _buildDetailItem(Icons.email_outlined, 'Email',
            'sarah.johnson@healthsync.com'),
        const SizedBox(height: 20),
        _buildDetailItem(
            Icons.phone_outlined, 'Phone', '+1 (555) 123-4567'),
        const SizedBox(height: 20),
        _buildDetailItem(Icons.school_outlined, 'Experience', '12 years'),
      ],
    );
  }

  Widget _buildDetailItem(IconData icon, String label, String value,
      {Color? valueColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blue.shade700, size: 22),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: valueColor ?? Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAssignedClinicsTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Assigned Clinics',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: Column(
              children: [
                _buildClinicsTableHeader(),
                _buildClinicRow(
                    'HealthSync Central',
                    'Downtown Medical District',
                    'Jan 15, 2024',
                    'Active',
                    const Color(0xFFFFFFFF)),
                _buildClinicRow(
                    'HealthSync North',
                    'North Valley Medical Center',
                    'Mar 1, 2024',
                    'Pending',
                    const Color(0xFFF8F9FA)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildClinicsTableHeader() {
    const headerStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      decoration: const BoxDecoration(color: Color(0xFF0D6EFD)), // A strong blue
      child: Row(
        children: const [
          Expanded(flex: 3, child: Text('Clinic Name', style: headerStyle)),
          Expanded(flex: 3, child: Text('Location', style: headerStyle)),
          Expanded(flex: 2, child: Text('Assignment Date', style: headerStyle)),
          Expanded(flex: 2, child: Text('Status', style: headerStyle)),
        ],
      ),
    );
  }

  Widget _buildClinicRow(
      String name, String location, String date, String status, Color backgroundColor) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(name, style: const TextStyle(fontWeight: FontWeight.w500))),
          Expanded(flex: 3, child: Text(location)),
          Expanded(flex: 2, child: Text(date)),
          Expanded(flex: 2, child: _buildStatusChip(status)),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color chipBackgroundColor;
    Color chipTextColor;
    if (status == 'Active') {
      chipBackgroundColor = Colors.green.shade100;
      chipTextColor = Colors.green.shade800;
    } else { // Pending
      chipBackgroundColor = Colors.amber.shade100;
      chipTextColor = Colors.amber.shade800;
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: chipBackgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          status,
          style: TextStyle(
              color: chipTextColor, fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.access_time, size: 16, color: Colors.grey),
            SizedBox(width: 8),
            Text(
              'Last Updated: Today at 2:30 PM',
              style: TextStyle(color: Colors.grey, fontSize: 13, fontStyle: FontStyle.italic),
            ),
          ],
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, size: 18),
          label: const Text('Back to Doctors'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF0D6EFD),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
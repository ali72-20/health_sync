// clinic_profile_screen.dart

import 'package:flutter/material.dart';

class ClinicProfileScreen extends StatelessWidget {
  const ClinicProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // *** FIX: Wrapped the content in a Scaffold to provide a proper screen structure ***
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildClinicInfoCard(),
            const SizedBox(height: 24),
            _buildStatsRow(),
            const SizedBox(height: 32),
            _buildAssignedDoctorsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          child: Row(
            children: const [
              Icon(Icons.arrow_back, color: Color(0xFF0D6EFD), size: 20),
              SizedBox(width: 8),
              Text(
                'Back to Clinics',
                style: TextStyle(
                    color: Color(0xFF0D6EFD),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        const Text(
          'Clinic Search Results',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildClinicInfoCard() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: const Color(0xFF0D6EFD), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'City Medical Center',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildStatusChip('Active', Colors.green),
                ],
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit, size: 16, color: Color(0xFF0D6EFD)),
                label: const Text(
                  'Edit',
                  style: TextStyle(color: Color(0xFF0D6EFD), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    _buildInfoItemWithIcon(Icons.location_on_outlined, 'Address', '123 Healthcare Avenue, Dubai Healthcare City'),
                    const SizedBox(height: 16),
                    _buildInfoItemWithIcon(Icons.phone_outlined, 'Phone', '+971 4 123 4567'),
                    const SizedBox(height: 16),
                    _buildInfoItemWithIcon(Icons.email_outlined, 'Email', 'contact@citymedical.ae'),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  children: [
                    _buildInfoItemWithIcon(Icons.badge_outlined, 'License Details', 'License Number: CLN-2023-456\nExpiry: December 31, 2024'),
                    const SizedBox(height: 16),
                    _buildInfoItemWithIcon(Icons.calendar_today_outlined, 'Operating Hours', 'Mon - Fri: 8:00 AM - 8:00 PM\nSat: 9:00 AM - 5:00 PM\nSun: Closed'),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildInfoItemWithIcon(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.grey.shade600, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(color: Colors.grey.shade700, fontSize: 13, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(fontSize: 14, height: 1.5),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(child: _buildStatCard(Icons.people_alt_outlined, Colors.blue.shade700, 'Total Patients', '1,245')),
        const SizedBox(width: 20),
        Expanded(child: _buildStatCard(Icons.access_time, Colors.orange.shade700, 'Monthly App..', '450')),
        const SizedBox(width: 20),
        Expanded(child: _buildStatCard(Icons.person_pin_circle_outlined, Colors.teal.shade700, 'Active Doctors', '3')),
        const SizedBox(width: 20),
        Expanded(child: _buildStatCard(Icons.medical_services_outlined, Colors.purple.shade700, 'Specialties', '3')),
      ],
    );
  }

  Widget _buildStatCard(IconData icon, Color iconColor, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: iconColor.withOpacity(0.15),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(height: 16),
          Text(label, style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildAssignedDoctorsSection() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Assigned Doctors', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D6EFD),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Manage Doctors'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildDoctorsTableHeader(),
          const Divider(),
          _buildDoctorRow('Dr. Sarah Johnson', 'Cardiology', 'DLC-2023-789'),
          _buildDoctorRow('Dr. Ahmed Hassan', 'Pediatrics', 'DLC-2023-790'),
          _buildDoctorRow('Dr. Maria Garcia', 'Dermatology', 'DLC-2023-791'),
        ],
      ),
    );
  }

  Widget _buildDoctorsTableHeader() {
    const headerStyle = TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        children: const [
          Expanded(flex: 3, child: Text('Doctor Name', style: headerStyle)),
          Expanded(flex: 3, child: Text('Specialty', style: headerStyle)),
          Expanded(flex: 3, child: Text('License Number', style: headerStyle)),
          Expanded(flex: 2, child: Text('Status', style: headerStyle)),
        ],
      ),
    );
  }

  Widget _buildDoctorRow(String name, String specialty, String license) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(name, style: const TextStyle(fontWeight: FontWeight.w500))),
          Expanded(flex: 3, child: Text(specialty)),
          Expanded(flex: 3, child: Text(license)),
          Expanded(flex: 2, child: _buildStatusChip('Active', Colors.green, small: true)),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String text, Color color, {bool small = false}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: small ? 8 : 12, vertical: small ? 4 : 6),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: small ? 12 : 14,
          ),
        ),
      ),
    );
  }
}
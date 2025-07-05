import 'package:flutter/material.dart';

class ClinicSearchResultsPage extends StatefulWidget {
  const ClinicSearchResultsPage({super.key});

  @override
  State<ClinicSearchResultsPage> createState() => _ClinicSearchResultsPageState();
}

class _ClinicSearchResultsPageState extends State<ClinicSearchResultsPage> {
  // Sample data
  final ClinicSearchResult clinicResult = ClinicSearchResult(
    name: 'City Medical Center',
    status: 'Active',
    address: '123 Healthcare Avenue, Dubai Healthcare City',
    phone: '+971 2 123 4567',
    email: 'contact@citymedical.ae',
    licenseDetails: LicenseDetails(
      licenseNumber: 'DH-2021-456',
      expiryDate: 'December 31, 2024',
    ),
    operatingHours: OperatingHours(
      monday: '8:00 AM - 8:00 PM',
      tuesday: '8:00 AM - 8:00 PM',
      wednesday: '8:00 AM - 8:00 PM',
      thursday: '8:00 AM - 8:00 PM',
      friday: '8:00 AM - 8:00 PM',
      saturday: '8:00 AM - 8:00 PM',
      sunday: 'Closed',
    ),
    statistics: ClinicStatistics(
      totalPatients: 1245,
      monthlyAppointments: 456,
      activeDoctors: 5,
      specialties: 3,
    ),
    assignedDoctors: [
      Doctor(
        name: 'Dr. Sarah Johnson',
        specialty: 'Cardiology',
        licenseNumber: 'DLC-2022-789',
        status: 'Active',
      ),
      Doctor(
        name: 'Dr. Ahmed Hassan',
        specialty: 'Pediatrics',
        licenseNumber: 'DLC-2023-456',
        status: 'Active',
      ),
      Doctor(
        name: 'Dr. Maria Garcia',
        specialty: 'Dermatology',
        licenseNumber: 'DLC-2022-321',
        status: 'Active',
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(),
              const SizedBox(height: 24),

              // Main Content
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 1200) {
                    return IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left Column
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                _buildClinicInfoCard(),
                                const SizedBox(height: 24),
                                _buildAssignedDoctorsCard(),
                              ],
                            ),
                          ),
                          const SizedBox(width: 24),
                          // Right Column
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                _buildLicenseDetailsCard(),
                                const SizedBox(height: 24),
                                _buildOperatingHoursCard(),
                                const SizedBox(height: 24),
                                _buildStatisticsCards(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        _buildClinicInfoCard(),
                        const SizedBox(height: 24),
                        _buildStatisticsCards(),
                        const SizedBox(height: 24),
                        _buildLicenseDetailsCard(),
                        const SizedBox(height: 24),
                        _buildOperatingHoursCard(),
                        const SizedBox(height: 24),
                        _buildAssignedDoctorsCard(),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.blue,
        ),
        const SizedBox(width: 8),
        const Text(
          'Back to Clinics',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 24),
        const Text(
          'Clinic Search Results',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildClinicInfoCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  clinicResult.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    clinicResult.status,
                    style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                TextButton(
                  onPressed: () {
                    // Edit functionality
                  },
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoItem('Address', clinicResult.address),
                      const SizedBox(height: 16),
                      _buildInfoItem('Phone', clinicResult.phone),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoItem('Email', clinicResult.email),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildLicenseDetailsCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'License Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoItem('License Number', clinicResult.licenseDetails.licenseNumber),
            const SizedBox(height: 12),
            _buildInfoItem('Expiry Date', clinicResult.licenseDetails.expiryDate),
          ],
        ),
      ),
    );
  }

  Widget _buildOperatingHoursCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Operating Hours',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildHoursRow('Mon - Fri', clinicResult.operatingHours.monday),
            _buildHoursRow('Sat', clinicResult.operatingHours.saturday),
            _buildHoursRow('Sun', clinicResult.operatingHours.sunday),
          ],
        ),
      ),
    );
  }

  Widget _buildHoursRow(String day, String hours) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          Text(
            hours,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsCards() {
    return Container(
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Row(
              children: [
                Flexible(
                  flex: 1,
                  child: _buildStatCard(
                    'Total Patients',
                    clinicResult.statistics.totalPatients.toString(),
                    Icons.people,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  flex: 1,
                  child: _buildStatCard(
                    'Monthly App...',
                    clinicResult.statistics.monthlyAppointments.toString(),
                    Icons.calendar_today,
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  flex: 1,
                  child: _buildStatCard(
                    'Active Doctors',
                    clinicResult.statistics.activeDoctors.toString(),
                    Icons.medical_services,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  flex: 1,
                  child: _buildStatCard(
                    'Specialties',
                    clinicResult.statistics.specialties.toString(),
                    Icons.local_hospital,
                    Colors.purple,
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: _buildStatCard(
                        'Total Patients',
                        clinicResult.statistics.totalPatients.toString(),
                        Icons.people,
                        Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      flex: 1,
                      child: _buildStatCard(
                        'Monthly App...',
                        clinicResult.statistics.monthlyAppointments.toString(),
                        Icons.calendar_today,
                        Colors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: _buildStatCard(
                        'Active Doctors',
                        clinicResult.statistics.activeDoctors.toString(),
                        Icons.medical_services,
                        Colors.green,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      flex: 1,
                      child: _buildStatCard(
                        'Specialties',
                        clinicResult.statistics.specialties.toString(),
                        Icons.local_hospital,
                        Colors.purple,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 20),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssignedDoctorsCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Assigned Doctors',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Manage doctors functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Manage Doctors',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Table Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Doctor Name',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Specialty',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'License Number',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Table Rows
            ...clinicResult.assignedDoctors.map((doctor) => _buildDoctorRow(doctor)),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorRow(Doctor doctor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              doctor.name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              doctor.specialty,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              doctor.licenseNumber,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                doctor.status,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.green[800],
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Data Models
class ClinicSearchResult {
  final String name;
  final String status;
  final String address;
  final String phone;
  final String email;
  final LicenseDetails licenseDetails;
  final OperatingHours operatingHours;
  final ClinicStatistics statistics;
  final List<Doctor> assignedDoctors;

  ClinicSearchResult({
    required this.name,
    required this.status,
    required this.address,
    required this.phone,
    required this.email,
    required this.licenseDetails,
    required this.operatingHours,
    required this.statistics,
    required this.assignedDoctors,
  });
}

class LicenseDetails {
  final String licenseNumber;
  final String expiryDate;

  LicenseDetails({
    required this.licenseNumber,
    required this.expiryDate,
  });
}

class OperatingHours {
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String sunday;

  OperatingHours({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });
}

class ClinicStatistics {
  final int totalPatients;
  final int monthlyAppointments;
  final int activeDoctors;
  final int specialties;

  ClinicStatistics({
    required this.totalPatients,
    required this.monthlyAppointments,
    required this.activeDoctors,
    required this.specialties,
  });
}

class Doctor {
  final String name;
  final String specialty;
  final String licenseNumber;
  final String status;

  Doctor({
    required this.name,
    required this.specialty,
    required this.licenseNumber,
    required this.status,
  });
}
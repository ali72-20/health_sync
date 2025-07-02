import 'package:flutter/material.dart';

class DoctorsView extends StatefulWidget {
  const DoctorsView({super.key});

  @override
  State<DoctorsView> createState() => _DoctorsViewState();
}

class _DoctorsViewState extends State<DoctorsView> {
  // Sample data - in a real app, you would fetch this from an API
  final List<Doctor> _doctors = [
    Doctor(name: 'Dr. Sarah', imageUrl: 'https://i.pravatar.cc/150?img=1', specialty: 'Cardiology', clinic: 'Heart Care', status: DoctorStatus.Approved, registrationDate: '2024-01-15'),
    Doctor(name: 'Dr. Emily', imageUrl: 'https://i.pravatar.cc/150?img=2', specialty: 'Neurology', clinic: 'Brain & Spine', status: DoctorStatus.Rejected, registrationDate: '2024-01-18'),
    Doctor(name: 'Dr. James', imageUrl: 'https://i.pravatar.cc/150?img=3', specialty: 'Orthopedics', clinic: 'Joint Care', status: DoctorStatus.Approved, registrationDate: '2024-01-16'),
    Doctor(name: 'Dr. Sarah', imageUrl: 'https://i.pravatar.cc/150?img=4', specialty: 'Cardiology', clinic: 'Heart Care', status: DoctorStatus.Approved, registrationDate: '2024-01-15'),
    Doctor(name: 'Dr. James', imageUrl: 'https://i.pravatar.cc/150?img=5', specialty: 'Orthopedics', clinic: 'Joint Care', status: DoctorStatus.Approved, registrationDate: '2024-01-16'),
    // Add more doctors to see pagination
    Doctor(name: 'Dr. John', imageUrl: 'https://i.pravatar.cc/150?img=6', specialty: 'Dermatology', clinic: 'Skin Clinic', status: DoctorStatus.Approved, registrationDate: '2024-02-20'),
    Doctor(name: 'Dr. Linda', imageUrl: 'https://i.pravatar.cc/150?img=7', specialty: 'Pediatrics', clinic: 'Child Health', status: DoctorStatus.Rejected, registrationDate: '2024-02-22'),
    Doctor(name: 'Dr. Michael', imageUrl: 'https://i.pravatar.cc/150?img=8', specialty: 'Oncology', clinic: 'Cancer Center', status: DoctorStatus.Approved, registrationDate: '2024-03-01'),
    Doctor(name: 'Dr. Jessica', imageUrl: 'https://i.pravatar.cc/150?img=9', specialty: 'ENT', clinic: 'Head & Neck', status: DoctorStatus.Approved, registrationDate: '2024-03-05'),
    Doctor(name: 'Dr. David', imageUrl: 'https://i.pravatar.cc/150?img=10', specialty: 'Psychiatry', clinic: 'Mind Care', status: DoctorStatus.Approved, registrationDate: '2024-03-10'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Doctors',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildFilterAndSearch(),
            const SizedBox(height: 24),
            Expanded(
              child: _buildDoctorsTable(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterAndSearch() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search by name, specialty, or clinic',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 16),
        _buildFilterDropdown('Specialty'),
        const SizedBox(width: 16),
        _buildFilterDropdown('Clinic'),
        const SizedBox(width: 16),
        _buildFilterDropdown('Status'),
      ],
    );
  }

  Widget _buildFilterDropdown(String hint) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: Text(hint, style: TextStyle(color: Colors.grey.shade600)),
            icon: const Icon(Icons.arrow_drop_down),
            items: const [], // Add your filter items here
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorsTable() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: PaginatedDataTable(
        header: const Text('Doctor List'),
        rowsPerPage: 5,
        columns: const [
          DataColumn(label: Text('Doctor Name')),
          DataColumn(label: Text('Specialty')),
          DataColumn(label: Text('Clinic')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Registration Date')),
          DataColumn(label: Text('Actions')),
        ],
        source: _DoctorDataSource(doctors: _doctors, context: context),
        columnSpacing: 20,
        horizontalMargin: 20,
        showCheckboxColumn: false,
      ),
    );
  }
}

class _DoctorDataSource extends DataTableSource {
  final List<Doctor> doctors;
  final BuildContext context;

  _DoctorDataSource({required this.doctors, required this.context});

  @override
  DataRow? getRow(int index) {
    if (index >= doctors.length) {
      return null;
    }
    final doctor = doctors[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(_buildDoctorNameCell(doctor)),
        DataCell(Text(doctor.specialty)),
        DataCell(Text(doctor.clinic)),
        DataCell(_buildStatusChip(doctor.status)),
        DataCell(Text(doctor.registrationDate)),
        DataCell(_buildActionButtons()),
      ],
    );
  }

  Widget _buildDoctorNameCell(Doctor doctor) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(doctor.imageUrl),
          radius: 16,
        ),
        const SizedBox(width: 12),
        Text(doctor.name),
      ],
    );
  }

  Widget _buildStatusChip(DoctorStatus status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: status == DoctorStatus.Approved
            ? Colors.green.shade100
            : Colors.red.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status == DoctorStatus.Approved ? 'Approved' : 'Rejected',
        style: TextStyle(
          color: status == DoctorStatus.Approved
              ? Colors.green.shade800
              : Colors.red.shade800,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('View Details'),
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {},
          child: const Text('Assign Clinic'),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => doctors.length;

  @override
  int get selectedRowCount => 0;


}
enum DoctorStatus { Approved, Rejected }

class Doctor {
  final String name;
  final String imageUrl;
  final String specialty;
  final String clinic;
  final DoctorStatus status;
  final String registrationDate;

  Doctor({
    required this.name,
    required this.imageUrl,
    required this.specialty,
    required this.clinic,
    required this.status,
    required this.registrationDate,
  });
}
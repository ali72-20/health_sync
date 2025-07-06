import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/domain/entities/home/doctors_details_entity.dart';
import 'package:health_sync/presentation/ui/doctors/managers/doctors_page_event.dart';
import 'package:health_sync/presentation/ui/doctors/managers/doctors_page_state.dart';
import 'package:health_sync/presentation/ui/doctors/managers/doctors_page_view_model.dart';

class DoctorsView extends StatefulWidget {
  const DoctorsView({super.key});

  @override
  State<DoctorsView> createState() => _DoctorsViewState();
}

class _DoctorsViewState extends State<DoctorsView> {
  int totalCount = 0;
  List<AllDoctorsDetailsEntity> allDoctors = [];

  @override
  void initState() {
    super.initState();
    context.read<DoctorsPageViewModel>().onEvent(GetAllDoctorsEvent(page: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: BlocConsumer<DoctorsPageViewModel, DoctorsPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is DoctorsPageLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DoctorsPageFailureState) {
            return Center(child: Text(state.errorMessage));
          }
          if (state is DoctorsPageSuccessState) {
            allDoctors = state.allDoctors!;
            totalCount = state.totalCount!;
          }

          return Padding(
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
                Expanded(child: _buildDoctorsTable()),
              ],
            ),
          );
        },
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
            items: const [],
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
        onPageChanged: (int rowIndex) {
          final page = (rowIndex ~/ 5) + 1;
          context.read<DoctorsPageViewModel>().onEvent(
            GetAllDoctorsEvent(page: page),
          );
        },
        columns: const [
          DataColumn(label: Text('Doctor Name')),
          DataColumn(label: Text('Specialty')),
          DataColumn(label: Text('Clinic')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Registration Date')),
          DataColumn(label: Text('Actions')),
        ],
        source: _DoctorDataSource(doctors: allDoctors, context: context),
        columnSpacing: 20,
        horizontalMargin: 20,
        showCheckboxColumn: false,
      ),
    );
  }
}

class _DoctorDataSource extends DataTableSource {
  final List<AllDoctorsDetailsEntity> doctors;
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
        DataCell(Text(doctor.specialization ?? "")),
        DataCell(Text(doctor.doctorClinics!.first.toString())),
        DataCell(
          _buildStatusChip(
            doctor.status == 0
                ? DoctorStatus.values.first
                : DoctorStatus.Rejected,
          ),
        ),
        DataCell(Text(doctor.yearsOfExp.toString() ?? "")),
        DataCell(_buildActionButtons()),
      ],
    );
  }

  Widget _buildDoctorNameCell(AllDoctorsDetailsEntity doctor) {
    return Row(
      children: [
        CircleAvatar(backgroundColor: Colors.white, radius: 16),
        const SizedBox(width: 12),
        Text(doctor.doctorName ?? ""),
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
        TextButton(onPressed: () {}, child: const Text('View Details')),
        const SizedBox(width: 8),
        TextButton(onPressed: () {}, child: const Text('Assign Clinic')),
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

enum DoctorStatus { Approved, Rejected, Pending }

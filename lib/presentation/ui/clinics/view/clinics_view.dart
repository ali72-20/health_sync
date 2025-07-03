import 'package:flutter/material.dart';

class Clinic {
  final String id;
  final String name;
  final String address;
  final String status;
  final String registrationDate;
  final String licenseId;
  final String contact;
  final String email;

  Clinic({
    required this.id,
    required this.name,
    required this.address,
    required this.status,
    required this.registrationDate,
    required this.licenseId,
    required this.contact,
    required this.email,
  });
}

class ClinicsView extends StatefulWidget {
  final Function(Widget)? onNavigate; // Optional callback for navigation

  const ClinicsView({super.key, this.onNavigate});

  @override
  _ClinicsViewState createState() => _ClinicsViewState();
}

class _ClinicsViewState extends State<ClinicsView> {
  final TextEditingController _searchController = TextEditingController();
  int _currentPage = 1;
  final int _itemsPerPage = 25;

  final List<Clinic> _clinics = [
    Clinic(
      id: "1",
      name: "Family Care Clinic",
      address: "456 Wellness Street, Abu Dhabi",
      status: "Approved",
      registrationDate: "2024-01-14",
      licenseId: "CLN-2024-456",
      contact: "+971 50 123 4567",
      email: "contact@familycare.ae",
    ),
    Clinic(
      id: "2",
      name: "Advanced Medical Hub",
      address: "789 Medical Boulevard, Sharjah",
      status: "Rejected",
      registrationDate: "2024-01-13",
      licenseId: "CLN-2024-457",
      contact: "+971 50 123 4568",
      email: "info@advancedmed.ae",
    ),
    Clinic(
      id: "3",
      name: "Prime Healthcare Center",
      address: "654 Care Lane, Downtown Dubai",
      status: "Approved",
      registrationDate: "2024-01-11",
      licenseId: "CLN-2024-458",
      contact: "+971 50 123 4569",
      email: "contact@primehealthcare.ae",
    ),
    Clinic(
      id: "4",
      name: "City Medical Center",
      address: "123 Healthcare Avenue, Dubai, UAE",
      status: "Pending",
      registrationDate: "2024-01-10",
      licenseId: "CLN-2024-459",
      contact: "+971 50 123 4570",
      email: "contact@citymedical.ae",
    ),
    Clinic(
      id: "5",
      name: "Wellness Clinic",
      address: "321 Health Street, Ajman",
      status: "Approved",
      registrationDate: "2024-01-09",
      licenseId: "CLN-2024-460",
      contact: "+971 50 123 4571",
      email: "info@wellness.ae",
    ),
  ];

  void _navigateToClinicDetail(Clinic clinic) {
    if (widget.onNavigate != null) {
      widget.onNavigate!(ClinicDetailPage(clinic: clinic));
    } else {
      // Fallback navigation using Navigator
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClinicDetailPage(clinic: clinic),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Clinics',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Manage and approve clinic registrations',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            child: TextField(
                              controller: _searchController,
                              decoration: InputDecoration(
                                hintText: 'Search clinics by name, address, or status',
                                prefixIcon: Icon(Icons.search, size: 20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(color: Colors.grey[300]!),
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {
                            // Add new clinic functionality
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Text('Add New Clinic'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Table
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    child: DataTable(
                      headingRowHeight: 48,
                      dataRowHeight: 56,
                      columnSpacing: 24,
                      headingTextStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                      columns: [
                        DataColumn(label: Text('Clinic Name')),
                        DataColumn(label: Text('Address')),
                        DataColumn(label: Text('Status')),
                        DataColumn(label: Text('Registration Date')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: _clinics.map((clinic) {
                        return DataRow(
                          cells: [
                            DataCell(
                              InkWell(
                                onTap: () => _navigateToClinicDetail(clinic),
                                child: Text(
                                  clinic.name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                clinic.address,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            DataCell(
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: clinic.status == 'Approved'
                                      ? Colors.green[100]
                                      : clinic.status == 'Rejected'
                                      ? Colors.red[100]
                                      : Colors.orange[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  clinic.status,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: clinic.status == 'Approved'
                                        ? Colors.green[800]
                                        : clinic.status == 'Rejected'
                                        ? Colors.red[800]
                                        : Colors.orange[800],
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                clinic.registrationDate,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            DataCell(
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.visibility, size: 18, color: Colors.blue),
                                    onPressed: () => _navigateToClinicDetail(clinic),
                                    tooltip: 'View Details',
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.edit, size: 18, color: Colors.blue),
                                    onPressed: () {
                                      // Edit clinic functionality
                                    },
                                    tooltip: 'Edit',
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, size: 18, color: Colors.red),
                                    onPressed: () {
                                      // Delete clinic functionality
                                    },
                                    tooltip: 'Delete',
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.more_vert, size: 18, color: Colors.grey),
                                    onPressed: () {
                                      // More actions functionality
                                    },
                                    tooltip: 'More actions',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),

              // Pagination Footer
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Showing 1-5 of 25 entries',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: _currentPage > 1 ? () {
                            setState(() {
                              _currentPage--;
                            });
                          } : null,
                          child: Text('Previous'),
                        ),
                        SizedBox(width: 8),
                        ...List.generate(3, (index) {
                          int pageNum = index + 1;
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _currentPage = pageNum;
                                });
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: _currentPage == pageNum
                                    ? Colors.blue
                                    : Colors.transparent,
                                foregroundColor: _currentPage == pageNum
                                    ? Colors.white
                                    : Colors.grey[700],
                                minimumSize: Size(32, 32),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Text(pageNum.toString()),
                            ),
                          );
                        }),
                        SizedBox(width: 8),
                        TextButton(
                          onPressed: _currentPage < 3 ? () {
                            setState(() {
                              _currentPage++;
                            });
                          } : null,
                          child: Text('Next'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Updated ClinicDetailPage to accept clinic data
class ClinicDetailPage extends StatelessWidget {
  final Clinic clinic;

  const ClinicDetailPage({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text('Clinic Details'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          width: double.infinity,
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Clinic Information Section
                  _buildSectionHeader('Clinic Information'),
                  SizedBox(height: 24),

                  // Clinic Details
                  _buildInfoRow('Clinic Name', clinic.name),
                  SizedBox(height: 16),
                  _buildInfoRow('License ID', clinic.licenseId),
                  SizedBox(height: 16),
                  _buildInfoRow('Address', clinic.address),
                  SizedBox(height: 16),
                  _buildInfoRow('Contact', clinic.contact),
                  SizedBox(height: 16),
                  _buildInfoRow('Email', clinic.email),

                  SizedBox(height: 48),

                  // License Document Section
                  _buildSectionHeader('License Document'),
                  SizedBox(height: 24),

                  // Document Upload Area
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFFE5E7EB),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.description_outlined,
                          size: 48,
                          color: Color(0xFF9CA3AF),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'clinic_license_${clinic.licenseId.split('-').last}.pdf',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6B7280),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        TextButton(
                          onPressed: () {
                            // View document functionality
                          },
                          child: Text(
                            'View Document',
                            style: TextStyle(
                              color: Color(0xFF3B82F6),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 48),

                  // Action Buttons - only show if status is pending
                  if (clinic.status == 'Pending') ...[
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Approve clinic functionality
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF3B82F6),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Approve Clinic',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        OutlinedButton(
                          onPressed: () {
                            // Reject application functionality
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Color(0xFFDC2626),
                            side: BorderSide(color: Color(0xFFDC2626)),
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Text(
                            'Reject Application',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ] else ...[
                    // Show status badge for approved/rejected clinics
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: clinic.status == 'Approved'
                            ? Colors.green[100]
                            : Colors.red[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Status: ${clinic.status}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: clinic.status == 'Approved'
                              ? Colors.green[800]
                              : Colors.red[800],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFF111827),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF6B7280),
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF111827),
          ),
        ),
      ],
    );
  }
}
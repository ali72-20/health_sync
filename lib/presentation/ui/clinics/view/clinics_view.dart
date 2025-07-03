import 'package:flutter/material.dart';

class Clinic {
  final String name;
  final String address;
  final String status;
  final String registrationDate;

  Clinic({
    required this.name,
    required this.address,
    required this.status,
    required this.registrationDate,
  });
}

class ClinicsView extends StatefulWidget {
  const ClinicsView({super.key});

  @override
  _ClinicsPageState createState() => _ClinicsPageState();
}

class _ClinicsPageState extends State<ClinicsView> {
  final TextEditingController _searchController = TextEditingController();
  int _currentPage = 1;
  final int _itemsPerPage = 25;

  final List<Clinic> _clinics = [
    Clinic(
      name: "Family Care Clinic",
      address: "456 Wellness Street, Abu Dhabi",
      status: "Approved",
      registrationDate: "2024-01-14",
    ),
    Clinic(
      name: "Advanced Medical Hub",
      address: "789 Medical Boulevard, Sharjah",
      status: "Rejected",
      registrationDate: "2024-01-13",
    ),
    Clinic(
      name: "Prime Healthcare Center",
      address: "654 Care Lane, Downtown Dubai",
      status: "Approved",
      registrationDate: "2024-01-11",
    ),
    Clinic(
      name: "Family Care Clinic",
      address: "456 Wellness Street, Abu Dhabi",
      status: "Approved",
      registrationDate: "2024-01-14",
    ),
    Clinic(
      name: "Advanced Medical Hub",
      address: "789 Medical Boulevard, Sharjah",
      status: "Rejected",
      registrationDate: "2024-01-13",
    ),
  ];

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
                              Text(
                                clinic.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
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
                                      : Colors.red[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  clinic.status,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: clinic.status == 'Approved'
                                        ? Colors.green[800]
                                        : Colors.red[800],
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
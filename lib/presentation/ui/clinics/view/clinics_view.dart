import 'package:flutter/material.dart';

class ClinicsScreen extends StatefulWidget {
  const ClinicsScreen({super.key});

  @override
  State<ClinicsScreen> createState() => _ClinicsScreenState();
}

class _ClinicsScreenState extends State<ClinicsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedStatus = 'All';
  int _currentPage = 1;
  final int _itemsPerPage = 10;

  // Sample data - replace with your actual data source
  final List<Clinic> _allClinics = [
    Clinic(
      id: 1,
      name: 'Family Care Clinic',
      address: '456 Wellness Street, San Diego',
      status: 'Active',
      registrationDate: DateTime(2024, 1, 14),
    ),
    Clinic(
      id: 2,
      name: 'Advanced Medical Hub',
      address: '789 Medical Boulevard, Sharjah',
      status: 'Inactive',
      registrationDate: DateTime(2024, 1, 15),
    ),
    Clinic(
      id: 3,
      name: 'Prime Healthcare Center',
      address: '654 Care Lane, Downtown Dubai',
      status: 'Active',
      registrationDate: DateTime(2024, 1, 16),
    ),
    Clinic(
      id: 4,
      name: 'Family Care Clinic',
      address: '456 Wellness Street, San Diego',
      status: 'Active',
      registrationDate: DateTime(2024, 1, 14),
    ),
    Clinic(
      id: 5,
      name: 'Advanced Medical Hub',
      address: '789 Medical Boulevard, Sharjah',
      status: 'Inactive',
      registrationDate: DateTime(2024, 1, 17),
    ),
  ];

  List<Clinic> get _filteredClinics {
    List<Clinic> filtered = _allClinics;

    // Filter by search term
    if (_searchController.text.isNotEmpty) {
      filtered = filtered.where((clinic) =>
      clinic.name.toLowerCase().contains(_searchController.text.toLowerCase()) ||
          clinic.address.toLowerCase().contains(_searchController.text.toLowerCase())).toList();
    }

    // Filter by status
    if (_selectedStatus != 'All') {
      filtered = filtered.where((clinic) => clinic.status == _selectedStatus).toList();
    }

    return filtered;
  }

  List<Clinic> get _paginatedClinics {
    final filtered = _filteredClinics;
    if (filtered.isEmpty) return [];

    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;

    if (startIndex >= filtered.length) {
      return [];
    }

    return filtered.sublist(startIndex, endIndex > filtered.length ? filtered.length : endIndex);
  }

  int get _totalPages {
    final filtered = _filteredClinics;
    if (filtered.isEmpty) return 1;
    return (filtered.length / _itemsPerPage).ceil();
  }

  void _onSearchChanged(String value) {
    setState(() {
      _currentPage = 1;
    });
  }

  void _onStatusChanged(String? value) {
    setState(() {
      _selectedStatus = value!;
      _currentPage = 1;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(),
            const SizedBox(height: 24),

            // Search and Filter Bar
            _buildSearchAndFilter(),
            const SizedBox(height: 24),

            // Data Table
            Expanded(
              child: _buildDataTable(),
            ),

            // Pagination
            if (_totalPages > 1) ...[
              const SizedBox(height: 16),
              _buildPaginationWidget(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Clinics',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Manage your system clinic registrations',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 180, // Fixed width to prevent constraints issues
          child: ElevatedButton.icon(
            onPressed: () {
              // Add new clinic functionality
            },
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text(
              'Add New Clinic',
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchAndFilter() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search clinics by name, address, or status',
                prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              onChanged: _onSearchChanged,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          width: 120, // Fixed width for dropdown
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DropdownButton<String>(
            value: _selectedStatus,
            isExpanded: true,
            underline: const SizedBox(),
            items: ['All', 'Active', 'Inactive']
                .map((status) => DropdownMenuItem(
              value: status,
              child: Text(status),
            ))
                .toList(),
            onChanged: _onStatusChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildDataTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          // Table Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: const Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Clinic Name',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Address',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Status',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Registration Date',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Actions',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),

          // Table Body
          Expanded(
            child: _paginatedClinics.isEmpty
                ? const Center(
              child: Text(
                'No clinics found',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
                : ListView.builder(
              itemCount: _paginatedClinics.length,
              itemBuilder: (context, index) {
                final clinic = _paginatedClinics[index];
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[200]!),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          clinic.name,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          clinic.address,
                          style: TextStyle(color: Colors.grey[600]),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: clinic.status == 'Active'
                                ? Colors.green[100]
                                : Colors.red[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            clinic.status,
                            style: TextStyle(
                              color: clinic.status == 'Active'
                                  ? Colors.green[800]
                                  : Colors.red[800],
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '${clinic.registrationDate.year}-${clinic.registrationDate.month.toString().padLeft(2, '0')}-${clinic.registrationDate.day.toString().padLeft(2, '0')}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, size: 18),
                              onPressed: () {
                                // Edit clinic functionality
                              },
                              color: Colors.blue,
                              constraints: const BoxConstraints(
                                minWidth: 32,
                                minHeight: 32,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, size: 18),
                              onPressed: () {
                                // Delete clinic functionality
                              },
                              color: Colors.red,
                              constraints: const BoxConstraints(
                                minWidth: 32,
                                minHeight: 32,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaginationWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Showing ${_paginatedClinics.isEmpty ? 0 : (_currentPage - 1) * _itemsPerPage + 1} to ${_currentPage * _itemsPerPage > _filteredClinics.length ? _filteredClinics.length : _currentPage * _itemsPerPage} of ${_filteredClinics.length} entries',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        const SizedBox(width: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: _currentPage > 1
                  ? () {
                setState(() {
                  _currentPage--;
                });
              }
                  : null,
              icon: const Icon(Icons.chevron_left),
            ),
            ..._buildPageNumbers(),
            IconButton(
              onPressed: _currentPage < _totalPages
                  ? () {
                setState(() {
                  _currentPage++;
                });
              }
                  : null,
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildPageNumbers() {
    final List<Widget> pageNumbers = [];
    final int maxVisiblePages = 5;

    if (_totalPages <= maxVisiblePages) {
      // Show all pages if total pages are less than or equal to max visible pages
      for (int i = 1; i <= _totalPages; i++) {
        pageNumbers.add(_buildPageButton(i));
      }
    } else {
      // Show a subset of pages
      int start = (_currentPage - 2).clamp(1, _totalPages - maxVisiblePages + 1);
      int end = (start + maxVisiblePages - 1).clamp(1, _totalPages);

      for (int i = start; i <= end; i++) {
        pageNumbers.add(_buildPageButton(i));
      }
    }

    return pageNumbers;
  }

  Widget _buildPageButton(int pageNumber) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: InkWell(
        onTap: () {
          setState(() {
            _currentPage = pageNumber;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: _currentPage == pageNumber
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: _currentPage == pageNumber
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey[300]!,
            ),
          ),
          child: Text(
            pageNumber.toString(),
            style: TextStyle(
              color: _currentPage == pageNumber
                  ? Colors.white
                  : Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

// Data Model
class Clinic {
  final int id;
  final String name;
  final String address;
  final String status;
  final DateTime registrationDate;

  Clinic({
    required this.id,
    required this.name,
    required this.address,
    required this.status,
    required this.registrationDate,
  });
}
import 'package:flutter/material.dart';

class ReportsView extends StatefulWidget {
  const ReportsView({super.key});

  @override
  State<ReportsView> createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {
  String? _selectedReportType;
  final List<String> _reportTypes = [
    'Patient Statistics',
    'Doctor Activity',
    'Clinic Revenue',
    'Appointment Summaries',
  ];

  // This will hold the content of the generated report
  Widget _reportSummaryContent = const Text(
    'Report summary will appear here...',
    style: TextStyle(color: Colors.grey),
  );

  void _generateReport() {
    // In a real app, you would generate a report based on _selectedReportType
    // For this example, we'll just update the text.
    setState(() {
      if (_selectedReportType != null) {
        _reportSummaryContent = Text(
          'Showing generated report for: $_selectedReportType',
          style: const TextStyle(fontSize: 16),
        );
      } else {
        // Optionally, show a message if no report type is selected
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a report type first.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // Constrain the width for a better look on wide screens
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reports',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  _buildDropdown(),
                  const SizedBox(height: 24),
                  _buildSummaryBox(),
                  const SizedBox(height: 32),
                  _buildGenerateButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: _selectedReportType,
          hint: const Text(
            'Select Report Type',
            style: TextStyle(color: Colors.black54),
          ),
          icon: const Icon(Icons.arrow_drop_down),
          items: _reportTypes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedReportType = newValue;
            });
          },
        ),
      ),
    );
  }

  Widget _buildSummaryBox() {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _reportSummaryContent,
      ),
    );
  }

  Widget _buildGenerateButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        onPressed: _generateReport,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade700,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: const Text('Generate Report'),
      ),
    );
  }
}
import '../../../../core/common/common_imports.dart';

class DoctorSearchResultsScreen extends StatelessWidget {
  const DoctorSearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
          child: Container(
            // Constrain the width for larger web screens
            constraints: const BoxConstraints(maxWidth: 1100),
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Breadcrumbs
                const Text(
                  'Doctors / Search Results',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 8),

                // 2. Main Title
                const Text(
                  'Doctor Search Results',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2d3748),
                  ),
                ),
                const SizedBox(height: 24),

                // 3. Main Information Card
                const DoctorInfoCard(),
                const SizedBox(height: 32),

                // 4. Assigned Clinics Section
                const AssignedClinicsSection(),
                const SizedBox(height: 24),

                // 5. Footer section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LastUpdatedInfo(),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle 'Back to Doctors' action
                      },
                      icon: const Icon(Icons.arrow_back, size: 18),
                      label: const Text('Back to Doctors'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF4299E1), // Blue color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}

// --- Reusable Widgets ---

/// Card displaying the doctor's basic and contact information.
class DoctorInfoCard extends StatelessWidget {
  const DoctorInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFFFAFAFA),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: LayoutBuilder(builder: (context, constraints) {
          // Use Row for wider screens and Column for smaller screens
          bool isWide = constraints.maxWidth > 600;
          return Flex(
            direction: isWide ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: isWide ? 1 : 0,
                child: const BasicInformationSection(),
              ),
              if (isWide) const SizedBox(width: 40),
              if (!isWide) const SizedBox(height: 24),
              Expanded(
                flex: isWide ? 1 : 0,
                child: const ContactInformationSection(),
              ),
            ],
          );
        }),
      ),
    );
  }
}

/// "Basic Information" section within the main card.
class BasicInformationSection extends StatelessWidget {
  const BasicInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Basic Information',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20),
        InfoTile(
          icon: Icons.person_outline,
          label: 'Name',
          value: 'Dr. Sarah Johnson',
        ),
        SizedBox(height: 20),
        InfoTile(
          icon: Icons.medical_services_outlined,
          label: 'Specialty',
          value: 'Cardiology',
        ),
        SizedBox(height: 20),
        InfoTile(
          icon: Icons.badge_outlined,
          label: 'License ID',
          value: 'MD2023456',
        ),
        SizedBox(height: 20),
        InfoTile(
          icon: Icons.check_circle_outline,
          label: 'Status',
          value: 'Active',
          valueColor: Colors.green,
          iconColor: Colors.green,
        ),
      ],
    );
  }
}

/// "Contact Information" section within the main card.
class ContactInformationSection extends StatelessWidget {
  const ContactInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20),
        InfoTile(
          icon: Icons.email_outlined,
          label: 'Email',
          value: 'sarah.johnson@healthsync.com',
        ),
        SizedBox(height: 20),
        InfoTile(
          icon: Icons.phone_outlined,
          label: 'Phone',
          value: '+1 (555) 123-4567',
        ),
        SizedBox(height: 20),
        InfoTile(
          icon: Icons.school_outlined,
          label: 'Experience',
          value: '12 years',
        ),
      ],
    );
  }
}

/// A generic tile for displaying an icon, label, and value.
class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;
  final Color? iconColor;

  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: iconColor ?? const Color(0xFF4299E1), size: 24),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                color: valueColor ?? Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Section for displaying the table of assigned clinics.
class AssignedClinicsSection extends StatelessWidget {
  const AssignedClinicsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Assigned Clinics',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias, // Ensures the table respects the border radius
            child: DataTable(
              headingRowColor:
              MaterialStateProperty.all(const Color(0xFF4299E1)),
              headingTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              dataRowColor: MaterialStateProperty.all(const Color(0xFFFAFAFA)),
              dividerThickness: 0, // No vertical dividers
              dataRowMinHeight: 60,
              columns: const [
                DataColumn(label: Text('Clinic Name')),
                DataColumn(label: Text('Location')),
                DataColumn(label: Text('Assignment Date')),
                DataColumn(label: Text('Status')),
              ],
              rows: [
                DataRow(cells: [
                  const DataCell(Text('HealthSync Central')),
                  const DataCell(Text('Downtown Medical District')),
                  const DataCell(Text('Jan 15, 2024')),
                  DataCell(StatusChip(
                    label: 'Active',
                    backgroundColor: Colors.green.shade100,
                    textColor: Colors.green.shade800,
                  )),
                ]),
                DataRow(cells: [
                  const DataCell(Text('HealthSync North')),
                  const DataCell(Text('North Valley Medical Center')),
                  const DataCell(Text('Mar 1, 2024')),
                  DataCell(StatusChip(
                    label: 'Pending',
                    backgroundColor: Colors.orange.shade100,
                    textColor: Colors.orange.shade800,
                  )),
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// A chip-like widget to display status (e.g., Active, Pending).
class StatusChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const StatusChip({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}

/// "Last Updated" text with an icon.
class LastUpdatedInfo extends StatelessWidget {
  const LastUpdatedInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.access_time, color: Colors.grey, size: 16),
        SizedBox(width: 8),
        Text(
          'Last Updated: Today at 2:30 PM',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
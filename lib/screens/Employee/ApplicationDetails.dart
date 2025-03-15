import 'package:flutter/material.dart';

class ApplicationDetailsPage extends StatelessWidget {
  final Map<String, String> application;

  const ApplicationDetailsPage({required this.application, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor = _getStatusColor(application['status']!);

    return Scaffold(
      appBar: AppBar(
        title: Text(application['title']!),
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  application['title']!,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                _buildDetailRow(Icons.business, 'Company', application['company']!),
                _buildDetailRow(Icons.info, 'Status', application['status']!, color: statusColor),
                _buildDetailRow(Icons.calendar_today, 'Applied On', application['appliedDate'] ?? 'N/A'),
                _buildDetailRow(Icons.location_on, 'Location', application['location'] ?? 'Remote'),
                _buildDetailRow(Icons.attach_money, 'Salary', application['salary'] ?? 'Not Disclosed'),
                _buildDetailRow(Icons.email, 'Contact Email', application['contactEmail'] ?? 'N/A'),
                SizedBox(height: 15),
                Text(
                  'Job Description:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),
                Text(
                  application['description'] ?? 'No description available.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value, {Color color = Colors.black87}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: color, size: 22),
          SizedBox(width: 10),
          Text(
            '$label: ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: color),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Accepted':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      case 'Canceled':
        return Colors.orange;
      case 'Under Review':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}

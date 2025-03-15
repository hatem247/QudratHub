import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final Map<String, String> job;
  final VoidCallback onTap;

  const JobCard({required this.job, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        child: Container(
          width: 160, // Ensuring uniform width
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.work, color: Colors.grey[800], size: 24),
              const SizedBox(height: 5),
              Text(
                job['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis, // Prevents text breaking
              ),
              const SizedBox(height: 3),
              Text(
                job['company']!,
                style: TextStyle(color: Colors.grey[600]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

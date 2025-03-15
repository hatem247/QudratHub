import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey[800],
        title: const Text('My Profile',style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 20),
            _buildSectionTitle('My Story'),
            _buildMyStorySection(),
            const SizedBox(height: 20),
            _buildSectionTitle('Skills & Tools'),
            _buildSkillsSection(),
            const SizedBox(height: 20),
            _buildSectionTitle('Activities & Posts'),
            _buildActivityFeed(),
            const SizedBox(height: 20),
            _buildSectionTitle('CV & Experience'),
            _buildCVSection(),
            const SizedBox(height: 20),
            _buildSectionTitle('Community & Support'),
            _buildCommunitySection(),
            const SizedBox(height: 20),
            _buildSectionTitle('Opportunities for Me'),
            _buildOpportunitiesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueGrey,Colors.teal.shade800, Colors.teal.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
          const SizedBox(height: 10),
          const Text(
            'John Doe',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const Text(
            'Software Developer | Accessibility Advocate',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.teal.shade800,
                ),
                child: const Text('Edit Profile'),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Share Profile'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
      ),
    );
  }

  Widget _buildMyStorySection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'I am a software developer passionate about creating accessible technology for everyone. Despite my visual impairment, I have built several apps that help People of Determination live more independently.',
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildSkillChip('Flutter Development'),
        _buildSkillChip('Accessibility Design'),
        _buildSkillChip('Public Speaking'),
        _buildSkillChip('Assistive Technology'),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: Colors.teal.shade100,
      labelStyle: const TextStyle(color: Colors.teal),
    );
  }

  Widget _buildActivityFeed() {
    return Column(
      children: List.generate(3, (index) => _buildPostCard('Post ${index + 1}')),
    );
  }

  Widget _buildPostCard(String content) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Shared 2 hours ago', style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(content, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.thumb_up, size: 20),
                  onPressed: () {},
                ),
                const Text('12'),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.comment, size: 20),
                  onPressed: () {},
                ),
                const Text('3'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCVSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const Icon(Icons.file_present, color: Colors.teal),
        title: const Text('Upload Your CV'),
        subtitle: const Text('Last updated: 2 days ago'),
        trailing: IconButton(
          icon: const Icon(Icons.upload_file, color: Colors.teal),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildCommunitySection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Connect with Others', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _CommunityStat(title: 'Support Groups', count: '15'),
                _CommunityStat(title: 'Mentors', count: '5'),
                _CommunityStat(title: 'Connections', count: '150'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpportunitiesSection() {
    return Column(
      children: [
        ...List.generate(
          2,
              (index) => Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.work, color: Colors.teal),
              title: Text('Job Opportunity ${index + 1}'),
              subtitle: const Text('Company Name | Remote | \$80k - \$100k'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward, color: Colors.teal),
                onPressed: () {},
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {},
          child: const Text('View All Opportunities', style: TextStyle(color: Colors.teal)),
        ),
      ],
    );
  }
}

class _CommunityStat extends StatelessWidget {
  final String title;
  final String count;
  const _CommunityStat({required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal)),
        Text(title, style: TextStyle(color: Colors.grey.shade600)),
      ],
    );
  }
}
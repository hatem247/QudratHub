import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_tts/flutter_tts.dart';
class CareerAdvicePage extends StatefulWidget {
  final String title;

  const CareerAdvicePage({Key? key, required this.title}) : super(key: key);

  @override
  _CareerAdvicePageState createState() => _CareerAdvicePageState();
}

class _CareerAdvicePageState extends State<CareerAdvicePage> {
  final FlutterTts flutterTts = FlutterTts();

  String getAdvice() {
    switch (widget.title) {
      case 'How to Write a CV':
        return '''
### 📝 **Choose the Right Format**
- Chronological, Functional, or Combination.
- Use **Chronological** for most cases.

### 📌 **Essential Sections**
- ✅ Header (Name, Contact, LinkedIn)
- ✅ Work Experience (Achievements, Action Verbs)
- ✅ Education, Skills, Certifications

### 🎨 **Formatting**
- Keep it **1-2 pages**
- Use **bullet points**
- Choose **professional fonts**

### 🎯 **Tailor Your CV**
- Include **keywords** from job descriptions.

### 🔍 **Proofread & Submit as PDF**
- Use **Grammarly** and save as **FirstName_CV.pdf**
        ''';
      case 'Interview Tips':
        return '''
### 🔍 **Research the Company**
- Learn about its mission, culture, and role requirements.

### ❓ **Prepare for Common Questions**
- "Tell me about yourself" → Highlight skills & experience.
- "What are your strengths/weaknesses?" → Be honest & show growth.

### 🌟 **STAR Method for Answers**
- **Situation** → Context of challenge
- **Task** → Your role
- **Action** → Steps you took
- **Result** → Outcome

### 💡 **Confidence & Body Language**
- Maintain eye contact, avoid fidgeting.
- Speak clearly, stay calm.

### 🗣️ **Ask Thoughtful Questions**
- ✅ "What does success in this role look like?"
- ✅ "What are the next steps in the hiring process?"

### ✉️ **Follow Up with a Thank-You Email**
- Send within **24 hours**
- Reaffirm your interest & gratitude
        ''';
      case 'Job Search Strategies':
        return '''
### 🔗 **Optimize Your LinkedIn**
- Keep your profile updated.
- Engage with industry professionals.

### 🤝 **Network Actively**
- Attend events, join groups, seek mentorship.

### 📄 **Tailor Your Applications**
- Customize CV & cover letter for each job.

### 🌍 **Use Multiple Platforms**
- Explore job boards, company websites, agencies.

### 📩 **Follow Up**
- Send a polite follow-up email after applying.

### 🚀 **Stay Persistent & Positive**
- Learn from feedback & keep improving.
        ''';
      default:
        return 'More career tips coming soon!';
    }
  }

  void _speakAdvice() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(getAdvice().replaceAll('#', '').replaceAll('*', ''));
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey[100],
        title: Text(widget.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      body:
      Container(color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.black26 : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: MarkdownBody(
                data: getAdvice(),
                styleSheet: MarkdownStyleSheet(
                  h3: TextStyle(
                    fontSize:23, // Increase header size
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                  p: TextStyle(
                    fontSize: 19, // Keep paragraphs smaller than headers
                    height: 1.8,
                    color: isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                  listBullet: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _speakAdvice,
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.volume_up, color: Colors.white, size: 28),
      ),
    );
  }
}

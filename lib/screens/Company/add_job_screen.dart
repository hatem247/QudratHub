import 'package:flutter/material.dart';

import '../../widgets/custom_drawer_widget.dart';

class AddJobScreen extends StatefulWidget {
  const AddJobScreen({super.key});

  @override
  _AddJobScreenState createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  String? selectedJobType;
  List<String> selectedSkills = [];
  List<String> selectedDisabilities = [];

  final List<String> skills = [
    "Communication",
    "Teamwork",
    "Problem-solving",
    "Coding",
    "Marketing",
    "Design"
  ];

  final List<String> disabilityTypes = [
    "Paraplegia",
    "Quadriplegia",
    "Muscular Dystrophy",
    "Limb Amputation",
  ];

  final List<String> jobTypes = ["Full-Time", "Part-Time", "Remote"];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey, // ربط الـ Scaffold بالمفتاح
      drawer: CustomDrawer(),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          _buildCustomAppBar(screenHeight),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: ListView(
                children: [
                  _buildTextField("Job Title", jobTitleController),
                  const SizedBox(height: 15),
                  _buildMultiSelectField(
                      "Required Skills", skills, selectedSkills),
                  const SizedBox(height: 15),
                  _buildMultiSelectField("Accepted Disability Type",
                      disabilityTypes, selectedDisabilities),
                  const SizedBox(height: 15),
                  _buildTextField("Salary", salaryController,
                      keyboardType: TextInputType.number),
                  const SizedBox(height: 15),
                  _buildDropdownField("Job Type", jobTypes, selectedJobType,
                      (value) {
                    setState(() {
                      selectedJobType = value;
                    });
                  }),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (jobTitleController.text.isEmpty ||
                          selectedJobType == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Please fill all required fields")),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Job Added Successfully!")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("Save Job",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildMultiSelectField(
      String label, List<String> options, List<String> selectedList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: options.map((option) {
            bool isSelected = selectedList.contains(option);
            return ChoiceChip(
              label: Text(option),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedList.add(option);
                  } else {
                    selectedList.remove(option);
                  }
                });
              },
              selectedColor: Colors.blueAccent,
              labelStyle:
                  TextStyle(color: isSelected ? Colors.white : Colors.black),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, List<String> options,
      String? selectedValue, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onChanged: onChanged,
      items: options.map((option) {
        return DropdownMenuItem(value: option, child: Text(option));
      }).toList(),
    );
  }

  Widget _buildCustomAppBar(double screenHeight) {
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.16,
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                  onPressed: () {
                    _scaffoldKey.currentState
                        ?.openDrawer();
                  },
                ),
                const Column(
                  children: [
                    Text(
                      "",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      "Add Job",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications,
                          color: Colors.white, size: 28),
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        height: screenHeight * 0.012,
                        width: screenHeight * 0.012,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
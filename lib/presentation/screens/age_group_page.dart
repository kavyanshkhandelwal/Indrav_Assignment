// import 'package:flutter/material.dart';

// class AgeGroupPage extends StatefulWidget {
//   const AgeGroupPage({super.key});

//   @override
//   State<AgeGroupPage> createState() => _AgeGroupPageState();
// }

// class _AgeGroupPageState extends State<AgeGroupPage> {
//   String? _selectedGroup;

//   final List<String> _ageGroups = [
//     '18–20',
//     '21–25',
//     '26–30',
//     '31–35',
//     '36–40',
//     '41+',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Select Age Group')),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Please select your age group:',
//                 style: TextStyle(fontSize: 18)),
//             const SizedBox(height: 20),
//             ..._ageGroups.map((group) => RadioListTile<String>(
//                   title: Text(group),
//                   value: group,
//                   groupValue: _selectedGroup,
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedGroup = value;
//                     });
//                   },
//                 )),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _selectedGroup != null
//                   ? () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Selected: $_selectedGroup')),
//                       );
//                     }
//                   : null,
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';

class AgeGroupPage extends StatefulWidget {
  const AgeGroupPage({super.key});

  @override
  State<AgeGroupPage> createState() => _AgeGroupPageState();
}

class _AgeGroupPageState extends State<AgeGroupPage> {
  String? _selectedGroup;

  final List<String> _ageGroups = ['18–20', '21–25', '26–30', '31–35', '36–40', '41+'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Age Group')),
      body: Center(
        child: GlassCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Choose your age group:', style: TextStyle(fontSize: 18, color: Colors.white70)),
              const SizedBox(height: 20),
              ..._ageGroups.map((group) => RadioListTile<String>(
                    title: Text(group, style: const TextStyle(color: Colors.white)),
                    value: group,
                    groupValue: _selectedGroup,
                    onChanged: (value) => setState(() => _selectedGroup = value),
                    activeColor: const Color(0xFF00F6ED),
                    tileColor: Colors.white10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _selectedGroup != null
                    ? () => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Selected: $_selectedGroup')),
                        )
                    : null,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

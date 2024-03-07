import 'package:counter_app/provider/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key,});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Example'),
      ),
      body: Column(
        children: [
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Slider(
                max: 1,
                min: 0,
                value: value.value,
                onChanged: (val) {
                  context.read<SliderProvider>().setValue(val);
                },
              );
            },
          ),
          const Text('Brightness '),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Container(
                height: 300,
                width: 400,
                color: Colors.black.withOpacity(value.value),
              );
            },
          ),
          const SizedBox(height: 20),
          TextField(
            controller: firstNameController,
            decoration: const InputDecoration(
              hintText: 'First Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: lastNameController,
            decoration: const InputDecoration(
              hintText: 'Last Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Text('Full Name: ${value.fullName ?? ""}');
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              final firstName = firstNameController.text;
              final lastName = lastNameController.text;
              context.read<SliderProvider>().setFullName(firstName, lastName);



            },
            child: const Text('Show Full Name'),
          ),
        ],
      ),
    );
  }
}

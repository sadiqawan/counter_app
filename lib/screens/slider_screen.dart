

import 'package:counter_app/provider/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Example'),
      ),
      body: Column(
        children: [
          Consumer<SliderProvider>(builder: (context, value, child) {
            return Slider(
                max: 1,
                min: 0,
                value: (value.value),
                onChanged: (val) {
                  context.read<SliderProvider>().setValue(val);
                });
          }),
          const Text('Brightness '),
          Consumer<SliderProvider>(builder: (context, value, child) {
            return Container(
              height: 400,
              width: 400,
              color: Colors.black.withOpacity(value.value),
            );
          })
        ],
      ),
    );
  }
}

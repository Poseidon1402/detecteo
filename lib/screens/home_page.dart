import 'package:flutter/material.dart';
import 'package:ultralytics_yolo/ultralytics_yolo.dart';
import 'package:ultralytics_yolo/widgets/yolo_controller.dart';

import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final YOLOViewController _controller = .new();
  double _confidence = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: YOLOView(
        modelPath: 'yolo11n_int8',
        task: YOLOTask.detect,
        controller: _controller,
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        showDragHandle: true,
        backgroundColor: AppColor.deepNavyBlue,
        builder: (_) => Container(
          padding: const EdgeInsets.all(12.0),
          height: 200,
          child: Column(
            children: [
              Row(
                spacing: 10,
                children: [
                  Icon(Icons.tune, color: AppColor.primaryBlueAccent),
                  Text(
                    'Confidence',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Text(
                    _confidence.toStringAsFixed(2),
                    style: TextStyle(
                      color: AppColor.primaryBlueAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              // Slider
              Slider(
                value: _confidence,
                activeColor: AppColor.primaryBlueAccent,
                thumbColor: AppColor.white,
                inactiveColor: Colors.white.withAlpha(75),
                onChanged: _onSliderValueChange,
              ),
              // Switch camera button
              IconButton.filled(
                onPressed: _onSwitchCamera,
                padding: const EdgeInsets.all(16.0),
                style: IconButton.styleFrom(
                  backgroundColor: AppColor.primaryBlueAccent.withAlpha(85),
                ),
                iconSize: 32.0,
                icon: Icon(Icons.cameraswitch, color: Colors.white,),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSliderValueChange(double value) {
    _controller.setConfidenceThreshold(value);
    setState(() => _confidence = value);
  }

  void _onSwitchCamera() {
    _controller.switchCamera();
  }
}

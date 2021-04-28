import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_colors.dart';
import 'package:flutter_application_1/core/app_text_styles.dart';

class ChartWidget extends StatefulWidget {
  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void _initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<double>(begin: 0.0, end: 0.75).animate(_controller);
    _controller.forward();
  }

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 136,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  child: AnimatedBuilder(
                animation: _animation,
                builder: (context, _) => Stack(
                  children: [
                    Center(
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Container(
                            width: constraints.maxWidth,
                            height: constraints.maxWidth,
                            constraints:
                                BoxConstraints(maxHeight: 80, maxWidth: 80),
                            child: CircularProgressIndicator(
                              value: _animation.value,
                              strokeWidth: 10,
                              backgroundColor: AppColors.chartSecondary,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.chartPrimary),
                            ),
                          );
                        },
                      ),
                    ),
                    Center(
                      child: Text(
                        "${(_animation.value * 100).toInt()}%",
                        style: AppTextStyles.heading,
                      ),
                    )
                  ],
                ),
              )),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vamos começar",
                      style: AppTextStyles.heading,
                    ),
                    Text(
                      "Complete os desafios e avance em conhecimento",
                      style: AppTextStyles.body,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_gradients.dart';
import 'package:flutter_application_1/core/app_text_styles.dart';
import 'package:flutter_application_1/home/widgets/chart_widget.dart';
import 'package:flutter_application_1/models/user.model.dart';

class AppBarWidget extends PreferredSize {
  final User user;

  AppBarWidget({required this.user})
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: "Olá, ",
                              style: AppTextStyles.title,
                              children: [
                                TextSpan(
                                  text: user.name,
                                  style: AppTextStyles.titleBold,
                                ),
                              ]),
                        ),
                        Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                user.photoUrl,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(alignment: Alignment(0, 1.2), child: ChartWidget()),
              ],
            ),
          ),
        );
}

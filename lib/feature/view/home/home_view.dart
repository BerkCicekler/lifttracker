import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/feature/widgets/information_container.dart';
import 'package:lifttracker/product/constants/enums/padding_enums.dart';

/// Home screen class
@RoutePage()
class HomeView extends StatelessWidget {
  /// Home screen constructor
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.page.value),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomInformationContainer(
                    title: 'home.countWorkoutWeek'.tr(),
                    number: '4',
                  ),
                  CustomInformationContainer(
                    title: 'home.countWorkoutMonth'.tr(),
                    number: '19',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:evently_c20/core/resources/app_constants.dart';
import 'package:evently_c20/core/resources/assets_manager.dart';
import 'package:evently_c20/model/event_model.dart';
import 'package:evently_c20/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  final EventModel event;
  const EventItem({super.key,required this.event});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.25,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: screenHeight * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme
                    .of(context)
                    .colorScheme
                    .secondary
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  provider.themeMode == ThemeMode.dark
                      ? AppConstants.darkEventTypeBackground[event.type]??""
                      : AppConstants.lightEventTypeBackground[event.type]??"",
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .secondary,
                    )
                  ),
                  child: Text(event.dateAndTime?.toDate().day.toString()??"",style: Theme.of(context).textTheme.headlineSmall,),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 9.5,
                    horizontal: 8
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .secondary,
                      )
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(event.title??"",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),),
                      ),
                      IconButton(onPressed: () {
                        
                      }, icon: SvgPicture.asset(AssetsManager.heart_selected))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:evently_c20/core/remote/network/firestore_manager.dart';
import 'package:evently_c20/model/event_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/reusable_components/event_item.dart';

class AllView extends StatelessWidget {
  const AllView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreManager.getAllEvents(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            // loading status
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            // Error status
            return Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(onPressed: () {

                }, child: Text("Try Again"))
              ],
            );
          }
          // success status
          List<EventModel> events = snapshot.data??[];
          if(events.isEmpty){
            return Center(child: Text('No events found',style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary
            ),),);
          }
          return ListView.separated(
              itemBuilder: (context, index) => EventItem(event: events[index],),
              separatorBuilder: (context, index) => SizedBox(height: 16,),
              itemCount: events.length
          );
        },
    );
  }
}

import 'package:flutter/material.dart';
/*import 'package:/config/palette.dart';
import 'package:/config/styles.dart';
import 'package:/data/data.dart';
import 'package:/lib/widgets/widgets.dart';*/
import 'package:flutter_covid_dashboard_ui/config/palette.dart';
import 'package:flutter_covid_dashboard_ui/config/styles.dart';
import 'package:flutter_covid_dashboard_ui/data/data.dart';
import 'package:flutter_covid_dashboard_ui/widgets/country_dropdown.dart';
import 'package:flutter_covid_dashboard_ui/widgets/custom_app_bar.dart';


class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(

      appBar: CustomAppBar(),
      body: CustomScrollView(

        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildInfoHeader(screenHeight),
          _buildInfo(screenHeight),
        ],
      ),
    );
  }

}

SliverToBoxAdapter _buildInfoHeader(double screenHeight){
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Palette.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Информация',
                   style: const TextStyle(
                    color: Colors.white,
                     fontSize: 25.0,
                   fontWeight: FontWeight.bold,
                ),
                ),
              ],
            ),
          ],
      )
    ),
  );
}

SliverToBoxAdapter _buildInfo(double screenHeight) {
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Симптомы',
            textAlign: TextAlign.center,
            style: const TextStyle(

              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),

          ),
          Text(
            'Общие симптомы инфекции включают респираторные симптомы, лихорадку, кашель,'+
                'одышку и затрудненное дыхание. В более тяжелых случаях инфекция может вызывать'+
                'пневмонию, тяжелый острый респираторный синдром, почечную недостаточность или даже смерть',
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20.0),
          Column(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: simptoms
                .map((e) => Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[
                Text(
                  e.keys.first,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),


                ),
                SizedBox(height: 30),
                Text(
                  e.values.first,
                  style: const TextStyle(

                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    backgroundColor: Colors.red,

                  ),

                  textAlign: TextAlign.right,

                )
              ],
            ))
                .toList(),
          ),
        ],
      ),
    ),
  );
}
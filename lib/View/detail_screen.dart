import 'dart:math';

import 'package:covid_19_tracker/View/world_stats.dart';
import 'package:flutter/material.dart';

class CountryDetailScreen extends StatefulWidget {
  String name;
  String image;
  int totalCases, totalDeaths, totalRecovered, active, critical, todayRecovered;
  CountryDetailScreen({
    super.key,
    required this.name,
    required this.image,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
  });

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.name}'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      ReusableRow(
                        title: 'TotalCases',
                        value: widget.totalCases.toString(),
                      ),
                      ReusableRow(
                        title: 'Total Death',
                        value: widget.totalDeaths.toString(),
                      ),
                      ReusableRow(
                        title: 'Total Recover',
                        value: widget.todayRecovered.toString(),
                      ),
                      ReusableRow(
                        title: 'Active',
                        value: widget.active.toString(),
                      ),
                      ReusableRow(
                        title: 'Critical',
                        value: widget.critical.toString(),
                      ),
                      ReusableRow(
                        title: 'Today Recovered',
                        value: widget.todayRecovered.toString(),
                      ),
                    ],
                  ),
                ),
              ),

              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

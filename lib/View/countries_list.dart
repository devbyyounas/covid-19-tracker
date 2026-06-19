import 'package:covid_19_tracker/Services/stats_services.dart';
import 'package:covid_19_tracker/View/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with country name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: statsServices.countriesListAPI(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade300,
                          child: Column(
                            children: [
                              ListTile(
                                title: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  color: Colors.white,
                                ),
                                leading: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]['country'];
                        if (searchController.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CountryDetailScreen(
                                        name: snapshot.data![index]['country'],
                                        image: snapshot
                                            .data![index]['countryInfo']['flag'],
                                        totalCases:
                                            snapshot.data![index]['cases'],
                                        totalDeaths:
                                            snapshot.data![index]['deaths'],
                                        totalRecovered:
                                            snapshot.data![index]['recovered'],
                                        active: snapshot.data![index]['active'],
                                        critical:
                                            snapshot.data![index]['critical'],
                                        todayRecovered: snapshot
                                            .data![index]['todayRecovered'],
                                      ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  title: Text(snapshot.data![index]['country']),
                                  leading: Image(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.07,
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    image: NetworkImage(
                                      snapshot
                                          .data![index]['countryInfo']['flag'],
                                    ),
                                  ),
                                  subtitle: Text(
                                    'Total Cases: ${snapshot.data![index]['cases']}',
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (name.toLowerCase().contains(
                          searchController.text.toLowerCase(),
                        )) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CountryDetailScreen(
                                        name: snapshot.data![index]['country'],
                                        image: snapshot
                                            .data![index]['countryInfo']['flag'],
                                        totalCases:
                                            snapshot.data![index]['cases'],
                                        totalDeaths:
                                            snapshot.data![index]['deaths'],
                                        totalRecovered:
                                            snapshot.data![index]['recovered'],
                                        active: snapshot.data![index]['active'],
                                        critical:
                                            snapshot.data![index]['critical'],
                                        todayRecovered: snapshot
                                            .data![index]['todayRecovered'],
                                      ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  title: Text(snapshot.data![index]['country']),
                                  leading: Image(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.07,
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    image: NetworkImage(
                                      snapshot
                                          .data![index]['countryInfo']['flag'],
                                    ),
                                  ),
                                  subtitle: Text(
                                    'Total Cases: ${snapshot.data![index]['cases']}',
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

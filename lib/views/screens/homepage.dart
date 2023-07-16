import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_1/controller/weatherprovider.dart';
import 'package:weather_app_1/models/connectivitymodel.dart';
import 'package:weather_app_1/models/weatherdatamodel.dart';
import 'package:intl/intl.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: (Provider.of<ConnectivityProvider>(context)
                    .connectivityModel
                    .Connectivitystatus ==
                "waiting")
            ? const Center(
                child: Text(
                  "Offline",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              )
            : SafeArea(
                child: Column(
                children: [
                  Expanded(
                    child: FutureBuilder(
                      future:
                          Provider.of<WeatherProvider>(context, listen: false)
                              .Weatherdata(Provider.of<WeatherProvider>(context,
                                      listen: true)
                                  .location),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("ERROR : ${snapshot.error}"),
                          );
                        } else if (snapshot.hasData) {
                          weatherModel? weatherdata = snapshot.data;
                          return (weatherdata == null)
                              ? const Center(
                                  child: Text("No Data avilable"),
                                )
                              : Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        (weatherdata.isday == 1
                                            ? 'assets/images/1.png'
                                            : 'assets/images/5.png'),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: h * 0.01,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(14),
                                          child: TextField(
                                            cursorColor: Colors.black,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  Icons.location_on_outlined,
                                                  color: Colors.black),
                                              hintText: "Enter any city",
                                              hintStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 2,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                            controller:
                                                Provider.of<WeatherProvider>(
                                                        context,
                                                        listen: false)
                                                    .citycontroller,
                                            onSubmitted: (String name) {
                                              if (name.isNotEmpty) {
                                                Provider.of<WeatherProvider>(
                                                        context,
                                                        listen: false)
                                                    .locationchanage(name);
                                              }
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: h * 0.18,
                                              width: w * 0.8,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                  width: 2,
                                                  color: Colors.black,
                                                ),
                                                color: Colors.white38,
                                              ),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: w * 0.02,
                                                  ),
                                                  const Icon(
                                                    Icons.location_on_outlined,
                                                    size: 30,
                                                    color: Colors.black,
                                                  ),
                                                  SizedBox(
                                                    height: w * 0.02,
                                                  ),
                                                  Text(
                                                    "${weatherdata.name}",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                  SizedBox(
                                                    height: w * 0.02,
                                                  ),
                                                  Text(
                                                    "   ${weatherdata.region}, ${weatherdata.country}.",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 35),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              height: h * 0.18,
                                              width: w * 0.8,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                  width: 2,
                                                  color: Colors.black,
                                                ),
                                                color: Colors.white38,
                                              ),
                                              // alignment:Alignment.topCenter,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            top: 20,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                                "${DateFormat('MMMM').format(dateTime)} ${dateTime.day}, ${dateTime.year}",
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 22,
                                                                )),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text("======================",style: TextStyle(color: Colors.black),),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                            "${weatherdata.localtime.split(" ")[1]}",
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 22,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          height: h * 0.2,
                                          width: w * 0.8,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                              width: 3,
                                              color: Colors.black,
                                            ),
                                            color: Colors.white38,
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: w * 0.07,
                                              ),
                                              Text(
                                                "${weatherdata.temp_c}°C",
                                                style: const TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              SizedBox(
                                                height: w * 0.01,
                                              ),
                                              Text("============================",style: TextStyle(color: Colors.black),),
                                              SizedBox(
                                                height: w * 0.02,
                                              ),
                                              Text(
                                                "${weatherdata.text}",
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: h * 0.2,
                                          width: w * 0.8,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                              width: 2,
                                              color: Colors.black,
                                            ),
                                            color: Colors.white38,
                                          ),
                                          // alignment:Alignment.topCenter,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 60,
                                                          width: 60,
                                                          decoration: const BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/images/9.png"))),
                                                        ),
                                                        Text(
                                                          "${weatherdata.temp_f}\nTemp F",
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),

                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 60,
                                                          width: 60,
                                                          decoration: const BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/images/8.png"))),
                                                        ),
                                                        Text(
                                                          "    ${weatherdata.cloud}\nCloud",
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 60,
                                                          width: 60,
                                                          decoration: const BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/images/7.png"))),
                                                        ),
                                                        Text(
                                                          "${weatherdata.sunrise}\nSunRise",
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 60,
                                                          width: 60,
                                                          decoration: const BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/images/6.png"))),
                                                        ),
                                                        Text(
                                                          "${weatherdata.sunset}\nSunSet",
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              ...weatherdata.hour
                                                  .map((e) => Container(
                                                        height: 80,
                                                        width: 160,
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white38,
                                                          border: Border.all(
                                                            color: Colors.black,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    height: 70,
                                                                    width: 80,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            image:
                                                                                DecorationImage(
                                                                      image: NetworkImage(
                                                                          "http:${weatherdata.icon1}"),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    )),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          h *
                                                                              0.01,
                                                                    ),
                                                                    Text(
                                                                      e['time']
                                                                          .toString()
                                                                          .split(
                                                                              " ")[1],
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          h *
                                                                              0.01,
                                                                    ),
                                                                    Text(
                                                                      "${e['temp_c']} °c",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            18,
                                                                      ),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ],
                                                        ),
                                                      ))
                                                  .toList()
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ],
              )),
      ),
    );
  }
}

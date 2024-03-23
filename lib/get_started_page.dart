import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:zoho_creator_config/login_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amberAccent,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/back_bilke.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    const Icon(
                      Icons.electric_bike_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                    const Spacer(),
                    Text(
                      "Explore >".toUpperCase(),
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Let the thrill",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const Text("begin",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: SwipeButton.expand(
                        height: 60,
                        thumb: const Icon(
                          Icons.double_arrow_rounded,
                          color: Colors.black,
                        ),
                        activeThumbColor: Colors.white,
                        activeTrackColor: Colors.black,
                        thumbPadding: const EdgeInsets.all(5),
                        onSwipe: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

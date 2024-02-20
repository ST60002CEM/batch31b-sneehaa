import 'package:bookaway/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        bottom: false,
        child: Stack(children: [
          Container(
            height: double.infinity,
            margin: EdgeInsets.only(top: size.height * 0.25),
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [_HeaderSection(), _SearchCard()],
            ),
          )
        ]),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage('assets/images/profile.png')),
            CustomIconButton(
              icon: Icon(Icons.notifications),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Welcome Again",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
          ),
        )
      ],
    );
  }
}

class _SearchCard extends StatelessWidget {
  const _SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)),
      child: const Column(
        children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined),
              SizedBox(
                width: 20.0,
              ),
              Flexible(
                  child: TextField(
                decoration: InputDecoration(label: Text("From?",)),
              ))
            ],
          )
        ],
      ),
    );
  }
}

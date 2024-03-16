import 'package:flutter/material.dart';
import 'package:repofinder/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/repo_finder.png'),
            const SizedBox(
              height: 80,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side:  const BorderSide(color: Color(0xFF9C57B3), width: 2.0),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchPage(),),
                );
              },
              child: const Text(
                'Find me some repo!',
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

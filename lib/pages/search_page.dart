import 'package:flutter/material.dart';

import 'package:repofinder/repositories/repository.dart';

import '../models/repo_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _ownerController = TextEditingController();
  Future<List<RepoModel>>? _futureRepo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/logo.png'),
                const SizedBox(
                  width: 10,
                ),
                const Flexible(
                  child: Text(
                    'Find your favorite GitHub repositories!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: _ownerController,
                    obscureText: false,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF9C57B3),
                        )),
                        labelText: 'Enter a GitHub username',
                        labelStyle:
                            TextStyle(color: Colors.purple[100], fontSize: 18)),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFE1BEE7), width: 1.0),
              ),
              onPressed: () {
                setState(() {
                  _futureRepo = getRepos(_ownerController.text);
                });
              },
              child: const Text(
                'Search',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<List<RepoModel>>(
                future: _futureRepo,
                builder: ((context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.data != null &&
                      snapshot.data!.isNotEmpty) {
                    return Expanded(
                        child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final RepoModel element = snapshot.data![index];
                        return SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: const BorderSide(
                                  color: Color(0xFFE1BEE7), width: 1.0),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        element.name ?? '-',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        element.description ?? '-',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        element.htmlUrl ?? '-',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: snapshot.data!.length,
                    ));
                  } else {
                    return const Center(
                      child: Text(
                        'Is so empty now :(',
                        style: (TextStyle(color: Colors.white)),
                      ),
                    );
                  }
                }))
          ],
        ),
      ),
    );
  }
}

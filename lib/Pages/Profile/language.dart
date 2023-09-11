import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';

List<String> options = [
  "English",
  "indonesia",
  "Arabic",
  "chinese",
  "Dutch",
  "French",
  "Germany",
  "japanese",
  "korean",
  "portugese"
];

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String currentoption = options[0];
  List<String> flags = [
    'gb',
    'id',
    'sa',
    'cn',
    'dk',
    'fr',
    'de',
    'jp',
    'kr',
    "pt"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text("Language",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Scrollbar(
        thickness: 5,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),

                          leading: Container(
                            width: 30,
                            height: 30,
                            child: CountryFlag.fromCountryCode('${flags[index]}'),
                          ),
                          title: Text(
                            options[index],
                            style:
                            const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          trailing: Radio(
                              value: options[index],
                              groupValue: currentoption,
                              onChanged: (value) {
                                setState(() {
                                  currentoption = value.toString();
                                });
                              }),
                          selectedTileColor: Colors.blue[700],

                        ),
                        Divider(
                          color: Colors.grey.shade400,
                          indent: 10,
                          endIndent: 20,
                        ),
                        const SizedBox(height: 3)
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

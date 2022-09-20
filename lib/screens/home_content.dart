import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double titleFontSize =
        MediaQuery.of(context).size.width > 1250 ? 48 : 36;
    final double descriptionFontSize =
        MediaQuery.of(context).size.width > 1250 ? 24 : 16;

    final double paddingBodyContent =
        MediaQuery.of(context).size.width > 1440 ? 100 : 0;

    const buildingImage =
        Image(image: AssetImage("assets\\images\\building.png"));

    const condominiumDescription =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

    return ListView(
      children: [
        Container(
          padding:
              EdgeInsets.fromLTRB(paddingBodyContent, 0, paddingBodyContent, 0),
          height: MediaQuery.of(context).size.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aqui é um site sobre condominio',
                        style: GoogleFonts.lobster(fontSize: titleFontSize),
                      ),
                      SizedBox(height: 48),
                      Text(
                        condominiumDescription,
                        style: TextStyle(fontSize: descriptionFontSize),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
              ),
              const Flexible(child: buildingImage),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          color: Colors.black,
          child: Row(
            children: [
              Text(
                "Contatos: 61-99999999",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}

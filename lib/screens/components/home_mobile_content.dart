import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

final _kPersonalInstagram = Uri.parse('https://www.instagram.com/pedrbayma/');
final _kPersonalLinkedin =
    Uri.parse('https://www.linkedin.com/in/pedro-bayma/');

class HomeMobileContent extends StatelessWidget {
  const HomeMobileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double titleFontSize =
        MediaQuery.of(context).size.width > 1250 ? 48 : 36;
    final double descriptionFontSize =
        MediaQuery.of(context).size.width > 1250 ? 24 : 16;

    const buildingImage =
        Image(image: AssetImage("assets\\images\\building.png"));
    const instagramLogo = Image(
      image: AssetImage("assets\\icons\\white_insta_logo.png"),
      height: 24,
      width: 24,
    );
    const linkedinLogo = Image(
      image: AssetImage("assets\\icons\\white_linkedin_logo.png"),
      height: 24,
      width: 24,
    );

    const condominiumDescription =
        "Nossa empresa tem o objetivo de dar tranquilidade para o síndico e transparência para moradores, sempre melhorando a experiência de morar em condomínios. Temos a idéia de tratar o condomínio como uma empresa, facilitando ao máximo a usabilidade dos moradores!";

    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
              buildingImage,
              Text(
                'Administradora digital do seu condomínio',
                style: GoogleFonts.lobster(fontSize: titleFontSize),
              ),
              const SizedBox(height: 48),
              Text(
                condominiumDescription,
                style: TextStyle(fontSize: descriptionFontSize),
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        Container(
          color: Colors.black,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Automações para seu conforto.",
                style: GoogleFonts.lobster(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 48),
              const Text(
                "Contatos: 61-996360014",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const InkWell(
                onTap: _launchInstagramUrl,
                child: instagramLogo,
              ),
              const SizedBox(height: 16),
              const InkWell(
                onTap: _launcLinkedinhUrl,
                child: linkedinLogo,
              ),
              const SizedBox(height: 48),
              Text(
                "Somos apaixonados por tecnologia. É ela que nos permite promover a integração do conforto de cada usuário e entregando automação e facilidades da forma mais personalizada possível.",
                style: GoogleFonts.lobster(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

Future<void> _launchInstagramUrl() async {
  if (!await launchUrl(_kPersonalInstagram)) {
    throw 'Could not launch $_kPersonalInstagram';
  }
}

Future<void> _launcLinkedinhUrl() async {
  if (!await launchUrl(_kPersonalLinkedin)) {
    throw 'Could not launch $_kPersonalLinkedin';
  }
}

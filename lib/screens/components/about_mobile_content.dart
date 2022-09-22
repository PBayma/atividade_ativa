import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMobileContent extends StatelessWidget {
  const AboutMobileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double titleFontSize =
        MediaQuery.of(context).size.width > 1250 ? 48 : 36;
    final double descriptionFontSize =
        MediaQuery.of(context).size.width > 1250 ? 24 : 16;

    const aboutUsImage =
        Image(image: AssetImage("assets\\images\\about_us.png"));

    const aboutUsDescription =
        "Somos uma startup nova, com apenas um ano no mercado e em busca de um sonho, mudar a experiência dos usuários morando em condominios. Sempre vimos a necessidade de melhorias em informação e diálogo dentro dos nossos condominios e pensamos em criar essa iniciativa para resolver não somente o nosso, mas de todas as pessoas que possuem a mesma necessidade!";

    return Column(
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
                  'Sobre nós',
                  style: GoogleFonts.lobster(fontSize: titleFontSize),
                ),
                const SizedBox(height: 48),
                Text(
                  aboutUsDescription,
                  style: TextStyle(fontSize: descriptionFontSize),
                  overflow: TextOverflow.clip,
                ),
                const Flexible(child: aboutUsImage),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

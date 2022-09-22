import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectMobileContent extends StatelessWidget {
  const ProjectMobileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double titleChapterFontSize =
        MediaQuery.of(context).size.width > 1250 ? 54 : 36;
    final double titleFontSize =
        MediaQuery.of(context).size.width > 1250 ? 48 : 36;
    final double descriptionFontSize =
        MediaQuery.of(context).size.width > 1250 ? 24 : 16;

    final double paddingBodyContent =
        MediaQuery.of(context).size.width > 1440 ? 100 : 0;

    const buildingImage =
        Image(image: AssetImage("assets\\images\\look_buildings.png"));
    const emailsImage =
        Image(image: AssetImage("assets\\images\\check_mails.png"));

    const projectDescription =
        "Somos uma startup voltada para soluções residencias, ou seja, melhorias relacionadas a experiência de morar em condomínios. Nossa solução visa a automatizar comunicação entre morador e condominio, tendo no nosso app a possibilidade verificar e pegar sua conta de condominio, agendamento de áreas comuns, avisos importantes e correspondências que chegaram.";
    const mailDescription =
        "Uma novidade é receber notificações das suas encomendas. Não há necessidade de checar mais em sites ou no próprio app se seu pedido ou conta chegou. Agora vamos notificar sempre que uma carta ou encomenda chegar em seu condomínio!";

    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Nosso Projeto',
                style: GoogleFonts.lobster(fontSize: titleFontSize),
              ),
              const SizedBox(height: 48),
              Text(
                projectDescription,
                style: TextStyle(fontSize: descriptionFontSize),
                overflow: TextOverflow.clip,
              ),
              buildingImage,
            ],
          ),
        ),
        const SizedBox(height: 32),
        Center(
          child: Text(
            'Novidade!',
            style: GoogleFonts.lobster(fontSize: titleChapterFontSize),
          ),
        ),
        Container(
          padding:
              EdgeInsets.fromLTRB(paddingBodyContent, 0, paddingBodyContent, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recebidos',
                      style: GoogleFonts.lobster(fontSize: titleFontSize),
                    ),
                    const SizedBox(height: 48),
                    Text(
                      mailDescription,
                      style: TextStyle(fontSize: descriptionFontSize),
                      overflow: TextOverflow.clip,
                    ),
                    emailsImage,
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}

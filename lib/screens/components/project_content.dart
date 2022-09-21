import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectContent extends StatelessWidget {
  const ProjectContent({Key? key}) : super(key: key);

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
    final double paddingTitleContent =
        MediaQuery.of(context).size.width > 1440 ? 200 : 25;

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
          padding:
              EdgeInsets.fromLTRB(paddingBodyContent, 0, paddingBodyContent, 0),
          height: MediaQuery.of(context).size.height * 0.7,
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
                        'Nosso Projeto',
                        style: GoogleFonts.lobster(fontSize: titleFontSize),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        projectDescription,
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
          padding: EdgeInsets.fromLTRB(
              paddingTitleContent, 0, paddingTitleContent, 0),
          child: Text(
            'Novidade!',
            style: GoogleFonts.lobster(fontSize: titleChapterFontSize),
          ),
        ),
        Container(
          padding:
              EdgeInsets.fromLTRB(paddingBodyContent, 0, paddingBodyContent, 0),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Flexible(child: emailsImage),
              Flexible(
                child: Padding(
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

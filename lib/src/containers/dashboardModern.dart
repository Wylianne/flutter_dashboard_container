import 'package:flutter/material.dart';
import 'package:flutter_dashboard_container/flutter_dashboard_container.dart';
import 'package:flutter_dashboard_container/src/globalFunction/getSizeContainer.dart';

List<Widget> temp = [];
List conteudo = [];
List<Widget> conteudoLinha = [];


class DashboardContainerModern extends StatefulWidget {
  final List<ItemDashboard> itens;
  final double marginBetween;
  final double mobileWidthContainer;
  final double webWidthContainer;

  DashboardContainerModern(this.itens, this.marginBetween, this.mobileWidthContainer, this.webWidthContainer);

  @override
  _DashboardContainerModernState createState() => _DashboardContainerModernState();
}

class _DashboardContainerModernState extends State<DashboardContainerModern> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: getContainers()
    );
  }

  Widget getContainers(){
    List sizes = getSizeContainer(MediaQuery.of(context).size.width, widget.marginBetween, widget.mobileWidthContainer, widget.webWidthContainer, widget.itens.length);

    temp.clear();
    conteudo.clear();
    conteudoLinha.clear();

    print(sizes);

    for(int i = 0; i < sizes[0]["qtdLinha"]; i++){
      int maxJ = ((i  + 1) * sizes[0]["qtdContainersLinha"]) < widget.itens.length
          ? ((i  + 1) * sizes[0]["qtdContainersLinha"])
          : widget.itens.length;

      int initJ = ((i*sizes[0]["qtdContainersLinha"]));
      for(int j = initJ; j < maxJ; j++){
        temp.add(
            Container(
              height: sizes[0]["heigthContainer"],
              width: sizes[0]["widthContainer"],
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  Card(
                    elevation: 3,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: sizes[0]["widthContainer"],
                      height: sizes[0]["heigthContainer"] * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                widget.itens[j].titulo,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: sizes[0]["heigthContainer"] * 0.15,
                                  color: widget.itens[j].corTexto,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                widget.itens[j].conteudo,
                                style: TextStyle(
                                  fontSize: sizes[0]["heigthContainer"] * 0.35,
                                  fontWeight: FontWeight.bold,
                                  color: widget.itens[j].corTexto,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: sizes[0]["widthContainer"] * 0.05,
                        left: sizes[0]["widthContainer"] * 0.05
                    ),
                    child: Card(
                      color: widget.itens[j].cor,
                      margin: EdgeInsets.all(0),
                      child: Container(
                        width: sizes[0]["heigthContainer"],
                        height: sizes[0]["heigthContainer"],
                        color: widget.itens[j].cor,
                        child: Icon(
                          widget.itens[j].icone,
                          size: sizes[0]["widthContainer"] * 0.15,
                          color: widget.itens[j].corIcone,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        );
      }
    }

    for(int i = 0; i < sizes[0]["qtdLinha"]; i++){
      int maxJ = ((i  + 1) * sizes[0]["qtdContainersLinha"]) < widget.itens.length
          ? ((i  + 1) * sizes[0]["qtdContainersLinha"])
          : widget.itens.length;

      int initJ = ((i*sizes[0]["qtdContainersLinha"]));

      conteudo.add(
          temp.sublist(initJ, maxJ)
      );

      print(sizes[0]["qtdContainersLinha"]);
      conteudoLinha.add(
          Row(
            children: conteudo[i],
          )
      );
    }

    return Container(
      child: Column(
        children: conteudoLinha,
      ),
    );
  }
}
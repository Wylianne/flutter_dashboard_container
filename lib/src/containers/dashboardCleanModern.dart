import 'package:flutter/material.dart';
import 'package:flutter_dashboard_container/flutter_dashboard_container.dart';
import 'package:flutter_dashboard_container/src/globalFunction/getSizeContainer.dart';


List<Widget> temp = [];
List conteudo = [];
List<Widget> conteudoLinha = [];


class DashboardContainerCleanModern extends StatefulWidget {
  final List<ItemDashboard> itens;
  final double marginBetween;
  final double mobileWidthContainer;
  final double webWidthContainer;

  DashboardContainerCleanModern(this.itens, this.marginBetween, this.mobileWidthContainer, this.webWidthContainer);

  @override
  _DashboardContainerCleanModernState createState() => _DashboardContainerCleanModernState();
}

class _DashboardContainerCleanModernState extends State<DashboardContainerCleanModern> {
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
              child: Card(
                elevation: 2,
                child: Container(
                  width: sizes[0]["widthContainer"],
                  height: sizes[0]["heigthContainer"],
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: sizes[0]["heigthContainer"] * 0.75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        widget.itens[j].conteudo,
                                        style: TextStyle(
                                          fontSize: sizes[0]["heigthContainer"] * 0.35,
                                          fontWeight: FontWeight.bold,
                                          color: widget.itens[j].corIcone,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        widget.itens[j].subTitulo,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: sizes[0]["heigthContainer"] * 0.15,
                                          color: widget.itens[j].corTexto,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: sizes[0]["widthContainer"] * 0.33,
                              child: Icon(
                                widget.itens[j].icone,
                                size: sizes[0]["widthContainer"] * 0.1,
                                color: widget.itens[j].corIcone,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        color: widget.itens[j].cor,
                        margin: EdgeInsets.all(0),
                        child: Container(
                          width: sizes[0]["widthContainer"],
                          height: sizes[0]["heigthContainer"] * 0.25,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            widget.itens[j].titulo,
                            style: TextStyle(
                              fontSize: sizes[0]["heigthContainer"] * 0.13,
                              color: Colors.white,
                            ),
                          )
                        ),
                      )
                    ],
                  ),
                ),
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
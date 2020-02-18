import 'package:flutter/material.dart';
import 'package:flutter_dashboard_container/flutter_dashboard_container.dart';
import 'package:flutter_dashboard_container/src/globalFunction/getSizeContainer.dart';


List<Widget> temp = [];
List conteudo = [];
List<Widget> conteudoLinha = [];


class DashboardContainerLine extends StatefulWidget {
  final List<ItemDashboard> itens;
  final double sizeScreen;
  final double marginBetween;
  final double mobileWidthContainer;
  final double webWidthContainer;

  DashboardContainerLine(this.itens, this.sizeScreen, this.marginBetween, this.mobileWidthContainer, this.webWidthContainer);

  @override
  _DashboardContainerLineState createState() => _DashboardContainerLineState();
}

class _DashboardContainerLineState extends State<DashboardContainerLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: getContainers()
    );
  }

  Widget getContainers(){
    List sizes = getSizeContainer(widget.sizeScreen, widget.marginBetween, widget.mobileWidthContainer, widget.webWidthContainer, widget.itens.length);

    temp.clear();
    conteudo.clear();
    conteudoLinha.clear();

    for(int i = 0; i < sizes[0]["qtdLinha"]; i++){
      int maxJ = ((i  + 1) * sizes[0]["qtdContainersLinha"]) < widget.itens.length
          ? ((i  + 1) * sizes[0]["qtdContainersLinha"])
          : widget.itens.length;

      int initJ = ((i*sizes[0]["qtdContainersLinha"]));
      for(int j = initJ; j < maxJ; j++){
        temp.add(
            Container(
              //margin: widget.itens.length - 2 >= j ? EdgeInsets.only(right: widget.marginBetween) : EdgeInsets.only(right: 0),
              child: Card(
                color: widget.itens[j].cor,
                elevation: 2,
                child: Container(
                  width: sizes[0]["widthContainer"],
                  height: sizes[0]["heigthContainer"],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
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
                      Card(
                        margin: EdgeInsets.all(0),
                        color: widget.itens[j].cor,
                        elevation: 0,
                        child: Container(
                          width: sizes[0]["widthContainer"] * 0.33,
                          height: sizes[0]["heigthContainer"],
                          child: Icon(
                            widget.itens[j].icone,
                            size: sizes[0]["widthContainer"] * 0.2,
                            color: widget.itens[j].corIcone,
                          ),
                        ),
                      ),
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
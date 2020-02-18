import 'package:flutter/material.dart';
import 'package:flutter_dashboard_container/flutter_dashboard_container.dart';
import 'package:flutter_dashboard_container/src/globalFunction/getSizeContainer.dart';


List<Widget> temp = [];
List conteudo = [];
List<Widget> conteudoLinha = [];


class DashboardContainerDivided extends StatefulWidget {
  final List<ItemDashboard> itens;
  final double sizeScreen;
  final double marginBetween;
  final double mobileWidthContainer;
  final double webWidthContainer;


  DashboardContainerDivided(this.itens, this.sizeScreen, this.marginBetween, this.mobileWidthContainer, this.webWidthContainer);

  @override
  _DashboardContainerDividedState createState() => _DashboardContainerDividedState();
}

class _DashboardContainerDividedState extends State<DashboardContainerDivided> {
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
                color: Colors.grey[200],
                elevation: 2,
                child: Container(
                  width: sizes[0]["widthContainer"],
                  height: sizes[0]["heigthContainer"],
                  child: Row(
                    children: <Widget>[
                      Card(
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
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
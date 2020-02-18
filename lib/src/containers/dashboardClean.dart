import 'package:flutter/material.dart';
import 'package:flutter_dashboard_container/flutter_dashboard_container.dart';
import 'package:flutter_dashboard_container/src/globalFunction/getSizeContainer.dart';


List<Widget> temp = [];
List conteudo = [];
List<Widget> conteudoLinha = [];


class DashboardContainerClean extends StatefulWidget {
  final List<ItemDashboard> itens;
  final double sizeScreen;
  final double marginBetween;
  final double mobileWidthContainer;
  final double webWidthContainer;

  DashboardContainerClean(this.itens, this.sizeScreen, this.marginBetween, this.mobileWidthContainer, this.webWidthContainer);

  @override
  _DashboardContainerCleanState createState() => _DashboardContainerCleanState();
}

class _DashboardContainerCleanState extends State<DashboardContainerClean> {
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
                child: Card(
                  color: Colors.grey[200],
                  elevation: 2,
                  child: Container(
                    width: sizes[0]["widthContainer"],
                    height: sizes[0]["heigthContainer"],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                widget.itens[j].conteudo,
                                style: TextStyle(
                                    fontSize: sizes[0]["heigthContainer"] * 0.4,
                                    fontWeight: FontWeight.bold,
                                    color: widget.itens[j].corTexto,
                                ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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


    for (int i = 0; i < sizes[0]["qtdContainersLinha"]; i++){
        print("coluna");
        print(i);
        print('linha');
        for(int j = i; j < temp.length; j = j + sizes[0]["qtdLinha"]){
            print(j);
        }
    }


    return Container(
      child: Column(
        children: conteudoLinha,
      ),
    );


  }
}



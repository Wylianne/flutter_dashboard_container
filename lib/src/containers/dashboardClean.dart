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
              Expanded(
                flex: 0,
                child: GestureDetector(
                  onTap: (){
                    final snackBar = SnackBar(
                      content: Text(widget.itens[j].help + "\n"+ widget.itens[j].titulo + "\n"+ widget.itens[j].conteudo),
                      backgroundColor: Colors.blue,
                      action: SnackBarAction(
                        label: 'Fechar',
                        textColor: Colors.white,
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );

                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                  child: Tooltip(
                    message: widget.itens[j].help + "\n"+ widget.itens[j].titulo + "\n"+ widget.itens[j].conteudo,
                    child: Container(
                      padding: EdgeInsets.only(bottom: sizes[0]["heigthContainer"] * 0.1),
                      child: Card(
                        elevation: 2,
                        child: Container(
                          height: sizes[0]["heigthContainer"],
                          alignment: Alignment.center,

                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: sizes[0]["widthContainer"] * 1,
                                child: Text(
                                    widget.itens[j].conteudo,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: sizes[0]["heigthContainer"] * 0.35,
                                        fontWeight: FontWeight.bold,
                                        color: widget.itens[j].corTexto,
                                    ),
                                ),
                              ),
                              Container(
                                width: sizes[0]["widthContainer"],
                                child: Text(
                                    widget.itens[j].titulo,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: sizes[0]["heigthContainer"] * 0.17,
                                        color: widget.itens[j].corTexto,
                                    ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            );
        }
    }


    List<Widget> tempFinal = [];
    List<List<int>> range = [];
    int i = 0;
    int j = 0;

    for (i = 0; i < sizes[0]["qtdContainersLinha"]; i++){
        int size = tempFinal.length;
        for(j = i;  j < temp.length; j = j + sizes[0]["qtdContainersLinha"]){
          tempFinal.add(temp[j]);
        }
        range.add([size, tempFinal.length - 1]);
    }

    int initJ;
    int maxJ;

    conteudo.clear();
    for(int k = 0; k < range.length; k++){
      print("etapa: " + k.toString());
        initJ = range[k][0];
        maxJ = range[k][1];

        conteudo.add(
            tempFinal.sublist(initJ, maxJ + 1)
        );

        conteudoLinha.add(
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: conteudo[k],
                ),
              ),
            ),
        );
    }

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: conteudoLinha,
      ),
    );


  }
}



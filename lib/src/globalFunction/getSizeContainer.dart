List getSizeContainer(double widthScreen, double marginBetween, double mobileSize, double webSize, int qtdContainers){

  //Maior que 770 trata como web
  //Menor e igual a 770 trata como mobile
  if( widthScreen > 770){
    widthScreen = widthScreen * 0.95;
    for(int i = qtdContainers; i > 0 ; i--){
      print(i);
      if(widthScreen >= ((webSize * i) + (marginBetween * (i - 1)))){

        double restSize = (webSize * i) + (marginBetween * (i - 1));

        if (restSize < widthScreen ){
          if(qtdContainers == i){
            print("teste");
            webSize = (widthScreen - (marginBetween * (i + 1))) / i;
          }else{
            if(webSize * (i + 1) < widthScreen * 1.1){
              print("primeiro if");
              i = i + 1;
              webSize = (widthScreen * 0.94 - (marginBetween * i + 1)) / i;

              print(widthScreen);
              print(webSize * i + ( marginBetween * (i - 1) ));
            }else{
              widthScreen = widthScreen * 0.95;
              print("segundo if");
              print(i);
              webSize = ((widthScreen - ((marginBetween * i))) / i);
            }


          }

        }


        return [
          {
            "widthContainer": webSize,
            "heigthContainer": webSize / 4,
            "qtdContainersLinha": i,
            "qtdLinha": (qtdContainers / i).ceil()
          }
        ];
      }
    }


    /*if(widthScreen >= ((webSize * qtdContainers) + (marginBetween * (qtdContainers - 1)))){
      return [
        {
          "tamanho": (widthScreen / qtdContainers),
          "widthContainer": webSize,
          "heigthContainer": webSize / 3,
          "qtdLinha": 1
        }
      ];
    }*/
  }else{
    widthScreen = widthScreen * 0.92;

    for(int i = qtdContainers; i > 0 ; i--){
      if(widthScreen >= ((mobileSize * i) + (marginBetween * (i - 1)))){

        double restSize = (mobileSize * i) + (marginBetween * (i - 1));

        if (restSize < widthScreen ){
          mobileSize = (widthScreen - ((marginBetween * (i - 1)))) / i;
        }


        return [
          {
            "widthContainer": mobileSize,
            "heigthContainer": mobileSize / 4,
            "qtdContainersLinha": i,
            "qtdLinha": (qtdContainers / i).ceil()
          }
        ];
      }
    }
  }



/*  if(widthScreen >= ((webSize * qtdContainers) + (marginBetween * (qtdContainers - 1)))){
    return [
      {
        "tamanho": (widthScreen / qtdContainers),
        "widthContainer": webSize,
        "heigthContainer": webSize / 3,
        "qtdLinha": 1
      }
      ];
  }else{

  }*/
}
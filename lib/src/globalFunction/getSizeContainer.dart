List getSizeContainer(double widthScreen, double marginBetween, double mobileSize, double webSize, int qtdContainers){

  //Maior que 770 trata como web
  //Menor e igual a 770 trata como mobile
  if( widthScreen > 770){
    for(int i = qtdContainers; i > 0 ; i--){
      if(widthScreen >= ((webSize * i) + (marginBetween * (i - 1)))){

        double restSize = (webSize * i) + (marginBetween * (i - 1));

        if (restSize < widthScreen ){
          if(qtdContainers == i){
            webSize = (widthScreen - (marginBetween * (i + 1))) / i;
          }else{
            if(webSize * (i + 1) < widthScreen * 1.1){
              i = i + 1;
              webSize = (widthScreen * 0.94 - (marginBetween * i + 1)) / i;
            }else{
              widthScreen = widthScreen * 0.95;
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
  }else{
    for(int i = qtdContainers; i > 0 ; i--){
      if(widthScreen >= ((mobileSize * i) + (marginBetween * (i - 1)))){
        print("entrou width");
        double restSize = (mobileSize * i) + (marginBetween * (i - 1));
        print(restSize);
        if (restSize < widthScreen ){
          print("entrou if rest");
          if(qtdContainers == i){
            mobileSize = (widthScreen - (marginBetween * (i + 1))) / i;
          }else{
            if(mobileSize * (i + 1) < widthScreen * 1.1){
              i = i + 1;
              mobileSize = (widthScreen * 0.94 - (marginBetween * i + 1)) / i;
            }else{
              widthScreen = widthScreen * 0.95;
              mobileSize = ((widthScreen - ((marginBetween * i))) / i);
            }
          }
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
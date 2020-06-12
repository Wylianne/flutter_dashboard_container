# Flutter Dashboard Container

Generate containers responsives.

## Getting Started

git clone https://github.com/Wylianne/flutter_dashboard_container.git

### Pubspec.yaml
```
dev_dependencies:
  flutter_test:
    sdk: flutter

  .
  .
  .
  flutter_responsive_menu:
    path: ../flutter_dashboard_container
```

## Modelos

![alt text](https://raw.githubusercontent.com/Wylianne/flutter_dashboard_container/master/lib/assets/Capturar.PNG "Modelo")

## Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_dashboard_container/flutter_dashboard_container.dart';

List<ItemDashboard> itensContainer = [];

void main() => runApp(Indicadores());

class Indicadores extends StatefulWidget {
  @override
  _IndicadoresState createState() => _IndicadoresState();
}

class _IndicadoresState extends State<Indicadores> {

  @override
  initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    itensContainer.clear();

    itensContainer.add(
        ItemDashboard(
            "Teste",
            "teste",
            MdiIcons.accountSupervisorOutline,
            subTitulo: "tes tes tes",
            cor: Colors.blue,
            corIcone: Colors.blue,
        )
    );
    itensContainer.add(
        ItemDashboard(
            "Teste 1",
            "teste 1",
            MdiIcons.alertOctagramOutline,
            subTitulo: "tes t",
            cor: Colors.red,
            corIcone: Colors.white
        )
    );
    itensContainer.add(
        ItemDashboard(
            "Teste 2",
            "teste 2",
            MdiIcons.alertRhombusOutline,
            subTitulo: "frfrfr rfrf",
            cor: Colors.blue,
            corIcone: Colors.white
        )
    );
    itensContainer.add(
        ItemDashboard(
            "Teste 3",
            "teste 3",
            MdiIcons.arrowDecisionAutoOutline,
            subTitulo: "frfrfr",
            cor: Colors.red,
            corIcone: Colors.white
        )
    );


    return SingleChildScrollView(
      child: Container(
          child: Column(
            children: <Widget>[
              DashboardContainer(
                  itens: itensContainer,
                  tipoContainer: TipoContainer.cleanModern,
                  marginBetween: 10,
                  mobileWidthContainer: 200,
                  webWidthContainer: 400
              ),
            ],
          ),
      ),
    );

  }
}
```


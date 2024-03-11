import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/widgets/custom_card.dart';

//TODO: functionality
class GenericsComponents extends StatelessWidget {
  const GenericsComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTemperature(context),
        Row(
          children: [
            Expanded(child: _buildUVIndex(context)),
            Expanded(child: _buildSunrise(context))
          ],
        ),
        Row(
          children: [
            Expanded(child: _buildWind(context)),
            Expanded(child: _buildRain(context))
          ],
        ),
        Row(
          children: [
            Expanded(child: _buildFeelsLike(context)),
            Expanded(child: _buildHumidity(context))
          ],
        ),
        Row(
          children: [
            Expanded(child: _buildVisibility(context)),
            Expanded(child: _buildPressure(context))
          ],
        )
      ],
    );
  }

  Widget _buildTemperature(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CustomCard(
          text: 'TEMPERATURA',
          icon: CupertinoIcons.thermometer,
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  gradient:
                      LinearGradient(transform: GradientRotation(20), colors: [
                    Colors.red,
                    Colors.deepOrangeAccent,
                    Colors.orange,
                    Colors.orangeAccent,
                    Colors.deepOrange,
                  ])),
              height: 200,
              width: double.maxFinite,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ver Mais',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const Icon(
                  CupertinoIcons.chevron_forward,
                  color: Colors.white,
                ),
              ],
            )
          ]),
    );
  }

  _buildUVIndex(BuildContext context) {
    return CustomCard(
      text: 'ÍNDICE UV',
      icon: CupertinoIcons.sun_max_fill,
      children: [
        Text(
          '0\nBaixo',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 10),
        Container(
          height: 5,
          width: 170,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              gradient: LinearGradient(colors: [
                Colors.green,
                Colors.yellow,
                Colors.orange,
                Colors.red,
                Colors.pinkAccent,
                Colors.purpleAccent,
              ])),
        ),
        const SizedBox(height: 10),
        const Text('Baixo no restante do dia'),
      ],
    );
  }

  _buildSunrise(BuildContext context) {
    return CustomCard(
      text: 'NASCER DO SOL',
      icon: CupertinoIcons.sunrise_fill,
      children: [
        Text('06:21', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 20),
        Divider(
          color: Colors.white.withOpacity(0.2),
        ),
        const SizedBox(height: 20),
        const Text('Pôr do sol: 18:46')
      ],
    );
  }

  _buildWind(BuildContext context) {
    return const CustomCard(
      text: 'VENTO',
      icon: CupertinoIcons.wind,
      children: [
        Center(
          child: Image(
            image: AssetImage('assets/images/vento.jpeg'),
            height: 140,
          ),
        )
      ],
    );
  }

  _buildRain(BuildContext context) {
    return CustomCard(
      text: 'CHUVA',
      icon: CupertinoIcons.drop_fill,
      children: [
        Text(
          '0 mm',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text('nas ultimas\n24hs', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 20),
        const Text('Próxima prevista:\n1 mm sexta-feira'),
      ],
    );
  }

  _buildFeelsLike(BuildContext context) {
    return CustomCard(
      text: 'SENSAÇÃO',
      icon: CupertinoIcons.thermometer,
      children: [
        Text(
          '23º',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 30),
        const Text('Similar à temperatura real'),
      ],
    );
  }

  _buildHumidity(BuildContext context) {
    return CustomCard(
      text: 'UMIDADE',
      children: [
        Text(
          '95% mm',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 30),
        const Text('O ponto de orvalho é de 23º'),
      ],
    );
  }

  _buildVisibility(BuildContext context) {
    return CustomCard(
      text: 'VISIBILIDADE',
      icon: CupertinoIcons.eye_fill,
      children: [
        Text(
          '10 km',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 45),
        const Text('Uma névoa seca está afetando a visibilidade'),
      ],
    );
  }

  _buildPressure(BuildContext context) {
    return const CustomCard(
      text: 'PRESSÃO',
      children: [
        Center(
          child: Image(
            image: AssetImage('assets/images/pressao.jpeg'),
            height: 120,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter: Primeiros Passos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter: Primeiros Passos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double energia = 1.0;

  void diminuirEnergia(double dificuldade) {
    setState(() {
      energia = energia - dificuldade;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kako'),
        leading: const CircleAvatar(
          radius: 30,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage(
                'https://i.ibb.co/cctxpTG/kako-epifania-2022-18-2.jpg'),
          ),
        ),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: const <Widget>[
            Tarefa(
                'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                'Aprender Flutter',
                'na Alura',
                10,
                0.1),
            Tarefa(
                'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg',
                'Andar de Bike',
                'no Parque',
                20,
                0.2),
            Tarefa(
                'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
                'Ler 50 páginas',
                'em Casa',
                13,
                0.3),
            Tarefa(
                'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
                'Meditar',
                'na Área Verde',
                62,
                0.4),
            Tarefa('https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg',
                'Jogar', 'no Vídeo Game', 82, 1.0),
          ],
        ),
      ),
    );
  }
}

class Tarefa extends StatefulWidget {
  final String foto;
  final String nome;
  final String lugar;
  final int tempo;
  final double dificuldade;

  const Tarefa(this.foto, this.nome, this.lugar, this.tempo, this.dificuldade,
      {Key? key})
      : super(key: key);

  @override
  State<Tarefa> createState() => _TarefaState();
}

class _TarefaState extends State<Tarefa> {
  int level = 1;
  void levelUp() {
    setState(() {
      level++;
      print(level);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      /* Depois de adicionar o Visible,trocar para animatedOpacity,
      para mostrar animções basicas e suas nuances:

      AnimatedOpacity(
        duration: const Duration(milliseconds: 1000),
        opacity: boolToDouble(visible),*/
      child: Container(
        height: 150,
        color: Colors.black12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                color: Colors.black26,
              ),
              child: Image(
                image: NetworkImage(widget.foto),
                height: 130,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.nome,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Onde: ${widget.lugar}',
                    style: const TextStyle(
                        fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'Horas: ${widget.tempo} hrs.',
                    style: const TextStyle(
                        fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'Dificuldade: ${widget.dificuldade}',
                    style: const TextStyle(
                        fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Level: $level'),

                ElevatedButton(
                  onPressed: levelUp,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: CircleBorder(),
                  ),
                  child: Icon(Icons.arrow_circle_up,size:40.0,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/*
- Alterar mais para um To Do List e focar bastante na funcionalidade geral ( texto justificado )
- Sumiu da lista? Mudar a Lista (Lista Dinâmica)
- Mudar o Design para Linhas ( Tirar Nome e Especie, e deixar um design mais enxuto usando Negrito e Italico)
- Colocar outros tipos como Int ou Double
- Resolver um Problema ( função matemática )
Temas:
  TodoList -> tarefas diárias --> RPG da vida (Fazer tarefas aumenta o meu nível de proficiencia nelas)
  ToDoList -> Compras de Mercado -> check para item já comprado.
  ToDoList ->
* */

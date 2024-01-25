import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';
import '../bloc/app_event.dart';
import '../bloc/app_state.dart';

class ListaWidget extends StatefulWidget {
  const ListaWidget({Key? key}) : super(key: key);

  @override
  State<ListaWidget> createState() => _ListaWidgetState();
}

class _ListaWidgetState extends State<ListaWidget> {
  final _scrollController = ScrollController();

  bool isCargando = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(onListener);
    obtenerDatos();
  }

  void obtenerDatos() {
    context.read<AppBloc>().add(ObtenerDatos());
  }

  void onListener() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !isCargando) {
      obtenerDatos();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is LoadingData) {
            isCargando = true;
            setState(() {});
          }

          if (state is GetData) {
            isCargando = false;
            setState(() {});
          }
        },
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.data.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ListTile(
                            title: Text(
                              state.data[index],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ),
                        );
                      },
                    ),
                    (state is LoadingData)
                        ? const SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

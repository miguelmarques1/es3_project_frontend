import 'package:es3_proj/app/core/ui/base_state/base_state.dart';
import 'package:es3_proj/app/core/ui/styles/colors_app.dart';
import 'package:es3_proj/app/core/ui/widgets/es3_appbar.dart';
import 'package:es3_proj/app/pages/home/home_controller.dart';
import 'package:es3_proj/app/pages/home/home_state.dart';
import 'package:es3_proj/app/pages/home/widgets/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/helpers/messages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: context.colors.primary,
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: ES3AppBar(),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
            loading: () => showLoader(),
            any: () => hideLoader(),
            error: () {
              showError(state.errorMessage ?? 'Erro não informado');
            },
          );
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    final book = state.books[index];
                    return BookTile(
                      book: book,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void onReady() {
    context.read<HomeController>().loadProducts();
  }
}

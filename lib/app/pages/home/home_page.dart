import 'package:es3_proj/app/core/ui/base_state/base_state.dart';
import 'package:es3_proj/app/core/ui/helpers/size_extensions.dart';
import 'package:es3_proj/app/core/ui/styles/colors_app.dart';
import 'package:es3_proj/app/core/ui/widgets/es3_appbar.dart';
import 'package:es3_proj/app/models/book_model.dart';
import 'package:es3_proj/app/models/category_model.dart';
import 'package:es3_proj/app/models/group_pricing_model.dart';
import 'package:es3_proj/app/pages/home/home_controller.dart';
import 'package:es3_proj/app/pages/home/home_state.dart';
import 'package:es3_proj/app/pages/home/widgets/book_tile.dart';
import 'package:es3_proj/app/pages/home/widgets/create_book_modal.dart';
import 'package:es3_proj/app/pages/home/widgets/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  Future<void> openCreateBookModal(List<Category> categories,
      List<PrecificationGroup> precificationGroups) async {
    final homeController = context.read<HomeController>();
    final state = homeController.state;
    final categories = state.categories;
    final precificationGroups = state.precificationGroups;
    Book? book = await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: CreateBookModal(
            categories:
                categories!.map<String>((category) => category.name).toList(),
            precificationGroups: precificationGroups!
                .map<String>((precificationGroup) => precificationGroup.name)
                .toList(),
          ),
        );
      },
    );
    if (book != null) {
      await homeController.createBook(book);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeController, HomeState>(
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
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              openCreateBookModal(
                state.categories ?? [],
                state.precificationGroups ?? [],
              );
            },
            backgroundColor: context.colors.secondary,
            child: const Icon(
              Icons.add,
            ),
          ),
          appBar: ES3AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.secondary,
                      ),
                      onPressed: () async {
                        final resp = await showDialog(
                          context: context,
                          builder: (context) {
                            return FilterWidget(
                              onPressed: () {},
                              categories: state.categories!
                                  .map<String>((cat) => cat.name)
                                  .toList(),
                            );
                          },
                        );
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.filter_alt,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Filtrar",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (context.screenWidth * 0.00658857979).toInt(),
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 208.89,
                    ),
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
            ),
          ),
        );
      },
    );
  }

  @override
  void onReady() {
    context.read<HomeController>().loadData();
  }
}

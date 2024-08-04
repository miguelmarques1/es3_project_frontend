import 'package:es3_proj/app/models/author_model.dart';
import 'package:es3_proj/app/models/book_model.dart';
import 'package:es3_proj/app/models/dimensions_model.dart';
import 'package:es3_proj/app/models/group_pricing_model.dart';
import 'package:es3_proj/app/repositories/books/i_books_repository.dart';

class BooksRepositoryMemory implements IBooksRepository {
  final books = List.generate(
    70,
    (index) => Book(
      authors: [
        Author(id: index, name: "Richarlisson Nogueira"),
      ],
      urlImage:
          "https://jamboeditora.com.br/wp-content/uploads/2020/09/jamboeditora-pedrafilosofal-560x560.png",
      aquisitionPrice: 25.9,
      categories: [],
      code: "23213213213",
      codeBar: "2131313132",
      dimensions: Dimensions(depth: 1, height: 2, weight: 2, width: 5),
      edition: 1,
      groupPricing: PrecificationGroup(name: "Diamond", id: index),
      id: index,
      isActive: true,
      isbn: "978-85-333-0227-3",
      manufactoringCosts: 20,
      pages: 180,
      publisher: "Editora Iluminada",
      synopsis:
          "Harry Potter é um garoto órfão que vive infeliz com seus tios, os Dursleys. Ele recebe uma carta contendo um convite para ingressar em Hogwarts, uma famosa escola especializada em formar jovens bruxos. Inicialmente, Harry é impedido de ler a carta por seu tio, mas logo recebe a visita de Hagrid, o guarda-caça de Hogwarts, que chega para levá-lo até a escola. Harry adentra um mundo mágico que jamais imaginara, vivendo diversas aventuras com seus novos amigos, Rony Weasley e Hermione Granger.",
      title: "Harry Potter: A pedra da filosofia filosofal",
      year: 2003,
    ),
  );

  @override
  Future<List<Book>> findAllBooks() async {
    await Future.delayed(const Duration(seconds: 2));
    return books;
  }

  @override
  Future<Book> findBookById(int id) async {
    await Future.delayed(const Duration(seconds: 2));
    return books.firstWhere((book) => book.id == id);
  }

  @override
  Future<bool> create(Book book) async {
    await Future.delayed(const Duration(seconds: 2));
    book.id = books.length;
    books.add(book);
    return true;
  }
}

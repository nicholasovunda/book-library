import 'package:book_library/application/boundaries/add_book_output.dart';
import 'package:book_library/application/boundaries/addbook/Iuse_case.dart';
import 'package:book_library/application/boundaries/addbook/add_book_input.dart';

abstract class IAddBookUseCase extends IUseCase<AddBookInput, AddBookOutput> {}

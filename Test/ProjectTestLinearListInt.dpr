program ProjectTestLinearListInt;

{$APPTYPE CONSOLE}

uses
  SysUtils, LinearListInt, // Модуль с линейным списком
  Windows; 

// ============================================================
// Процедуры тестирования
// ============================================================

procedure InitTestModule(var pList: TLinearList);
begin
  WriteLn('----------------------------------------------------------');
  WriteLn('Тест инициализации (метод InitList):');
  InitList(pList);
  if pList = nil then
    WriteLn('Тест пройден.')
  else
    WriteLn('Тест не пройден.');
  WriteLn('----------------------------------------------------------');
end;

procedure IsEmptyTestModule(pList: TLinearList);
begin
  WriteLn('----------------------------------------------------------');
  WriteLn('Тест проверки на пустоту (метод IsEmpty):');
  WriteLn('Ожидается: ', IsEmpty(pList));
  if IsEmpty(pList) then
    WriteLn('Тест пройден.')
  else
    WriteLn('Тест не пройден.');
  WriteLn('----------------------------------------------------------');
end;

procedure AddFirstTestModule(var pList: TLinearList);
begin
  WriteLn('----------------------------------------------------------');
  WriteLn('Тест добавления в начало (метод AddFirst):');
  AddFirst(pList, 10);
  WriteLn('Значение ожидается: 10');
  PrintList(pList); // Вывод списка после добавления
  WriteLn('----------------------------------------------------------');
end;

procedure AddLastTestModule(var pList: TLinearList);
begin
  WriteLn('----------------------------------------------------------');
  WriteLn('Тест добавления в конец (метод AddLast):');
  AddLast(pList, 20);
  WriteLn('Значение ожидается: 20');
  PrintList(pList); // Вывод списка после добавления
  WriteLn('----------------------------------------------------------');
end;

procedure AddAfterTestModule(var pList: TLinearList; AfterNode: TLinearList);
begin
  WriteLn('----------------------------------------------------------');
  WriteLn('Тест добавления после заданного элемента (метод AddAfter):');
  AddAfter(30, AfterNode);
  WriteLn('Значение ожидается: 30');
  PrintList(pList); // Вывод списка после добавления
  WriteLn('----------------------------------------------------------');
end;

procedure DeleteFirstTestModule(var pList: TLinearList);
begin
  WriteLn('----------------------------------------------------------');
  WriteLn('Тест удаления первого элемента (метод DeleteFirst):');
  DeleteFirst(pList);
  PrintList(pList); // Вывод списка после удаления
  WriteLn('----------------------------------------------------------');
end;

procedure DeleteLastTestModule(var pList: TLinearList);
begin
  WriteLn('----------------------------------------------------------');
  WriteLn('Тест удаления последнего элемента (метод DeleteLast):');
  DeleteLast(pList);
  PrintList(pList); // Вывод списка после удаления
  WriteLn('----------------------------------------------------------');
end;

procedure DeleteAfterTestModule(var pList: TLinearList; AfterNode: TLinearList);
begin
  WriteLn('----------------------------------------------------------');
  WriteLn('Тест удаления элемента после заданного (метод DeleteAfter):');
  DeleteAfter(pList, AfterNode);
  PrintList(pList); // Вывод списка после удаления
  WriteLn('----------------------------------------------------------');
end;

procedure SearchTestModule(var pList: TLinearList);
begin
  WriteLn('----------------------------------------------------------');
  WriteLn('Тест поиска элемента (метод Search):');
  WriteLn('Ищем значение 10: ');
  if Search(pList, 10) <> nil then
    WriteLn('Тест пройден.')
  else
    WriteLn('Тест не пройден.');
  WriteLn('----------------------------------------------------------');
end;

procedure SortListTestModule(var pList: TLinearList);
begin
  WriteLn('----------------------------------------------------------');
  WriteLn('Тест сортировки списка (метод SortList):');
  SortList(pList);
  WriteLn('Отсортированный список:');
  PrintList(pList);
  WriteLn('----------------------------------------------------------');
end;

// ============================================================
// Основной код программы
// ============================================================

var
  List: TLinearList;
  Node: TLinearList;

begin
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);

  // Тест инициализации
  InitTestModule(List);

  // Добавление элементов в список
  AddFirstTestModule(List);
  AddLastTestModule(List);
  AddFirstTestModule(List);
  Node := Search(List, 10);
  AddAfterTestModule(List, Node); 

  // Тест проверки на пустоту
  IsEmptyTestModule(List);

  // Тест сортировки
  SortListTestModule(List);

  // Тест удаления
  DeleteFirstTestModule(List);
  DeleteLastTestModule(List);
  Node := Search(List, 30);
  DeleteAfterTestModule(List, Node);

  // Тест поиска
  SearchTestModule(List);

  ReadLn; // Пауза для просмотра результатов
end.
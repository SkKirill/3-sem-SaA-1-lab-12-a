unit LinearListInt;

interface

type
  TLinearList = ^TListNode;
  TListNode = record
    Data: Integer;
    Next: TLinearList;
  end;

procedure InitList(var List: TLinearList);
function IsEmpty(List: TLinearList): Boolean;
procedure AddFirst(var List: TLinearList; Data: Integer);
procedure AddLast(var List: TLinearList; Data: Integer);
procedure AddAfter(Data: Integer; AfterNode: TLinearList);
procedure DeleteFirst(var List: TLinearList);
procedure DeleteLast(var List: TLinearList);
procedure DeleteAfter(var List: TLinearList; AfterNode: TLinearList);
function Search(List: TLinearList; Data: Integer): TLinearList;
procedure SortList(var List: TLinearList);
procedure PrintList(List: TLinearList);
procedure AddNodeSort(var List: TLinearList; Data: Integer);

implementation

procedure InitList(var List: TLinearList);
begin
  List := nil;
end;

function IsEmpty(List: TLinearList): Boolean;
begin
  Result := List = nil;
end;

procedure AddFirst(var List: TLinearList; Data: Integer);
var
  NewNode: TLinearList;
begin
  if IsEmpty(List) then
    begin
      New(List);
      List^.Data := Data;
      List^.Next := nil;
    end
  else
    begin
      New(NewNode);
      NewNode^.Data := Data;
      NewNode^.Next := List;
      List := NewNode;
    end;
end;

procedure AddLast(var List: TLinearList; Data: Integer);
var
  NewNode: TLinearList;
  Current: TLinearList;
begin
  if IsEmpty(List) then
    begin
      New(List);
      List^.Data := Data;
      List^.Next := nil;
    end
  else
    begin
      New(NewNode);
      NewNode^.Data := Data;
      NewNode^.Next := nil;

      Current := List;
      while not IsEmpty(Current^.Next) do
        Current := Current^.Next;

      Current^.Next := NewNode;
    end;
end;

procedure AddAfter(Data: Integer; AfterNode: TLinearList);
var
  NewNode: TLinearList;
begin
  if not IsEmpty(AfterNode) then
    begin
      New(NewNode);
      NewNode^.Data := Data;
      NewNode^.Next := AfterNode^.Next;
      AfterNode^.Next := NewNode;
    end;
end;

procedure DeleteFirst(var List: TLinearList);
var
  Temp: TLinearList;
begin
  if not IsEmpty(List) then
    begin
      Temp := List^.Next;
      Dispose(List);
      List := Temp;
    end;
end;

procedure DeleteLast(var List: TLinearList);
var
  Current: TLinearList;
  Prev: TLinearList;
begin
  if not IsEmpty(List) then
    begin
      Current := List;
      Prev := Current;

      while not IsEmpty(Current^.Next) do
        begin
          Prev := Current;
          Current := Current^.Next;
        end;

      Prev^.Next := nil;
      Dispose(Current);
    end;
end;

procedure DeleteAfter(var List: TLinearList; AfterNode: TLinearList);
var
  Temp: TLinearList;
begin
  if not IsEmpty(AfterNode) and not IsEmpty(AfterNode^.Next) then
    begin
      Temp := AfterNode^.Next;
      if not IsEmpty(AfterNode^.Next) then
        begin
          AfterNode^.Next := AfterNode^.Next^.Next;
        end;
      Dispose(Temp);
    end;
end;

function Search(List: TLinearList; Data: Integer): TLinearList;
var
  Current: TLinearList;
begin
  InitList(Result);
  if not IsEmpty(List) then
    begin
      Current := List;
      while not IsEmpty(Current) and IsEmpty(Result) do
        begin
          if Current^.Data = Data
            then Result := Current;
          Current := Current^.Next;
        end;
    end;
end;

procedure AddNodeSort(var List: TLinearList; Data: Integer);
var
  Current: TLinearList;
  NewNode: TLinearList;
begin
  if IsEmpty(List) then
    begin
      New(List);
      List^.Data := Data;
      List^.Next := nil;
    end
  else
    begin
      Current := List;

      while not IsEmpty(Current^.Next) and (Current^.Next^.Data < Data) do
        begin
          Current := Current^.Next;
        end;

      New(NewNode);
      NewNode^.Data := Data;
      NewNode^.Next := Current^.Next;
      Current^.Next := NewNode;
    end;
end;

procedure SortList(var List: TLinearList);
var
  Current: TLinearList;
begin
  if not IsEmpty(List) then
    begin
      Current := List;
      InitList(List);
      while not IsEmpty(Current) do
        begin
          AddNodeSort(List, Current^.Data);
          Current := Current^.Next;
        end;
    end;
end;

procedure PrintList(List: TLinearList);
var
  Current: TLinearList;
begin
  Current := List;
  while not IsEmpty(Current) do
    begin
      Write(Current^.Data, ' ');
      Current := Current^.Next;
    end;
  WriteLn;
end;

end.

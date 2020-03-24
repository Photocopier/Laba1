unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLTranslator;

type

  { TForm2 }

  TForm2 = class(TForm)
    Find1: TButton;
    Cancel: TButton;
    FindFurther: TButton;
    Replace1: TButton;
    ReplaceAll1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label6: TLabel;
    procedure Find1Click(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure FindFurtherClick(Sender: TObject);
    procedure Replace1Click(Sender: TObject);
    procedure ReplaceAll1Click(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation
uses Unit1, StrUtils; // Для PosEx

{$R *.lfm}

{ TForm2 }

procedure TForm2.CheckBox2Change(Sender: TObject);
begin

end;

//Найти
procedure TForm2.Find1Click(Sender: TObject);
var
  Find: string;
  i,a: integer;

begin
  Find:=Edit1.Text;
  For i:=0 to Form1.SynEdit1.Lines.Count-1 do
  If Pos(Find, Form1.SynEdit1.Lines.Text)<>0
  then begin
    Form1.SynEdit1.SetFocus;
    Form1.SynEdit1.SelStart:=Pos(Find, Form1.SynEdit1.Lines.Text);
    Form1.SynEdit1.SelEnd:=Pos(Find, Form1.SynEdit1.Lines.Text)+Length(find);
end else MessageDlg ('Строка ' + Find + ' не найдена!', mtConfirmation, [mbYes], 0);
  end;


//Отмена
procedure TForm2.CancelClick(Sender: TObject);
begin
  close;
end;

procedure TForm2.FindFurtherClick(Sender: TObject);
var
  Find: string; //искомая строка
  k,i: integer; //источник для цикла
begin

  Find:=AnsiLowerCase(Edit1.Text);
  if Length(find)<>0 then
  k:= Form1.SynEdit1.SelStart+Length(find)
  else  k:=0;

  i:=PosEx(AnsiLowerCase(Find), AnsiLowerCase(Form1.SynEdit1.Lines.Text), k);
  if PosEx(AnsiLowerCase(Find), AnsiLowerCase(Form1.SynEdit1.Lines.Text), k)<>0  //X := PosEx('Привет', 'Эй! Привет мир! Привет.', X+1);
  //Pos(AnsiLowerCase(Find), AnsiLowerCase(Form1.SynEdit1.Lines.Text))<>0

    then begin
    Form1.SynEdit1.SetFocus;
    Form1.SynEdit1.SelStart:=PosEx(AnsiLowerCase(Find), AnsiLowerCase(Form1.SynEdit1.Lines.Text), k);
    Form1.SynEdit1.SelEnd:=PosEx(AnsiLowerCase(Find), AnsiLowerCase(Form1.SynEdit1.Lines.Text), k)+Length(find);
    end;
end;

//заменить
procedure TForm2.Replace1Click(Sender: TObject);
begin
 Form1.SynEdit1.Text:=StringReplace(Form1.SynEdit1.Text, Edit1.Text, Edit2.Text, [rfIgnoreCase] );
end;

//заменить все
procedure TForm2.ReplaceAll1Click(Sender: TObject);
begin
 Form1.SynEdit1.Text:=StringReplace(Form1.SynEdit1.Text, Edit1.Text, Edit2.Text, [rfReplaceAll,rfIgnoreCase] );
end;



end.


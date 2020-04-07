unit Unit1;
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ActnList,
  Menus, Buttons, ExtCtrls, Ipfilebroker, SynHighlighterPas, SynEdit,
  SynHighlighterCpp, SynHighlighterJScript, LCLIntf, ComCtrls,
  Unit2, LCLTranslator, Unit3, Unit4, DefaultTranslator,LCLType ;

type

  { TForm1 }

  TForm1 = class(TForm)
    FindDialog1: TFindDialog;
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    OpenDialog2: TOpenDialog;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem11: TMenuItem;
    Find: TMenuItem;
    Replace: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    ReplaceDialog1: TReplaceDialog;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    SynCppSyn2: TSynCppSyn;
    SynEdit1: TSynEdit;
    SynJScriptSyn2: TSynJScriptSyn;
    SynPasSyn2: TSynPasSyn;
    Timer1: TTimer;
    procedure FindDialog1Find(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Fille(Sender: TObject);
    procedure Font(Sender: TObject);
    procedure Day(Sender: TObject);
    procedure Brand(Sender: TObject);
    procedure Help(Sender: TObject);
    procedure Exit(Sender: TObject);
    procedure About(Sender: TObject);
    procedure language(Sender: TObject);
    procedure Help1(Sender: TObject);
    procedure ReplaceClick(Sender: TObject);
    procedure FindClick(Sender: TObject);
    procedure Mode(Sender: TObject);
    procedure ReplaceDialog1Replace(Sender: TObject);
    procedure SaveAs(Sender: TObject);
    procedure Night(Sender: TObject);
    procedure SynEdit1Change(Sender: TObject);
    procedure Theme(Sender: TObject);
    procedure SelectAll(Sender: TObject);
    procedure Cut(Sender: TObject);
    procedure Copy(Sender: TObject);
    procedure Paste(Sender: TObject);
    procedure Edit(Sender: TObject);
    procedure Save(Sender: TObject);
    procedure Russian(Sender: TObject);
    procedure English(Sender: TObject);
    procedure New(Sender: TObject);
    procedure Open(Sender: TObject);
    procedure Closse(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);


  private
     procedure Sohranit(Sender: TObject);
  public

  end;
        function ExtensionSearch(temp: String): String;

var
  Form1: TForm1;
  File_Ansi:string;

implementation
uses  StrUtils; // Для PosEx
{$R *.lfm}

{ TForm1 }


procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.FindDialog1Find(Sender: TObject);
var FIndex,k: Integer;
begin
   FindDialog1.FindText:=ReplaceDialog1.FindText;
  if Length(FindDialog1.FindText)<>0 then
  k:= SynEdit1.SelStart+Length(FindDialog1.FindText)
  else  k:=0;

     FIndex:=PosEx(FindDialog1.FindText, SynEdit1.Text,k);

     if FIndex <> 0 then
begin
SynEdit1.SetFocus;
SynEdit1.SelStart:=FIndex;
SynEdit1.SelEnd:=FIndex+Length(FindDialog1.FindText);
end else MessageDlg ('Строка ' + FindDialog1.FindText + ' не найдена!', mtConfirmation, [mbYes], 0);
end;

procedure TForm1.ReplaceDialog1Replace(Sender: TObject);
  var FIndex,k: Integer;
begin
      k:=Length(FindDialog1.FindText);
     FIndex:=PosEx(FindDialog1.FindText, SynEdit1.Text,k+1);
  while FIndex <> 0 do
       begin
        With SynEdit1 do begin
           SelStart := FIndex-1;
           SelEnd:=FIndex+Length(ReplaceDialog1.FindText);
           SelText := ReplaceDialog1.ReplaceText;
         end;
         // При необходимости одноразовой замены завершаем цикл
         if not (frReplaceAll in ReplaceDialog1.Options) then Break;
       end;

end;

       //time
procedure TForm1.Timer1Timer(Sender: TObject);
begin
 StatusBar1.Panels[0].Text:='Текущее время: ' + FormatDateTime('hh:mm:ss', now);
end;


procedure TForm1.SynEdit1Change(Sender: TObject);
begin

end;

 //Файл
procedure TForm1.Fille(Sender: TObject);
begin

end;

procedure TForm1.New(Sender: TObject);
begin
  File_Ansi:='';
  SynEdit1.Clear;
end;

procedure TForm1.Open(Sender: TObject);
  var temp: String;
begin
  openDialog1.Filter:= 'All ext|*|Text files|*.txt|Pascal|*.pas|С++|*.cpp|JavaScript|*.js';
if OpenDialog1.Execute then
   begin
       File_Ansi:= OpenDialog1.FileName;
      SynEdit1.Lines.LoadFromFile(File_Ansi);

   end;

temp:= ExtensionSearch(File_Ansi);
    case temp of
       'pas': begin
         SynEdit1.Highlighter:= SynPasSyn2;
         Form1.SynEdit1.Gutter.Visible:=true;   //возможность сворачивать
         StatusBar1.Panels.Items[1].Text:= 'Pas';
       end;
       'cpp': begin
         SynEdit1.Highlighter:= SynCppSyn2;
         Form1.SynEdit1.Gutter.Visible:=true;   //возможность сворачивать
         StatusBar1.Panels.Items[1].Text:= 'С++';
       end;
       'js': begin
         SynEdit1.Highlighter:= SynJScriptSyn2;
         Form1.SynEdit1.Gutter.Visible:=true;   //возможность сворачивать
         StatusBar1.Panels.Items[1].Text:= 'JScript';
       end;
       'txt': begin
         SynEdit1.Highlighter:= nil;
       end;
end;
end;

procedure TForm1.Closse(Sender: TObject);
begin
  //Закрывает текущий файл, с выводом сообщения о том следует ли сохранить сделанные изменения.
if MessageDlg('Сохранить?', mtInformation, [mbYes, mbNo], 0) = mrYes then
  begin if SaveDialog1.Execute then
    SynEdit1.Lines.SaveToFile(SaveDialog1.FileName)  end
else
  SynEdit1.Clear;
end;

procedure TForm1.Save(Sender: TObject);
begin
  If File_Ansi='' then Sohranit(Sender) else SynEdit1.Lines.SaveToFile(File_Ansi);
end;

procedure TForm1.SaveAs(Sender: TObject);
begin
  Sohranit(Sender);
end;

procedure TForm1.Exit(Sender: TObject);
begin
  Close;
end;


//Правка
procedure TForm1.Edit(Sender: TObject);
begin

end;

procedure TForm1.SelectAll(Sender: TObject);
begin
 SynEdit1.SelectAll;
end;

procedure TForm1.Cut(Sender: TObject);
begin
 SynEdit1.CutToClipboard;
end;

procedure TForm1.Copy(Sender: TObject);
begin
  SynEdit1.CopyToClipboard;
end;

procedure TForm1.Paste(Sender: TObject);
begin
   SynEdit1.PasteFromClipboard;
end;


//Вид
procedure TForm1.Mode(Sender: TObject);
begin

end;

procedure TForm1.Font(Sender: TObject);
begin
  FontDialog1.Font:=  SynEdit1.Font;
 if FontDialog1.Execute=true  then
      begin
         Form1.SynEdit1.Font := FontDialog1.Font;
      end;
 //if FontDialog1.Execute then Memo1.Font := FontDialog1.Font; ТОЖЕ ГОДНО
end;

procedure TForm1.Theme(Sender: TObject);
begin

end;

procedure TForm1.Day(Sender: TObject);
begin
  synEdit1.Color:= clWhite;
  SynEdit1.Font.Color:= clBlack;
end;

procedure TForm1.Night(Sender: TObject);
begin
    synEdit1.Color:= clBlack;
    SynEdit1.Font.Color:= clWhite;
end;

procedure TForm1.Brand(Sender: TObject);
begin
    synEdit1.Color:= clSkyBlue;
    SynEdit1.Font.Color:= clBlack;
end;


//Справка
procedure TForm1.Help(Sender: TObject);
begin

end;

procedure TForm1.Help1(Sender: TObject);
begin
     Form3.Show;
   //OpenURL('http://google.com');  //справка в браузере
 //ShellExecute(0,PChar('Open'), PChar('Spravka.chm'),nil,nil,SW_SHOW);  //локальный файл
end;

procedure TForm1.About(Sender: TObject);
begin
     Form4.Show;
end;

//Поиск
 procedure TForm1.FindClick(Sender: TObject);
begin
 //FindDialog1.Execute;
 Form2.Show;
end;

procedure TForm1.ReplaceClick(Sender: TObject);
begin
 //ReplaceDialog1.Execute;
 Form2.Show;
end;


//Язык
procedure TForm1.language(Sender: TObject);
begin

end;

//смена на Русский
procedure TForm1.Russian(Sender: TObject);
begin
  SetDefaultLang('ru', 'lang');
end;

//смена на Английский
procedure TForm1.English(Sender: TObject);
begin
  SetDefaultLang('en', 'lang');
end;


  procedure TForm1.Sohranit(Sender: TObject);
begin
 if SaveDialog1.Execute then
   begin
      SynEdit1.Lines.SaveToFile(SaveDialog1.FileName);
      File_Ansi:= SaveDialog1.FileName;
   end;
end;

  function ExtensionSearch(temp: String): String;
var x1: integer;
  begin
  x1:= pos('.', temp);
  ExtensionSearch:= Copy(temp, x1+1);
  end;
end.

end.


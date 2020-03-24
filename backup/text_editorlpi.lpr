program text_editorlpi;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Translations,
  Forms, datetimectrls, Unit1, Unit2, Unit3;

{$R *.res}

begin
  Translations.TranslateUnitResourceStrings('lclstrconsts', 'C:\lazarus\lcl\languages\lclstrconsts.ru.po');
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.


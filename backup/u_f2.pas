unit u_f2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    ColorDialog1: TColorDialog;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }
 procedure TForm2.Memo1Change(Sender: TObject);
begin

end;

procedure TForm2.Label1Click(Sender: TObject);
begin

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Label1.Font.Style:=[fsItalic];
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
    Label1.Font.Style:=[fsUnderline];
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
   Label1.Font.SetDefault;
end;

procedure TForm2.Button8Click(Sender: TObject);
begin
       If ColorDialog1.Execute=True then

        Label1.Font.Color:=ColorDialog1.Color;
end;


procedure TForm2.Button5Click(Sender: TObject);
begin
   Label1.Font.Size:=Label1.Font.Size+1;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Label1.Font.Style:=[fsbold];
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  Label1.Font.Size:=Label1.Font.Size-1;
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
  Close;
end;


end.


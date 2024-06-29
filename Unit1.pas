                              unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    procedure CopyFile(const SourceFile, DestFile: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  SourcePath, DestPath: string;
begin
  SourcePath := 'D:\projeto\Project1.exe'; // Caminho do arquivo de origem
  DestPath := 'C:\projeto\Project1.exe';   // Caminho do arquivo de destino

  CopyFile(SourcePath, DestPath); // Chama a fun��o para copiar o arquivo
end;

procedure TForm1.CopyFile(const SourceFile, DestFile: string);
begin
  try
    // Copia o arquivo de origem para o destino
    if not Windows.CopyFile(PChar(SourceFile), PChar(DestFile), False) then
      raise Exception.Create('Erro ao copiar o arquivo');
    ShowMessage('Arquivo copiado com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
end;

end.


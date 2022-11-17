unit FBrasil4DExemplo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.DateUtils,
  Brasil4D, Vcl.ComCtrls;

type
  TfrmBrasil4DExemplo = class(TForm)
    Panel1: TPanel;
    Brasil4D1: TBrasil4D;
    pgcBrasilAPI: TPageControl;
    tsBank: TTabSheet;
    tsFeriadosNacionais: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    edtAno: TEdit;
    btnListar: TButton;
    mmoResponse: TMemo;
    Panel3: TPanel;
    Label2: TLabel;
    edtBankCode: TEdit;
    btnBankListar: TButton;
    btnBankBuscar: TButton;
    mmoBankResponse: TMemo;
    tsCEP: TTabSheet;
    Panel4: TPanel;
    Label3: TLabel;
    edtCep: TEdit;
    btnCEP: TButton;
    btnCepV2: TButton;
    mmoCepResponse: TMemo;
    tsCNPJ: TTabSheet;
    Panel5: TPanel;
    Label4: TLabel;
    edtCNPJ: TEdit;
    btnCNPJ: TButton;
    mmoCNPJResponse: TMemo;
    tsDDD: TTabSheet;
    Panel6: TPanel;
    Label5: TLabel;
    edtDDD: TEdit;
    btnDDD: TButton;
    mmoDDDResponse: TMemo;
    tsRegistroBR: TTabSheet;
    Panel7: TPanel;
    Label6: TLabel;
    edtDominio: TEdit;
    btnRegistroBR: TButton;
    mmoRegistroBRResponse: TMemo;
    tsISBN: TTabSheet;
    Panel8: TPanel;
    Label7: TLabel;
    edtISBN: TEdit;
    btnISBN: TButton;
    mmoISBNResponse: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnBankBuscarClick(Sender: TObject);
    procedure btnBankListarClick(Sender: TObject);
    procedure btnCEPClick(Sender: TObject);
    procedure btnCepV2Click(Sender: TObject);
    procedure btnCNPJClick(Sender: TObject);
    procedure btnDDDClick(Sender: TObject);
    procedure btnRegistroBRClick(Sender: TObject);
    procedure btnISBNClick(Sender: TObject);
  private
    { Private declarations }
  public
    destructor Destroy; override;
    { Public declarations }
  end;

var
  frmBrasil4DExemplo: TfrmBrasil4DExemplo;

implementation

{$R *.dfm}

procedure TfrmBrasil4DExemplo.btnBankBuscarClick(Sender: TObject);
begin
  Brasil4D1.Bank.Busca.Code := StrToIntDef(edtBankCode.Text, 1);
  Brasil4D1.Bank.Busca.Executar;

  mmoBankResponse.Lines.Clear;
  mmoBankResponse.Lines.Add('ISPB: ' + Brasil4D1.Bank.Busca.Retorno.ISPB);
  mmoBankResponse.Lines.Add('Name: ' + Brasil4D1.Bank.Busca.Retorno.Name);
  mmoBankResponse.Lines.Add('Code: ' + Brasil4D1.Bank.Busca.Retorno.Code.ToString);
  mmoBankResponse.Lines.Add('Full Name: ' + Brasil4D1.Bank.Busca.Retorno.FullName);
end;

procedure TfrmBrasil4DExemplo.btnBankListarClick(Sender: TObject);
var
  I: Integer;
begin
  Brasil4D1.Bank.Lista.Executar;
  mmoBankResponse.Lines.Clear;

  for I := 0 to Pred(Brasil4D1.Bank.Lista.Retorno.Count) do
  begin
    mmoBankResponse.Lines.Add(EmptyStr);
    mmoBankResponse.Lines.Add('ISPB: ' + Brasil4D1.Bank.Lista.Retorno[I].ISPB);
    mmoBankResponse.Lines.Add('Name: ' + Brasil4D1.Bank.Lista.Retorno[I].Name);
    mmoBankResponse.Lines.Add('Code: ' + Brasil4D1.Bank.Lista.Retorno[I].Code.ToString);
    mmoBankResponse.Lines.Add('Full Name: ' + Brasil4D1.Bank.Lista.Retorno[I].FullName);
  end;
end;

procedure TfrmBrasil4DExemplo.btnCEPClick(Sender: TObject);
begin
  Brasil4D1.CEP.Cep := edtCep.Text;
  Brasil4D1.CEP.Executar;

  mmoCepResponse.Clear;
  mmoCepResponse.Lines.Add('Cep: ' + Brasil4D1.CEP.Retorno.Cep);
  mmoCepResponse.Lines.Add('State: ' + Brasil4D1.CEP.Retorno.State);
  mmoCepResponse.Lines.Add('City: ' + Brasil4D1.CEP.Retorno.City);
  mmoCepResponse.Lines.Add('Neighborhood: ' + Brasil4D1.CEP.Retorno.Neighborhood);
  mmoCepResponse.Lines.Add('Street: ' + Brasil4D1.CEP.Retorno.Street);
  mmoCepResponse.Lines.Add('Service: ' + Brasil4D1.CEP.Retorno.Service);
end;

procedure TfrmBrasil4DExemplo.btnCepV2Click(Sender: TObject);
begin
  Brasil4D1.CEPV2.Cep := edtCep.Text;
  Brasil4D1.CEPV2.Executar;

  mmoCepResponse.Clear;
  mmoCepResponse.Lines.Add('Cep: ' + Brasil4D1.CEPV2.Retorno.Cep);
  mmoCepResponse.Lines.Add('State: ' + Brasil4D1.CEPV2.Retorno.State);
  mmoCepResponse.Lines.Add('City: ' + Brasil4D1.CEPV2.Retorno.City);
  mmoCepResponse.Lines.Add('Neighborhood: ' + Brasil4D1.CEPV2.Retorno.Neighborhood);
  mmoCepResponse.Lines.Add('Street: ' + Brasil4D1.CEPV2.Retorno.Street);
  mmoCepResponse.Lines.Add('Service: ' + Brasil4D1.CEPV2.Retorno.Service);
  mmoCepResponse.Lines.Add('Latitude: ' + Brasil4D1.CEPV2.Retorno.Latitude.ToString);
  mmoCepResponse.Lines.Add('Longitude: ' + Brasil4D1.CEPV2.Retorno.Longitude.ToString);
end;

procedure TfrmBrasil4DExemplo.btnCNPJClick(Sender: TObject);
begin
  Brasil4D1.CNPJ.CNPJ := edtCNPJ.Text;
  Brasil4D1.CNPJ.Executar;

  mmoCNPJResponse.Clear;
  mmoCNPJResponse.Lines.Add('CNPJ: ' + Brasil4D1.CNPJ.Retorno.CNPJ);
  mmoCNPJResponse.Lines.Add('Raz�o Social: ' + Brasil4D1.CNPJ.Retorno.RazaoSocial);
  mmoCNPJResponse.Lines.Add('Nome Fantasia: ' + Brasil4D1.CNPJ.Retorno.NomeFantasia);
  mmoCNPJResponse.Lines.Add('Cnae Descri��o: ' + Brasil4D1.CNPJ.Retorno.CnaeFiscalDescricao);
end;

procedure TfrmBrasil4DExemplo.btnDDDClick(Sender: TObject);
var
  I: Integer;
begin
  mmoDDDResponse.Clear;
  Brasil4D1.DDD.DDD := StrToIntDef(edtDDD.Text, 21);
  Brasil4D1.DDD.Executar;

  mmoDDDResponse.Lines.Add('State: ' + Brasil4D1.DDD.Retorno.State);
  mmoDDDResponse.Lines.Add('Nome: ' + Brasil4D1.DDD.Retorno.Nome);
  mmoDDDResponse.Lines.Add('Id Regi�o: ' + Brasil4D1.DDD.Retorno.Regiao.Id.ToString);
  mmoDDDResponse.Lines.Add('Sigla Regi�o: ' + Brasil4D1.DDD.Retorno.Regiao.Sigla);
  mmoDDDResponse.Lines.Add('Nome Regi�o: ' + Brasil4D1.DDD.Retorno.Regiao.Nome);

  mmoDDDResponse.Lines.Add('Cities');
  for I := 0 to Pred(Brasil4D1.DDD.Retorno.Cities.Count) do
    mmoDDDResponse.Lines.Add('  ' + Brasil4D1.DDD.Retorno.Cities[I]);
end;

procedure TfrmBrasil4DExemplo.btnISBNClick(Sender: TObject);
var
  I: Integer;
begin
  mmoISBNResponse.Clear;
  Brasil4D1.ISBN.ISBN := edtISBN.Text;
  Brasil4D1.ISBN.Executar;

  mmoISBNResponse.Lines.Add('ISBN: ' + Brasil4D1.ISBN.Retorno.ISBN);
  mmoISBNResponse.Lines.Add('Title: ' + Brasil4D1.ISBN.Retorno.Title);
  mmoISBNResponse.Lines.Add('Subtitle: ' + Brasil4D1.ISBN.Retorno.Subtitle);
end;

procedure TfrmBrasil4DExemplo.btnListarClick(Sender: TObject);
var
  I: Integer;
begin
  Brasil4D1.FeriadosNacionais.Lista.Ano := StrToIntDef(edtAno.Text, YearOf(Now));
  Brasil4D1.FeriadosNacionais.Lista.Executar;
  mmoResponse.Lines.Clear;
  for I := 0 to Pred(Brasil4D1.FeriadosNacionais.Lista.Retorno.Count) do
  begin
    mmoResponse.Lines.Add(EmptyStr);
    mmoResponse.Lines.Add('Data: ' + FormatDateTime('dd/MM/yyyy', Brasil4D1.FeriadosNacionais.Lista.Retorno[I].Date));
    mmoResponse.Lines.Add('Name: ' + Brasil4D1.FeriadosNacionais.Lista.Retorno[I].Name);
    mmoResponse.Lines.Add('Type: ' + Brasil4D1.FeriadosNacionais.Lista.Retorno[I].&Type);
  end;
end;

procedure TfrmBrasil4DExemplo.btnRegistroBRClick(Sender: TObject);
begin
  mmoRegistroBRResponse.Clear;
  Brasil4D1.RegistroBR.Domain := edtDominio.Text;
  Brasil4D1.RegistroBR.Executar;

  mmoRegistroBRResponse.Lines.Add('Fqdn: ' + Brasil4D1.RegistroBR.Retorno.Fqdn);
  mmoRegistroBRResponse.Lines.Add('Status Code: ' + Brasil4D1.RegistroBR.Retorno.StatusCode.ToString);
  mmoRegistroBRResponse.Lines.Add('Status: ' + Brasil4D1.RegistroBR.Retorno.Status);
  mmoRegistroBRResponse.Lines.Add('Publication Status: ' + Brasil4D1.RegistroBR.Retorno.PublicationStatus);
end;

destructor TfrmBrasil4DExemplo.Destroy;
begin
  inherited;
end;

procedure TfrmBrasil4DExemplo.FormCreate(Sender: TObject);
begin
  edtAno.Text := IntToStr(YearOf(Now));
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TFormCalculator }

  TFormCalculator = class(TForm)
    ButtonSubmit: TButton;
    ButtonClear: TButton;
    ButtonQuit: TButton;
    EditNum1: TEdit;
    EditNum2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    LabelSign: TLabel;
    LabelAnswer: TLabel;
    RadioButtonAdd: TRadioButton;
    RadioButtonSubtract: TRadioButton;
    RadioButtonMultiply: TRadioButton;
    RadioButtonDivide: TRadioButton;
    RadioGroupOperator: TRadioGroup;
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonQuitClick(Sender: TObject);
    procedure ButtonSubmitClick(Sender: TObject);
    function HandleValueTotal(First, Second: String): String;
    procedure HandleOperatorValue();
    procedure RadioButtonAddClick(Sender: TObject);
    procedure RadioButtonDivideClick(Sender: TObject);
    procedure RadioButtonMultiplyClick(Sender: TObject);
    procedure RadioButtonSubtractClick(Sender: TObject);
  private

  public

  end;

var
  FormCalculator: TFormCalculator;

implementation

{$R *.lfm}

{ TFormCalculator }

procedure TFormCalculator.ButtonSubmitClick(Sender: TObject);
begin
  if (EditNum1.Text <> '') and (EditNum2.Text <> '') then
     LabelAnswer.Caption := HandleValueTotal(EditNum1.Text, EditNum2.Text)
  else
  begin
    ShowMessage('Todos os campos devem estar preenchidos');
    exit();
  end;
end;

procedure TFormCalculator.ButtonClearClick(Sender: TObject);
begin
  EditNum1.Text := '';
  EditNum2.Text := '';
  LabelAnswer.Caption := '';
end;

procedure TFormCalculator.ButtonQuitClick(Sender: TObject);
begin
  Close;
end;

function TFormCalculator.HandleValueTotal(First, Second: String): String;
begin
  try
     if RadioButtonAdd.checked = True then
     begin
          Result := FloatToStr(StrToFloat(First) + StrToFloat(Second));
          LabelSign.Caption := '+';
          exit;
     end
     else if RadioButtonSubtract.checked = True then
     begin
          Result := FloatToStr(StrToFloat(First) - StrToFloat(Second));
          LabelSign.Caption := '-';
          exit;
     end
     else if RadioButtonMultiply.checked = True then
     begin
          Result := FloatToStr(StrToFloat(First) * StrToFloat(Second));
          LabelSign.Caption := '*';
          exit;
     end
     else if RadioButtonDivide.checked = True then
     begin
          Result := FloatToStr(StrToFloat(First) / StrToFloat(Second));
          LabelSign.Caption := '/';
          exit;
     end
  except
    on EConvertError do
       ShowMessage('Número inválido, tente novamente!')
  end;
  Result := '';
end;

procedure TFormCalculator.HandleOperatorValue();
begin
      if RadioButtonAdd.checked = True then
          LabelSign.Caption := '+'
     else if RadioButtonSubtract.checked = True then
          LabelSign.Caption := '-'
     else if RadioButtonMultiply.checked = True then
          LabelSign.Caption := '*'
     else if RadioButtonDivide.checked = True then
          LabelSign.Caption := '/';
end;

procedure TFormCalculator.RadioButtonAddClick(Sender: TObject);
begin
  HandleOperatorValue();
end;

procedure TFormCalculator.RadioButtonDivideClick(Sender: TObject);
begin
  HandleOperatorValue();
end;

procedure TFormCalculator.RadioButtonMultiplyClick(Sender: TObject);
begin
  HandleOperatorValue();
end;

procedure TFormCalculator.RadioButtonSubtractClick(Sender: TObject);
begin
  HandleOperatorValue();
end;

end.


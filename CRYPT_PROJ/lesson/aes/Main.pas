unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ElAES, Math, Buttons;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Label_Time: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label_Status: TLabel;
    Memo_PlainText: TMemo;
    Memo_CyperText: TMemo;
    Label11: TLabel;
    Label12: TLabel;
    Memo_UncipherText: TMemo;
    Label13: TLabel;
    BitBtn_Encrypt: TBitBtn;
    BitBtn_Decypt: TBitBtn;
    Edit3: TEdit;
    Label6: TLabel;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn_EncryptClick(Sender: TObject);
    procedure BitBtn_DecyptClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



var
  Form1: TForm1;
  EncryptedText: string;

function StringToHex(S: string): string; forward;
function HexToString(S: string): string; forward;

implementation

{$R *.DFM}

function StringToHex(S: string): string;
var
	i: integer;

begin
  Result := '';

  // Go throught every single characters, and convert them
  // to hexadecimal...
	for i := 1 to Length( S ) do
  	Result := Result + IntToHex( Ord( S[i] ), 2 );
end;

function HexToString(S: string): string;
var
	i: integer;

begin
  Result := '';

  // Go throught every single hexadecimal characters, and convert
  // them to ASCII characters...
  for i := 1 to Length( S ) do
  begin
    // Only process chunk of 2 digit Hexadecimal...
  	if ((i mod 2) = 1) then
	  	Result := Result + Chr( StrToInt( '0x' + Copy( S, i, 2 )));
  end;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Edit1.Text := OpenDialog1.FileName;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Source, Dest: TFileStream;
  SrcFile, DestFile: string;
  Start, Stop: cardinal;
  Size: integer;
  Key: TAESKey128;
  SrcBuf, DstBuf: array [0..16383] of byte;
  SrcSize, DstSize: integer;
begin
  // Encryption
  Label_Status.Caption := 'Encrypting...';
  Refresh;
  Source := TFileStream.Create(Edit1.Text, fmOpenRead);
  try
    Label4.Caption := IntToStr(Source.Size div 1024) + ' KB';
    Refresh;
    Dest := TFileStream.Create(edit3.text, fmCreate);
    try
      Size := Source.Size;
      Dest.WriteBuffer(Size, SizeOf(Size));

      FillChar(Key, SizeOf(Key), 0);
      Move(PChar(Edit2.Text)^, Key, Min(SizeOf(Key), Length(Edit2.Text)));

      Start := GetTickCount;
      EncryptAESStreamECB(Source, 0, Key, Dest);
      Stop := GetTickCount;
      Label_Time.Caption := IntToStr(Stop - Start) + ' ms';
      Refresh;
    finally
      Dest.Free;
    end;
  finally
    Source.Free;
  end;
  Label_Status.Caption := '';
end;


(*******************************************************************************
   This routine will encrypt text using a TStringStream... Once the text is
   encrypted it will be converted to hexadecimals to assure visibility of the
   text. If the text is not converted, it might not be visible since their might
   by null characters  within the encrypted string therefore text will be lost.

   If the encrypted text is saved to a memory variable or file it is not
   necessary convert it to hexa...
*******************************************************************************)
procedure TForm1.BitBtn_EncryptClick(Sender: TObject);
var
  Source: TStringStream;
  Dest: TStringStream;
  Start, Stop: cardinal;
  Size: integer;
  Key: TAESKey128;

begin
  // Encryption
  Label_Status.Caption := 'Encrypting...';
  Refresh;
  Source := TStringStream.Create( Memo_PlainText.Text );
  Dest   := TStringStream.Create( '' );

  try
    // Save data to memory stream...
    Size := Source.Size;
    Dest.WriteBuffer( Size, SizeOf(Size) );

    // Prepare key...
    FillChar( Key, SizeOf(Key), 0 );
    Move( PChar(Edit2.Text)^, Key, Min( SizeOf( Key ), Length( Edit2.Text )));

    // Start encryption...
    Start := GetTickCount;
    EncryptAESStreamECB( Source, 0, Key, Dest );
    Stop := GetTickCount;
    Label_Time.Caption := IntToStr(Stop - Start) + ' ms';
    Refresh;

    // Display encrypted text using hexadecimals...
	  Memo_CyperText.Lines.BeginUpdate;
    Memo_CyperText.Text := StringToHex( Dest.DataString );
	  Memo_CyperText.Lines.EndUpdate;

  finally
    Source.Free;
    Dest.Free;
  end;
end;

procedure TForm1.BitBtn_DecyptClick(Sender: TObject);
var
  Source: TStringStream;
  Dest: TStringStream;
  Start, Stop: cardinal;
  Size: integer;
  Key: TAESKey128;
  EncryptedText: TStrings;
  S: string;

begin
  // Convert hexadecimal to a strings before decrypting...
  Source := TStringStream.Create( HexToString( Memo_CyperText.Text ));
  Dest   := TStringStream.Create( '' );

  try
    // Start decryption...
    Size := Source.Size;
    Start := GetTickCount;
    Source.ReadBuffer(Size, SizeOf(Size));

    // Prepare key...
    FillChar(Key, SizeOf(Key), 0);
    Move(PChar(Edit2.Text)^, Key, Min(SizeOf(Key), Length(Edit2.Text)));

    // Decrypt now...
    DecryptAESStreamECB(Source, Source.Size - Source.Position, Key, Dest);
    Stop := GetTickCount;
    Label8.Caption := IntToStr(Stop - Start) + ' ms';
    Refresh;

    // Display unencrypted text...
    Memo_UncipherText.Text := Dest.DataString;

  finally
    Source.Free;
    Dest.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Source, Dest: TFileStream;
  SrcFile, DestFile: string;
  Start, Stop: cardinal;
  Size: integer;
  Key: TAESKey128;
  SrcBuf, DstBuf: array [0..16383] of byte;
  SrcSize, DstSize: integer;
begin
  // Decryption
  Label_Status.Caption := 'Decrypting...';
  Refresh;
  Source := TFileStream.Create(edit1.text, fmOpenRead);
  try
    Source.ReadBuffer(Size, SizeOf(Size));
    Dest := TFileStream.Create(edit3.text, fmCreate);
    try
      FillChar(Key, SizeOf(Key), 0);
      Move(PChar(Edit2.Text)^, Key, Min(SizeOf(Key), Length(Edit2.Text)));

      Start := GetTickCount;
      DecryptAESStreamECB(Source, Source.Size - Source.Position, Key, Dest);
      Dest.Size := Size;
      Stop := GetTickCount;
      Label8.Caption := IntToStr(Stop - Start) + ' ms';
      Refresh;
    finally
      Dest.Free;
    end;
  finally
    Source.Free;
  end;
  Label_Status.Caption := '';
end;

end.

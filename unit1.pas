//Copyright 2020 Andrey S. Ionisyan (anserion@gmail.com)
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.

unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BTN_orig1_draw: TButton;
    BTN_orig2_learn: TButton;
    BTN_orig3_learn: TButton;
    BTN_orig4_learn: TButton;
    BTN_orig2_draw: TButton;
    BTN_orig3_draw: TButton;
    BTN_orig4_draw: TButton;
    BTN_orig_create: TButton;
    BTN_step: TButton;
    BTN_S_reset: TButton;
    BTN_W_reset: TButton;
    BTN_orig1_learn: TButton;
    BTN_neurons_out_forget: TButton;
    Edit_student_name: TEdit;
    GB_Layer1: TGroupBox;
    Label_neuron1: TLabel;
    Label_neuron10: TLabel;
    Label_neuron11: TLabel;
    Label_neuron12: TLabel;
    Label_neuron13: TLabel;
    Label_neuron14: TLabel;
    Label_neuron15: TLabel;
    Label_neuron16: TLabel;
    Label_neuron17: TLabel;
    Label_neuron18: TLabel;
    Label_neuron19: TLabel;
    Label_neuron2: TLabel;
    Label_neuron20: TLabel;
    Label_neuron21: TLabel;
    Label_neuron22: TLabel;
    Label_neuron23: TLabel;
    Label_neuron24: TLabel;
    Label_neuron25: TLabel;
    Label_neuron3: TLabel;
    Label_neuron4: TLabel;
    Label_neuron5: TLabel;
    Label_Layer3: TLabel;
    Label_neuron6: TLabel;
    Label_neuron7: TLabel;
    Label_neuron8: TLabel;
    Label_neuron9: TLabel;
    Label_student_name: TLabel;
    Label2: TLabel;
    Label_orig1: TLabel;
    Label_orig2: TLabel;
    Label_orig3: TLabel;
    Label_orig4: TLabel;
    Panel_neuron10: TPanel;
    Panel_neuron11: TPanel;
    Panel_neuron12: TPanel;
    Panel_neuron13: TPanel;
    Panel_neuron14: TPanel;
    Panel_neuron15: TPanel;
    Panel_neuron16: TPanel;
    Panel_neuron17: TPanel;
    Panel_neuron18: TPanel;
    Panel_neuron19: TPanel;
    Panel_neuron2: TPanel;
    Panel_neuron20: TPanel;
    Panel_neuron21: TPanel;
    Panel_neuron22: TPanel;
    Panel_neuron23: TPanel;
    Panel_neuron24: TPanel;
    Panel_neuron25: TPanel;
    Panel_neuron5: TPanel;
    Panel_neuron4: TPanel;
    Panel_neuron3: TPanel;
    Panel_neuron1: TPanel;
    Panel_neuron6: TPanel;
    Panel_neuron7: TPanel;
    Panel_neuron8: TPanel;
    Panel_neuron9: TPanel;
    PB_neurons_out: TPaintBox;
    PB_w_1: TPaintBox;
    PB_orig1: TPaintBox;
    PB_orig2: TPaintBox;
    PB_orig3: TPaintBox;
    PB_orig4: TPaintBox;
    PB_receptors: TPaintBox;
    PB_w_10: TPaintBox;
    PB_w_11: TPaintBox;
    PB_w_12: TPaintBox;
    PB_w_13: TPaintBox;
    PB_w_14: TPaintBox;
    PB_w_15: TPaintBox;
    PB_w_16: TPaintBox;
    PB_w_17: TPaintBox;
    PB_w_18: TPaintBox;
    PB_w_19: TPaintBox;
    PB_w_2: TPaintBox;
    PB_w_20: TPaintBox;
    PB_w_21: TPaintBox;
    PB_w_22: TPaintBox;
    PB_w_23: TPaintBox;
    PB_w_24: TPaintBox;
    PB_w_25: TPaintBox;
    PB_w_3: TPaintBox;
    PB_w_4: TPaintBox;
    PB_w_5: TPaintBox;
    PB_w_6: TPaintBox;
    PB_w_7: TPaintBox;
    PB_w_8: TPaintBox;
    PB_w_9: TPaintBox;
    procedure BTN_neurons_out_forgetClick(Sender: TObject);
    procedure BTN_orig1_learnClick(Sender: TObject);
    procedure BTN_W_resetClick(Sender: TObject);
    procedure BTN_stepClick(Sender: TObject);
    procedure BTN_orig1_drawClick(Sender: TObject);
    procedure BTN_orig_createClick(Sender: TObject);
    procedure BTN_S_resetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PB_neurons_outPaint(Sender: TObject);
    procedure PB_orig1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PB_orig1Paint(Sender: TObject);
    procedure PB_receptorsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PB_receptorsPaint(Sender: TObject);
    procedure PB_w_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PB_w_1Paint(Sender: TObject);
  private
    procedure Redraw_orig_cell( Sender: TObject; x,y:integer);
    procedure Redraw_widgets;
  public

  end;

const
  n_origs=4;
  s_width=5;
  s_height=5;
  n_L1=s_width*s_height;

var
  Form1: TForm1;

  L1_w:array[1..s_width,1..s_height,1..s_width,1..s_height] of real;
  L1_scalar:array[1..s_width,1..s_height]of real;
  L1_out:array[1..s_width,1..s_height]of real;

  S_elements: array[1..s_width,1..s_height]of integer;
  Orig_elements: array[1..n_origs,1..s_width,1..s_height]of integer;

implementation

{$R *.lfm}

function sigmoid(x:real):real;
begin sigmoid:=1/(1+exp(-x)); end;

{ TForm1 }

procedure TForm1.Redraw_widgets;
begin
  Label_neuron1.caption:='нейрон 1';
  Label_neuron2.caption:='нейрон 2';
  Label_neuron3.caption:='нейрон 3';
  Label_neuron4.caption:='нейрон 4';
  Label_neuron5.caption:='нейрон 5';
  Label_neuron6.caption:='нейрон 6';
  Label_neuron7.caption:='нейрон 7';
  Label_neuron8.caption:='нейрон 8';
  Label_neuron9.caption:='нейрон 9';
  Label_neuron10.caption:='нейрон 10';
  Label_neuron11.caption:='нейрон 11';
  Label_neuron12.caption:='нейрон 12';
  Label_neuron13.caption:='нейрон 13';
  Label_neuron14.caption:='нейрон 14';
  Label_neuron15.caption:='нейрон 15';
  Label_neuron16.caption:='нейрон 16';
  Label_neuron17.caption:='нейрон 17';
  Label_neuron18.caption:='нейрон 18';
  Label_neuron19.caption:='нейрон 19';
  Label_neuron20.caption:='нейрон 20';
  Label_neuron21.caption:='нейрон 21';
  Label_neuron22.caption:='нейрон 22';
  Label_neuron23.caption:='нейрон 23';
  Label_neuron24.caption:='нейрон 24';
  Label_neuron25.caption:='нейрон 25';

  PB_w_1Paint(PB_w_1);
  PB_w_1Paint(PB_w_2);
  PB_w_1Paint(PB_w_3);
  PB_w_1Paint(PB_w_4);
  PB_w_1Paint(PB_w_5);
  PB_w_1Paint(PB_w_6);
  PB_w_1Paint(PB_w_7);
  PB_w_1Paint(PB_w_8);
  PB_w_1Paint(PB_w_9);
  PB_w_1Paint(PB_w_10);
  PB_w_1Paint(PB_w_11);
  PB_w_1Paint(PB_w_12);
  PB_w_1Paint(PB_w_13);
  PB_w_1Paint(PB_w_14);
  PB_w_1Paint(PB_w_15);
  PB_w_1Paint(PB_w_16);
  PB_w_1Paint(PB_w_17);
  PB_w_1Paint(PB_w_18);
  PB_w_1Paint(PB_w_19);
  PB_w_1Paint(PB_w_20);
  PB_w_1Paint(PB_w_21);
  PB_w_1Paint(PB_w_22);
  PB_w_1Paint(PB_w_23);
  PB_w_1Paint(PB_w_24);
  PB_w_1Paint(PB_w_25);

  if BTN_orig1_learn.tag>0 then BTN_orig1_learn.caption:='Учить' else BTN_orig1_learn.Caption:='Забыть';
  if BTN_orig2_learn.tag>0 then BTN_orig2_learn.caption:='Учить' else BTN_orig2_learn.Caption:='Забыть';
  if BTN_orig3_learn.tag>0 then BTN_orig3_learn.caption:='Учить' else BTN_orig3_learn.Caption:='Забыть';
  if BTN_orig4_learn.tag>0 then BTN_orig4_learn.caption:='Учить' else BTN_orig4_learn.Caption:='Забыть';

  PB_orig1Paint(PB_orig1);
  PB_orig1Paint(PB_orig2);
  PB_orig1Paint(PB_orig3);
  PB_orig1Paint(PB_orig4);

  PB_receptorsPaint(PB_receptors);
  PB_neurons_outPaint(PB_neurons_out);
end;

procedure TForm1.PB_orig1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var cell_x,cell_y:integer; dx,dy:real;
begin
  with (sender as TPaintBox) do
  begin
    dx:=width/s_width;
    dy:=Height/s_height;
    cell_x:=trunc(X/dx)+1;
    cell_y:=trunc(Y/dy)+1;
    if orig_elements[tag,cell_x,cell_y]=1
    then orig_elements[tag,cell_x,cell_y]:=-1
    else orig_elements[tag,cell_x,cell_y]:=1;
    Redraw_orig_cell(Sender,cell_x,cell_y);
  end;
end;

procedure TForm1.PB_orig1Paint(Sender: TObject);
var cell_x,cell_y:integer;
begin
  with (sender as TPaintBox) do
    for cell_x:=1 to s_width do
      for cell_y:=1 to s_height do
        Redraw_orig_cell(Sender,cell_x,cell_y);
end;

procedure TForm1.PB_neurons_outPaint(Sender: TObject);
var cell_x,cell_y:integer; dx,dy:real; C:byte;
begin
  with (sender as TPaintBox) do
  begin
    dx:=width/s_width;
    dy:=Height/s_height;
    for cell_x:=1 to s_width do
      for cell_y:=1 to s_height do
      begin
        C:=255-trunc(255*L1_out[cell_x,cell_y]);
        Canvas.Pen.Color:=clBlack;
        Canvas.Brush.Style:=bsSolid;
        Canvas.Brush.Color:=RGBToColor(C,C,C);

        Canvas.Rectangle(trunc((cell_x-1)*dx),trunc((cell_y-1)*dy),
                         trunc(cell_x*dx),trunc(cell_y*dy));
        Canvas.Frame(trunc((cell_x-1)*dx),trunc((cell_y-1)*dy),
                     trunc(cell_x*dx),trunc(cell_y*dy));

        if C<128 then Canvas.Font.Color:=clWhite else Canvas.Font.Color:=clBlack;
        Canvas.TextOut(trunc((cell_x-1)*dx)+1,trunc((cell_y-1)*dy)+1,
                       FloatToStrF(L1_out[cell_x,cell_y],ffFixed,3,1));
      end;
  end;
end;

procedure TForm1.PB_receptorsMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var cell_x,cell_y:integer; dx,dy:real;
begin
  with PB_receptors do
  begin
     Canvas.Pen.Color:=clBlack;
     Canvas.Brush.Style:=bsSolid;
     dx:=width/s_width;
     dy:=Height/s_height;
     cell_x:=trunc(X/dx)+1;
     cell_y:=trunc(Y/dy)+1;
     if S_elements[cell_x,cell_y]=1
     then S_elements[cell_x,cell_y]:=-1
     else S_elements[cell_x,cell_y]:=1;

     if S_elements[cell_x,cell_y]=1
     then Canvas.Brush.Color:=clBlack
     else Canvas.Brush.Color:=clWhite;
     Canvas.Rectangle(trunc((cell_x-1)*dx),trunc((cell_y-1)*dy),
                      trunc(cell_x*dx),trunc(cell_y*dy));
  end;

  for cell_x:=1 to s_width do
  for cell_y:=1 to s_height do
    L1_out[cell_x,cell_y]:=S_elements[cell_x,cell_y];

  BTN_stepClick(self);
  Redraw_widgets;
end;

procedure TForm1.PB_receptorsPaint(Sender: TObject);
var x,y:integer; dx,dy:real;
begin
  with PB_receptors do
  begin
     Canvas.Pen.Color:=clBlack;
     Canvas.Brush.Style:=bsSolid;
     dx:=width/s_width;
     dy:=Height/s_height;
     for x:=1 to s_width do
     for y:=1 to s_height do
     begin
       if S_elements[x,y]=1
       then Canvas.Brush.Color:=clBlack
       else Canvas.Brush.Color:=clWhite;
       Canvas.Rectangle(trunc((x-1)*dx),trunc((y-1)*dy),trunc(x*dx),trunc(y*dy));
     end;
  end;
end;

procedure TForm1.PB_w_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var cell_x,cell_y,active_x,active_y:integer; dx,dy,value:real; s:string;
begin
  with (sender as TPaintBox) do
  begin
    dx:=width/s_width;
    dy:=Height/s_height;
    cell_x:=trunc(X/dx)+1;
    cell_y:=trunc(Y/dy)+1;
    active_x:=(tag mod s_width); if active_x=0 then active_x:=s_width;
    active_y:=(tag div s_width)+1; if active_x=s_width then active_y:=active_y-1;
    value:=L1_w[active_x,active_y,cell_x,cell_y];
    s:='w('+IntToStr(cell_x)+','+IntToStr(cell_y)+')='+FloatToStrF(value,fffixed,5,3);
    case tag of
    1: Label_neuron1.Caption:=s;
    2: Label_neuron2.Caption:=s;
    3: Label_neuron3.Caption:=s;
    4: Label_neuron4.Caption:=s;
    5: Label_neuron5.Caption:=s;
    6: Label_neuron6.Caption:=s;
    7: Label_neuron7.Caption:=s;
    8: Label_neuron8.Caption:=s;
    9: Label_neuron9.Caption:=s;
    10: Label_neuron10.Caption:=s;
    11: Label_neuron11.Caption:=s;
    12: Label_neuron12.Caption:=s;
    13: Label_neuron13.Caption:=s;
    14: Label_neuron14.Caption:=s;
    15: Label_neuron15.Caption:=s;
    16: Label_neuron16.Caption:=s;
    17: Label_neuron17.Caption:=s;
    18: Label_neuron18.Caption:=s;
    19: Label_neuron19.Caption:=s;
    20: Label_neuron20.Caption:=s;
    21: Label_neuron21.Caption:=s;
    22: Label_neuron22.Caption:=s;
    23: Label_neuron23.Caption:=s;
    24: Label_neuron24.Caption:=s;
    25: Label_neuron25.Caption:=s;
    end;
  end;
end;

procedure TForm1.PB_w_1Paint(Sender: TObject);
var active_x,active_y,cell_x,cell_y:integer; dx,dy:real; w_min,w_max:real; C:byte;
begin
  with (sender as TPaintBox) do
  begin
    active_x:=(tag mod s_width); if active_x=0 then active_x:=s_width;
    active_y:=(tag div s_width)+1; if active_x=s_width then active_y:=active_y-1;
    w_min:=L1_w[active_x,active_y,1,1]; w_max:=L1_w[active_x,active_y,1,1];
    for cell_x:=1 to s_width do
      for cell_y:=1 to s_height do
      begin
        if L1_w[active_x,active_y,cell_x,cell_y]<w_min then w_min:=L1_w[active_x,active_y,cell_x,cell_y];
        if L1_w[active_x,active_y,cell_x,cell_y]>w_max then w_max:=L1_w[active_x,active_y,cell_x,cell_y];
      end;

    dx:=width/s_width;
    dy:=Height/s_height;
    Canvas.Pen.Color:=clBlack;
    Canvas.Brush.Style:=bsSolid;
    for cell_x:=1 to s_width do
      for cell_y:=1 to s_height do
      begin
        if w_max-w_min<>0
        then C:=255-trunc(255*(L1_w[active_x,active_y,cell_x,cell_y]-w_min)/(w_max-w_min))
        else C:=255;
        Canvas.Brush.Color:=RGBToColor(C,C,C);
        Canvas.Rectangle(trunc((cell_x-1)*dx),trunc((cell_y-1)*dy),
                         trunc(cell_x*dx),trunc(cell_y*dy));
        Canvas.Frame(trunc((cell_x-1)*dx),trunc((cell_y-1)*dy),
                     trunc(cell_x*dx),trunc(cell_y*dy));
      end;
  end;
end;

procedure TForm1.Redraw_orig_cell(Sender:TObject; x,y:integer);
var dx,dy:real;
begin
  with (sender as TPaintBox) do
  begin
    Canvas.Pen.Color:=clBlack;
    Canvas.Brush.Style:=bsSolid;
    dx:=width/s_width;
    dy:=Height/s_height;
    if Orig_elements[tag,x,y]=1
    then Canvas.Brush.Color:=clBlack
    else Canvas.Brush.Color:=clWhite;
    Canvas.Rectangle(trunc((x-1)*dx),trunc((y-1)*dy),trunc(x*dx),trunc(y*dy));
  end;
end;

procedure TForm1.BTN_stepClick(Sender: TObject);
var i,cell_x,cell_y,active_x,active_y:integer;
begin
  for cell_x:=1 to s_width do
  for cell_y:=1 to s_height do
    L1_out[cell_x,cell_y]:=S_elements[cell_x,cell_y];

  for i:=1 to 1000 do
  begin
    active_x:=random(s_width)+1;
    active_y:=random(s_height)+1;
    L1_scalar[active_x,active_y]:=0;
    for cell_x:=1 to s_width do
      for cell_y:=1 to s_height do
        L1_scalar[active_x,active_y]:=L1_scalar[active_x,active_y]+
           L1_out[cell_x,cell_y]*L1_w[active_x,active_y,cell_x,cell_y];

    L1_out[active_x,active_y]:=(sigmoid(L1_scalar[active_x,active_y])-0.5)*2;
  end;

  Redraw_widgets;
end;

procedure TForm1.BTN_W_resetClick(Sender: TObject);
var cell_x,cell_y,active_x,active_y:integer;
begin
  for active_x:=1 to s_width do
  for active_y:=1 to s_height do
    for cell_x:=1 to s_width do
    for cell_y:=1 to s_height do
        L1_w[active_x,active_y,cell_x,cell_y]:=0;

  BTN_orig1_learn.tag:=abs(BTN_orig1_learn.tag);
  BTN_orig2_learn.tag:=abs(BTN_orig2_learn.tag);
  BTN_orig3_learn.tag:=abs(BTN_orig3_learn.tag);
  BTN_orig4_learn.tag:=abs(BTN_orig4_learn.tag);
  BTN_stepClick(self);
end;

procedure TForm1.BTN_orig1_learnClick(Sender: TObject);
var cell_x,cell_y,active_x,active_y,active_orig:integer;
begin
  active_orig:=abs((Sender as TButton).tag);
  for active_x:=1 to s_width do
  for active_y:=1 to s_height do
    for cell_x:=1 to s_width do
    for cell_y:=1 to s_height do
      if not((active_x=cell_x) and (active_y=cell_y)) then
        if (Sender as TButton).tag>0 then
        L1_w[active_x,active_y,cell_x,cell_y]:=L1_w[active_x,active_y,cell_x,cell_y]+
           Orig_elements[active_orig,active_x,active_y]*Orig_elements[active_orig,cell_x,cell_y]
        else
        L1_w[active_x,active_y,cell_x,cell_y]:=L1_w[active_x,active_y,cell_x,cell_y]-
           Orig_elements[active_orig,active_x,active_y]*Orig_elements[active_orig,cell_x,cell_y];

  (Sender as TButton).tag:=-(Sender as TButton).tag;
  BTN_stepClick(self);
end;

procedure TForm1.BTN_neurons_out_forgetClick(Sender: TObject);
var cell_x,cell_y,active_x,active_y:integer;
begin
  for active_x:=1 to s_width do
  for active_y:=1 to s_height do
    for cell_x:=1 to s_width do
    for cell_y:=1 to s_height do
      if not((active_x=cell_x) and (active_y=cell_y)) then
        L1_w[active_x,active_y,cell_x,cell_y]:=L1_w[active_x,active_y,cell_x,cell_y]-
                             0.1*L1_out[active_x,active_y]*L1_out[cell_x,cell_y];

  BTN_stepClick(self);
end;

procedure TForm1.BTN_orig1_drawClick(Sender: TObject);
var cell_x,cell_y:integer;
begin
  for cell_x:=1 to s_width do
    for cell_y:=1 to s_height do
      with Sender as TButton do
        S_elements[cell_x,cell_y]:=Orig_elements[tag,cell_x,cell_y];

  BTN_stepClick(self);
end;

procedure TForm1.BTN_orig_createClick(Sender: TObject);
var i,k,cell_x,cell_y,rnd_x,rnd_y:integer;
begin
  for i:=1 to n_origs do
    for cell_x:=1 to s_width do
      for cell_y:=1 to s_height do
        Orig_elements[i,cell_x,cell_y]:=-1;

  for i:=1 to n_origs do
    for k:=1 to 10 do
    begin
      rnd_x:=random(s_width)+1;
      rnd_y:=random(s_height)+1;
      Orig_elements[i,rnd_x,rnd_y]:=1;
    end;

  BTN_orig1_learn.tag:=abs(BTN_orig1_learn.tag);
  BTN_orig2_learn.tag:=abs(BTN_orig2_learn.tag);
  BTN_orig3_learn.tag:=abs(BTN_orig3_learn.tag);
  BTN_orig4_learn.tag:=abs(BTN_orig4_learn.tag);
  BTN_W_resetClick(self);
  BTN_stepClick(self);
end;

procedure TForm1.BTN_S_resetClick(Sender: TObject);
var cell_x,cell_y:integer;
begin
   for cell_x:=1 to s_width do
   for cell_y:=1 to s_height do
     S_elements[cell_x,cell_y]:=-1;

   BTN_stepClick(self);
end;

procedure TForm1.FormCreate(Sender: TObject);
var active_x,active_y,cell_x,cell_y:integer;
begin
  randomize;
  for active_x:=1 to s_width do
  for active_y:=1 to s_height do
    for cell_x:=1 to s_width do
    for cell_y:=1 to s_height do
        L1_w[active_x,active_y,cell_x,cell_y]:=0;
  Redraw_widgets;
end;

end.


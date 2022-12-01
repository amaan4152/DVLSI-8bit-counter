/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : S-2021.06-SP2
// Date      : Wed Nov 30 23:27:59 2022
/////////////////////////////////////////////////////////////


module counter ( VDD, VSS, clk, down, rst_n, count );
  output [7:0] count;
  inout VDD, VSS;
  input clk, down, rst_n;
  wire VDD, VSS, N21, N22, N23, N24, N25, N26, N27, N28, n2, n3, n4, n5, n6, n7, n8,
         n11, n12;

  DFCNQD1 \count_reg[7]  ( .VDD(VDD), .VSS(VSS), .D(N28), .CP(clk), .CDN(rst_n), .Q(count[7]) );
  DFCNQD1 \count_reg[6]  ( .VDD(VDD), .VSS(VSS), .D(N27), .CP(clk), .CDN(rst_n), .Q(count[6]) );
  DFCNQD1 \count_reg[5]  ( .VDD(VDD), .VSS(VSS), .D(N26), .CP(clk), .CDN(rst_n), .Q(count[5]) );
  DFCNQD1 \count_reg[4]  ( .VDD(VDD), .VSS(VSS), .D(N25), .CP(clk), .CDN(n12), .Q(count[4]) );
  DFCNQD1 \count_reg[3]  ( .VDD(VDD), .VSS(VSS), .D(N24), .CP(clk), .CDN(n12), .Q(count[3]) );
  DFCNQD1 \count_reg[2]  ( .VDD(VDD), .VSS(VSS), .D(N23), .CP(clk), .CDN(n12), .Q(count[2]) );
  DFCNQD1 \count_reg[1]  ( .VDD(VDD), .VSS(VSS), .D(N22), .CP(clk), .CDN(n12), .Q(count[1]) );
  DFCNQD1 \count_reg[0]  ( .VDD(VDD), .VSS(VSS), .D(N21), .CP(clk), .CDN(n12), .Q(count[0]) );
  INVD0 U4 ( .VDD(VDD), .VSS(VSS), .I(count[0]), .ZN(N21) );
  XOR2D0 U5 ( .VDD(VDD), .VSS(VSS), .A1(n11), .A2(count[7]), .Z(n2) );
  XOR2D0 U6 ( .VDD(VDD), .VSS(VSS), .A1(n3), .A2(n2), .Z(N28) );
  FA1D0 U7 ( .VDD(VDD), .VSS(VSS), .A(count[6]), .B(n11), .CI(n4), .CO(n3), .S(N27) );
  FA1D0 U8 ( .VDD(VDD), .VSS(VSS), .A(count[5]), .B(n11), .CI(n5), .CO(n4), .S(N26) );
  FA1D0 U9 ( .VDD(VDD), .VSS(VSS), .A(count[4]), .B(n11), .CI(n6), .CO(n5), .S(N25) );
  FA1D0 U10 ( .VDD(VDD), .VSS(VSS), .A(count[3]), .B(down), .CI(n7), .CO(n6), .S(N24) );
  FA1D0 U11 ( .VDD(VDD), .VSS(VSS), .A(count[2]), .B(down), .CI(n8), .CO(n7), .S(N23) );
  FA1D0 U12 ( .VDD(VDD), .VSS(VSS), .A(count[1]), .B(down), .CI(count[0]), .CO(n8), .S(N22) );
  BUFFD1 U13 ( .VDD(VDD), .VSS(VSS), .I(down), .Z(n11) );
  BUFFD1 U14 ( .VDD(VDD), .VSS(VSS), .I(rst_n), .Z(n12) );
endmodule


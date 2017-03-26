module test;

  reg a;
  reg b;
  wire out;

  and(out, a, b);

  initial begin

    $dumpvars(1, test);
    #5;
    a = 0;
    b = 0;

    #5;
    a = 1;

    #5;
    b = 1;

    #5;
    a = 1;

    #5 $finish;

  end

endmodule

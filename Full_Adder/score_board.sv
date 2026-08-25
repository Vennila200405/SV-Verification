class scoreboard;

  transaction tr;
  mailbox mon_scr;

  bit expected_sum;
  bit expected_carry;

  function new(mailbox mon_scr);
    this.mon_scr = mon_scr;
  endfunction

  task run();
    forever begin

      mon_scr.get(tr);

      expected_sum = tr.a ^ tr.b ^ tr.c;

      expected_carry = (tr.a & tr.b) |
                       (tr.b & tr.c) |
                       (tr.a & tr.c);

      if ((tr.sum == expected_sum) &&
          (tr.carry == expected_carry))

        $display("PASS: a=%0d b=%0d c=%0d sum=%0d carry=%0d",
                 tr.a, tr.b, tr.c, tr.sum, tr.carry);

      else

        $display("FAIL: a=%0d b=%0d c=%0d | Expected sum=%0d carry=%0d | Actual sum=%0d carry=%0d",
                 tr.a, tr.b, tr.c,
                 expected_sum, expected_carry,
                 tr.sum, tr.carry);

    end
  endtask

endclass

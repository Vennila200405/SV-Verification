class scoreboard;
  transaction tr;
  mailbox mon_scr;
  
  function new(mailbox mon_scr);
    this.mon_scr = mon_scr;
  endfunction
  
  task run();
    forever begin
      mon_scr.get(tr);
      
      if ((tr.rst==1 && tr.q==0)|| (tr.rst ==0 && tr.q==tr.d))
      $display("========= PASS=========");
      else
        $display("========FAIL=========");
    end
      endtask
  
    endclass

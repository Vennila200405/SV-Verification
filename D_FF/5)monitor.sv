class monitor;
  virtual inf vif;
  mailbox mon_scr;
  transaction tr;
  
  function new(virtual inf vif,mailbox mon_scr);
    this.vif=vif;
    this.mon_scr=mon_scr;
  endfunction
  
  task run();
    forever begin
      tr=new();
      @(posedge vif.clk)
      tr.rst=vif.rst;
      tr.d=vif.d;
      tr.q=vif.q;
      mon_scr.put(tr);
    end
  endtask
  endclass

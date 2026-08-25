class environment;
  generator  gen;
  driver     drv;
  monitor    mon;
  scoreboard scb;
  mailbox gen_drv;
  mailbox mon_scr;
  virtual inf vif;

  function new(virtual inf vif);
    this.vif = vif;
    gen_drv = new();
    mon_scr = new();
    gen = new(gen_drv);
    drv = new(gen_drv, vif);
    mon = new(mon_scr, vif);
    scb = new(mon_scr);
  endfunction

  task run();

    fork
      gen.run();
      drv.run();
      mon.run();
      scb.run();
    join_any;

  endtask
endclass

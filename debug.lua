vmms = require 'vmms'
vmm = require 'vmm'
debugger = require 'debugger'
vcore = require 'vcore'
linux = require 'linux'

--[=====[
The function
  debugger.interactive(bp, v)
can be used in breakpoints handling callbacks to invoke the interactive debugger of
used directly as a breakpoint callback
  bp = breakpoints.acquire(vmm, "$linux:_raw_spin_lock", debugger.interactivek)
this Lua construct is equivalent to command line -debug-breakpoint $linux:_raw_spin_lock


-debug-breakpoint $linux:ret_to_user
-debug-breakpoint $el1h_64_irq
-debug-breakpoint $gic_handle_irq
-debug-breakpoint $linux:wake_page_function
-debug-breakpoint $linux:vm_interrupt
-debug-breakpoint $linux:cpu_startup_entry
-debug-breakpoint $linux:folio_wait_bit_common
-debug-breakpoint bl1:SynchronousExceptionA64
-debug-breakpoint #cpu:rvbar_el3
-debug-breakpoint $linux:__primary_switched
-debug-breakpoint $linux:filemap_read_folio
-debug-breakpoint $linux:load_elf_binary
-debug-breakpoint $linux:arm64_enter_nmi
-debug-breakpoint $linux:search_binary_handler


--]=====]

vmm = vmms.get('default')


function on_bl31(bp, v)
  print("bl31_entrypoint passed")
end

-- bp1 = breakpoints.acquire(vmm, "bl31:bl31_entrypoint", on_bl31)

--bp1 = breakpoints.acquire(vmm, "0x04014120", debugger.interactive)
-- bp1 = breakpoints.acquire(vmm, "0x04014150", debugger.interactive)

-- the following are OK
--bp1 = breakpoints.acquire(vmm, "0x40141b8", debugger.interactive)
--bp1 = breakpoints.acquire(vmm, "bl2:exit_loop_civac", on__civac)


-- investigate msr daifclr,4
-- bp1 = breakpoints.acquire(vmm, "0x410006c", debugger.interactive)

-- debug ERET
--bp1 = breakpoints.acquire(vmm, "0x040177e8", debugger.interactive)
-- 0x4023000
-- start stepping automatically at a selected function
--bp1 = breakpoints.acquire(vmm, "bl31:bl31_entrypoint", debugger.step)

-- --------------------------------------------------------

--bp1 = breakpoints.acquire(vmm, "bl2:bl2_run_next_image", debugger.interactive)
-- bp1 = breakpoints.acquire(vmm, "bl2:bl2_entrypoint", debugger.interactive)

-- --------------------------------------------------------


--bp1 = breakpoints.acquire(vmm, "0xf8", debugger.interactive)
--bp1 = breakpoints.acquire(vmm, "bl1:smc_handler64", debugger.interactive)

--bp1 = breakpoints.acquire(vmm, "bl1:el3_exit", debugger.step)
-- bp1 = breakpoints.acquire(vmm, "bl1:bl1_setup", debugger.interactive)
-- bp_restore = breakpoints.acquire(vmm, "bl1:el1_sysregs_context_restore", debugger.interactive)
-- debug at eret bl1:el3_exit
-- bpexception2 = breakpoints.acquire(vmm, "0x04103200", debugger.interactive)

bpexception2 = breakpoints.acquire(vmm, "0x0410006c", debugger.interactive)
-- --------------------------------------------------------

function on_ExceptionX(bp, v)
  print("Intercepted exception vbar_el3:sync_sp_elx\n")
  debugger.interactive(bp, v)
end

function on_Exception0(bp, v)
  print("Intercepted exception vbar_el3:sync_sp_el0\n")
  debugger.interactive(bp, v)
end


--bpexception_sp0 = breakpoints.acquire(vmm, "#vbar_el3:sync_sp_el0", on_Exception0)

-- bpexception_200 = breakpoints.acquire(vmm, "0x200", on_ExceptionX)

--bpexception_spx = breakpoints.acquire(vmm, "#vbar_el3:sync_sp_elx", on_ExceptionX)

-- breakpoints to start debugging at the first instruction

-- bpexception = breakpoints.acquire(vmm, "#rvbar_el3", debugger.interactive)

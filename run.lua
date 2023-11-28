config = require 'config'
vcore = require 'vcore'

function on_patch_trigger(core, i, count, symbol)
    --print(string.format("Patch step %d/%d @%s:%s done.", i, count, symbol.origin, symbol.name))
--[===[
    if (i == 4) then
        config.trace_bitmap_set(0x20000000)
        print("Activating virtio debug")
    end
--]===]

    vm_exits, msr, smc, intercept, stepped, time = vcore.get_stats(core)
    print("vm_exits=", vm_exits)
    print("msr=", msr)
    print("smc=", smc)
    print("intercept=", intercept)
    print("stepped=", stepped)
    print("time=", time)
 end
 
